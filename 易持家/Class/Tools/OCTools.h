//
//  OCTools.h
//  EasyLiving
//
//  Created by 王木木 on 16/5/27.
//  Copyright © 2016年 王木木. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OCTools : NSObject

//根据宽度求高度  content 计算的内容  width 计算的宽度 font字体大小

+ (CGFloat)getHeightWithContent:(NSString *)content
                          width:(CGFloat)width
                           font:(CGFloat)font;

//根据高度度求宽度  content 计算的内容  Height 计算的高度 font字体大小

+ (CGFloat)getWidthWithContent:(NSString *)content
                        height:(CGFloat)height
                          font:(CGFloat)font;

//获取判断图片的正则表达式

+ (NSString *)getHtmlUrlImage;

@end

