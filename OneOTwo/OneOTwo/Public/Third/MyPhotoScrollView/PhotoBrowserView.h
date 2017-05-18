//
//  PhotoBrowserView.h
//  SPH0
//
//  Created by NEW on 15/12/14.
//  Copyright © 2015年 SPH. All rights reserved.
//

/**
 *类文件说明：用于显示一组网络图片，有放大功能,和拖动功能
 */

#import <UIKit/UIKit.h>

@interface PhotoBrowserView : UIView

/**
 * array 图片url 数组
 */


/**
* index 要显示的第几张图片
*/


- (instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray *)array andCurrentIndex:(int)index;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com