//
//  BaseNavViewController.m
//  OneOTwo
//
//  Created by 郭良烜 on 2017/5/18.
//  Copyright © 2017年 郭良烜. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //滑动手势代理
    __weak BaseNavViewController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
    
    //调整字体位置
    [self.tabBarItem setTitlePositionAdjustment:UIOffsetMake(2, -2)];
    
    //隐藏导航
    self.navigationBarHidden=YES;
}
//MARK:push事件代理方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.interactivePopGestureRecognizer.enabled = NO;//滑动手势关闭
    }
    
    if ( self.viewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

//MARK:滑动手势设置 控制器出现后打开
- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        //到根控制器的时候不可以把滑动返回手势打开，否则会出bug
        if(self.viewControllers.count!=1){
            self.interactivePopGestureRecognizer.enabled = YES;
        }else{
            self.interactivePopGestureRecognizer.enabled = NO;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
