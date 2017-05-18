//
//  AlertShowView.h
//  OneOTwo
//
//  Created by 郭良烜 on 2017/5/18.
//  Copyright © 2017年 郭良烜. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertBlock)();
@interface AlertShowView : UIView

/** 设置alertView背景色 */
@property (nonatomic, copy) UIColor *alertBackgroundColor;
/** 设置确定按钮背景色 */
@property (nonatomic, copy) UIColor *btnConfirmBackgroundColor;
/** 设置取消按钮背景色 */
@property (nonatomic, copy) UIColor *btnCancelBackgroundColor;
/** 设置message字体颜色 */
@property (nonatomic, copy) UIColor *messageColor;
/** 点击确定回调的block */
@property (nonatomic, copy) AlertBlock block;
/** 弹出alertView以及点击确定回调的block */
-(void)alertViewControllerWithMessage:(NSString *)message andBlock:(AlertBlock) block;

@end
