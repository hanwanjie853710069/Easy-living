//
//  TSHTMLTextView.m
//  RealTimeTeacher4Students
//
//  Created by mac on 12/29/14.
//  Copyright (c) 2014 com.guorenzhicheng. All rights reserved.
//

#import "TSHTMLTextView.h"

@interface TSHTMLTextView ()<DTLazyImageViewDelegate,DTAttributedTextContentViewDelegate>

@property (nonatomic, strong) DTAttributedTextView *textView;

@end


@implementation TSHTMLTextView
@synthesize HTMLString = _HTMLString;
@synthesize textDelegate = _textDelegate;
@synthesize textView = _textView;

- (void)setHTMLString:(NSString *)HTMLString {
    if (_HTMLString != HTMLString) {
        
        _HTMLString = HTMLString;
        
        self.textView.attributedString = [self attributedStringForSnippetUsingiOS6Attributes:NO];
        [self.textView.attributedTextContentView setNeedsDisplay];
        
        NSLog(@"HTMLString:%@", HTMLString);
        
    }
}

- (id)init {
    if (self = [self initWithFrame:CGRectZero]) {
        
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.clipsToBounds = YES;
        
        self.textView = [[DTAttributedTextView alloc] initWithFrame:frame];
        self.textView.shouldDrawImages = NO;
        self.textView.shouldDrawLinks = NO;
        self.textView.textDelegate = self;
        self.textView.attributedTextContentView.userInteractionEnabled = YES;
        self.textView.userInteractionEnabled = YES;
        self.textView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.textView];
        
        self.backgroundColor = [UIColor clearColor];
        self.textView.attributedTextContentView.backgroundColor = [UIColor clearColor];
        self.textView.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (NSAttributedString *)attributedStringForSnippetUsingiOS6Attributes:(BOOL)useiOS6Attributes {
    
    NSData *data = [self.HTMLString dataUsingEncoding:NSUTF8StringEncoding];
    
    CGSize maxImageSize = CGSizeMake(self.bounds.size.width - 20.0, self.bounds.size.height - 20.0);
    
    void (^callBackBlock)(DTHTMLElement *element) = ^(DTHTMLElement *element) {
        
        for (DTHTMLElement *oneChildElement in element.childNodes) {
            
            if (oneChildElement.displayStyle == DTHTMLElementDisplayStyleInline && oneChildElement.textAttachment.displaySize.height > 2.0 * oneChildElement.fontDescriptor.pointSize) {
                oneChildElement.displayStyle = DTHTMLElementDisplayStyleBlock;
                oneChildElement.paragraphStyle.minimumLineHeight = element.textAttachment.displaySize.height;
                oneChildElement.paragraphStyle.maximumLineHeight = element.textAttachment.displaySize.height;
            }
        }
    };
    
    NSMutableDictionary *options = [NSMutableDictionary new];
    
    [options setObject:[NSNumber numberWithFloat:1.0]
                forKey:NSTextSizeMultiplierDocumentOption];
    
    [options setObject:[NSValue valueWithCGSize:maxImageSize]
                forKey:DTMaxImageSize];
    
    [options setObject:@"Times New Roman"
                forKey:DTDefaultFontFamily];
    
    [options setObject:@"purple"
                forKey:DTDefaultLinkColor];
    
    [options setObject:callBackBlock
                forKey:DTWillFlushBlockCallBack];
    
    if (useiOS6Attributes) {
        [options setObject:[NSNumber numberWithBool:YES] forKey:DTUseiOS6Attributes];
    }
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithHTMLData:data
                                                                      options:options
                                                           documentAttributes:NULL];
    return string;
}

