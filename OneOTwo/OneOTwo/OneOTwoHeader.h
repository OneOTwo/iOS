//
//  OneOTwoHeader.h
//  OneOTwo
//
//  Created by 郭良烜 on 2017/5/18.
//  Copyright © 2017年 郭良烜. All rights reserved.
//

#ifndef OneOTwoHeader_h
#define OneOTwoHeader_h

// 提供RGB模式的UIColor定义.
#define     kRGBCOLOR(r,g,b)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define     kRGBA(r,g,b,a)    [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//背景颜色
#define kBackgroundColor       kRGBCOLOR(244, 245, 246)
#define kMainTextColor         kRGBCOLOR(64, 64, 64)
#define kSubRedColor           kRGBCOLOR(255,88,85)

// 屏幕宽 高
#define kScreenHeight          [UIScreen mainScreen].bounds.size.height
#define kScreenWidth           [UIScreen mainScreen].bounds.size.width

/*
 * @缩放比例系数
 */
#define kScale_W               (kScreenWidth/375.000)
#define kScale_H               (kScreenHeight/667.000)

//全局字体
#define kMainFontSize(x)       [UIFont systemFontOfSize:x]
#define kMainBoldFontSize(x)   [UIFont boldSystemFontOfSize:x]

//提示框
#define kAlertShow(msg) [[[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show]

//版本号
#define kVersion      @"1.0"

//系统版本
#define kSystemVersion [[[UIDevice currentDevice]systemVersion]floatValue]

//获取沙盒Document路径
#define kGET_DOCUMENT_DIRECTORY   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define OUTLINE

#ifdef OUTLINE
//测试地址
#define kBASE_URL     @""
#define kProjectName  [NSString stringWithFormat:@"%@",kBASE_URL]

#else
//线上地址
#define kBASE_URL     @""
#define kProjectName  [NSString stringWithFormat:@"%@",kBASE_URL]

#endif

#endif /* OneOTwoHeader_h */
