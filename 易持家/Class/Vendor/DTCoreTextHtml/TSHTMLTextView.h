//
//  TSHTMLTextView.h
//  RealTimeTeacher4Students
//
//  Created by mac on 12/29/14.
//  Copyright (c) 2014 com.guorenzhicheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSHTMLTextView;

@protocol TSHTMLTextViewDelegate <NSObject>

@optional

- (void)HTMLTextViewDidChangeSize:(TSHTMLTextView *)HTMLTextView;

@end


@interface TSHTMLTextView : UIView

@property (nonatomic, copy) NSString *HTMLString;

@property (nonatomic, weak) id<TSHTMLTextViewDelegate> textDelegate;

+ (NSString *)HTMLStringWithText:(NSString *)text;

+ (NSString *)HTMLStringWithText:(NSString *)text
                        fontSize:(CGFloat)fontSize;

+ (NSString *)filterIllegalCharacters:(NSString *)text;

- (void)setHTMLTextViewDisplay;

@end
