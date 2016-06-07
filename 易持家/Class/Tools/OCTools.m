//
//  OCTools.m
//  EasyLiving
//
//  Created by 王木木 on 16/5/27.
//  Copyright © 2016年 王木木. All rights reserved.
//

#import "OCTools.h"

@implementation OCTools
//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小

+ (CGFloat)getHeightWithContent:(NSString *)content width:(CGFloat)width font:(CGFloat)font{
    
    CGRect rect = [content boundingRectWithSize:CGSizeMake(width, 1000999)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                        context:nil];
    return rect.size.height;
}

//根据高度度求宽度  content 计算的内容  Height 计算的高度 font字体大小

+ (CGFloat)getWidthWithContent:(NSString *)content height:(CGFloat)height font:(CGFloat)font{
    
    CGRect rect = [content boundingRectWithSize:CGSizeMake(100000, height)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                        context:nil];
    return rect.size.width;
}

//获取判断图片的正则表达式

+ (NSString *)getHtmlUrlImage{
    
    NSString *urlImage =  @"((http[s]{0,1})://[a-zA-Z0-9\\.\\-\\_\\/\\!\\@\\#\\$\\%\\&\\*\\+\\?\\<\\>\\~]+(swf|gif|jpg|bmp|jpeg|png))";
    
    return urlImage;
    
}

@end