#pragma mark - DTAttributedTextContentViewDelegate Methods
- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView
                    viewForAttachment:(DTTextAttachment *)attachment
                                frame:(CGRect)frame {
    
    if ([attachment isKindOfClass:[DTImageTextAttachment class]]) {
        
        DTLazyImageView *imageView = [[DTLazyImageView alloc] initWithFrame:frame];
        imageView.delegate = self;
        
        imageView.image = [(DTImageTextAttachment *)attachment image];
        
        imageView.url = attachment.contentURL;
        
        return imageView;
    }
    
    return nil;
}

- (BOOL)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView
 shouldDrawBackgroundForTextBlock:(DTTextBlock *)textBlock
                            frame:(CGRect)frame
                          context:(CGContextRef)context
                   forLayoutFrame:(DTCoreTextLayoutFrame *)layoutFrame {
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(frame,1,1) cornerRadius:10];
    
    CGColorRef color = [textBlock.backgroundColor CGColor];
    if (color) {
        CGContextSetFillColorWithColor(context, color);
        CGContextAddPath(context, [roundedRect CGPath]);
        CGContextFillPath(context);
        
        CGContextAddPath(context, [roundedRect CGPath]);
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
        CGContextStrokePath(context);
        return NO;
    }
    
    return YES;
}

#pragma mark - DTLazyImageViewDelegate Methods

- (void)lazyImageView:(DTLazyImageView *)lazyImageView
   didChangeImageSize:(CGSize)size {
    NSURL *url = lazyImageView.url;
    CGSize imageSize = size;
    
    if (imageSize.width > self.width) {
        
        imageSize.width = self.width;
        imageSize.height = (self.width / imageSize.width) * imageSize.height;
    }
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"contentURL == %@", url];
    
    BOOL didUpdate = NO;
    
    for (DTTextAttachment *oneAttachment in [_textView.attributedTextContentView.layoutFrame textAttachmentsWithPredicate:pred]) {
        
        if (CGSizeEqualToSize(oneAttachment.originalSize, CGSizeZero)) {
            oneAttachment.originalSize = imageSize;
            
            didUpdate = YES;
        }
    }
    
    if (didUpdate) {
        [_textView relayoutText];
        [self sizeToFit];
    }
}


#pragma mark - UIView Methods

- (CGSize)sizeThatFits:(CGSize)size {
    
    CGSize tSize = [self.textView.attributedTextContentView suggestedFrameSizeToFitEntireStringConstraintedToWidth:self.bounds.size.width];
    DTLogDebug(@"%@", NSStringFromCGSize(tSize));
    
    tSize.height += (self.textView.contentInset.top + self.textView.contentInset.bottom);
    
    self.size = tSize;
    [self.textDelegate HTMLTextViewDidChangeSize:self];
    
    return tSize;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}



#pragma mark - Public Methods
+ (NSString *)HTMLStringWithText:(NSString *)text {
    
    return [TSHTMLTextView HTMLStringWithText:text fontSize:16];
}

+ (NSString *)HTMLStringWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize {
    
    
    NSString *aText = [TSHTMLTextView filterIllegalCharacters:text];
    
    NSMutableString *string = [NSMutableString string];
    
    [string appendFormat:@"<p style='font-size:%.0fpx'>", fontSize];
    
    NSString *replaceWithString = @"<img style='vertical-align:middle;' src='$1'/>";
    NSString *regexString = kStringRegexMatchImageURLsRegexString;
    
    NSString *replacedString = [aText stringByReplacingOccurrencesOfRegex:regexString withString:replaceWithString options:RKLCaseless range:NSMakeRange(0, aText.length) error:nil];
    
    if (replacedString) {
        
        [string appendString:replacedString];
    }
    
    [string appendString:@"</p>"];
    
    DTLogDebug(@"%@", string);
    
    return string;
}

- (void)setHTMLTextViewDisplay {
    
    [self.textView.attributedTextContentView setNeedsDisplay];
}

#pragma mark - Private Methods

+ (NSString *)filterIllegalCharacters:(NSString *)text {
    
    NSString *aText = [text stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" &nbsp;"];
    
    return aText;
}

@end
