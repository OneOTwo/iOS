//
//  NSString+Expand.h
//  OneOTwo
//
//  Created by 郭良烜 on 2017/5/18.
//  Copyright © 2017年 郭良烜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Expand)
/**
 *  计算AttributedString高度
 *  @param font     字体大小
 *  @param space    字体间距
 *  @param width    标签宽度
 */
-(CGFloat)getAttributedStrHeight:(float)space andFont:(UIFont*)font andLabelWidth:(float)width;

/**
 *  调整字体行间距
 *  @param font     字体大小
 *  @param space    需要调整的间距
 */
-(NSMutableAttributedString*)adjustmentLineSpacingSpace:(float)space andFont:(UIFont*)font;

/**获取到NSString文本的宽度*/
-(CGFloat)getTextWidthfont:(UIFont *)font labelHeight:(float)height;

/**获取NSString文本的高度*/
-(CGFloat)getTextHeightfont:(UIFont *)font labelWidth:(float)width;

/**改变指定字符颜色*/
-(NSMutableAttributedString*)specifiedString:(NSString*)specifiedStr withColor:(UIColor*)color;

/**改变指定字符字体大小*/
-(NSMutableAttributedString*)specifiedString:(NSString*)str withFont:(CGFloat)font;

/**时间戳转时间字符串*/
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;

@end
