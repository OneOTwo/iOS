//
//  BaseViewController.h
//  OneOTwo
//
//  Created by 郭良烜 on 2017/5/18.
//  Copyright © 2017年 郭良烜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property(nonatomic,strong)UIView *navView;

-(void)noMsgShowTitle:(UIView*)view withframe:(CGRect)frame;

-(void)dismissTitleLbfromVIew:(UIView*)view;

@end
