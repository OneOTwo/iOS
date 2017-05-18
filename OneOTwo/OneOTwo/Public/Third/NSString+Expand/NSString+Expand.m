//
//  NSString+Expand.m
//  OneOTwo
//
//  Created by 郭良烜 on 2017/5/18.
//  Copyright © 2017年 郭良烜. All rights reserved.
//

#import "NSString+Expand.h"

@implementation NSString (Expand)

//MARK: 获取cell高度
-(CGFloat)getAttributedStrHeight:(float)space andFont:(UIFont*)font andLabelWidth:(float)width;
{
    NSMutableAttributedString *attributedString = [self adjustmentLineSpacingSpace:space andFont:font];
    
    CGRect re =  [attributedString boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    
    return re.size.height;
}

//MARK: 调整字体 行间距
-(NSMutableAttributedString*)adjustmentLineSpacingSpace:(float)space andFont:(UIFont*)font
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];//调整行间距
    [paragraphStyle setAlignment:NSTextAlignmentLeft];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [self length])];
    
    return attributedString;
}

-(CGFloat)getTextWidthfont:(UIFont *)font labelHeight:(float)height
{
    //CGSize size = [self sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, height) lineBreakMode:NSLineBreakByCharWrapping];
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.width;
}

-(CGFloat)getTextHeightfont:(UIFont *)font labelWidth:(float)width
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.height;
}
//改变指定字符串颜色
-(NSMutableAttributedString*)specifiedString:(NSString*)specifiedStr withColor:(UIColor*)color{
    NSMutableAttributedString *attributedStr=[[NSMutableAttributedString alloc] initWithString:self];
    
    if (specifiedStr.length==0) {
        specifiedStr=@" ";
    }
    NSRange range = [self rangeOfString:specifiedStr];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    return attributedStr;
}

//改变指定字符串大小
-(NSMutableAttributedString*)specifiedString:(NSString*)str withFont:(CGFloat)font{
    NSMutableAttributedString *attributedStr=[[NSMutableAttributedString alloc] initWithString:self];
    
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, self.length)];
    
    if (str.length!=0) {
        NSRange range = [self rangeOfString:str];
        [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:range];
    }
    return attributedStr;
}
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    //"YYYY-MM-dd hh:mm:ss",hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:format];
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    //转时间
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp/1000];
    
    return [formatter stringFromDate:confromTimesp];
}

@end
