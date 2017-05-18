//
//  TabbarViewController.m
//  OneOTwo
//
//  Created by 郭良烜 on 2017/5/18.
//  Copyright © 2017年 郭良烜. All rights reserved.
//

#import "TabbarViewController.h"

@interface TabbarViewController ()

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    [self CreateMrketController];
}
-(void)CreateMrketController
{
    /*//首页
     HomepageController *homePage = [[HomepageController alloc]init];
     BaseNavViewController *navHomePage = [[BaseNavViewController alloc]initWithRootViewController:homePage];
     
     //附近
     NearViewController *nearVc = [[NearViewController alloc]init];
     BaseNavViewController *navNear = [[BaseNavViewController alloc]initWithRootViewController:nearVc];
     
     //市场
     MarketController *marketVC = [[MarketController alloc]init];
     BaseNavViewController *navMarket = [[BaseNavViewController alloc]initWithRootViewController:marketVC];
     
     //我的
     PersonalController *PersonalVC = [[PersonalController alloc]init];
     BaseNavViewController *navPersonal = [[BaseNavViewController alloc]initWithRootViewController:PersonalVC];
     
     self.viewControllers = @[navHomePage,navNear,navMarket,navPersonal];
     
     [self setTabBarItemTitle:@"首页" Image:@"01_05a" SelectedImage:@"01_05b" AtIndex:0];
     [self setTabBarItemTitle:@"附近" Image:@"01_06a" SelectedImage:@"01_06b" AtIndex:1];
     [self setTabBarItemTitle:@"市场" Image:@"01_07a" SelectedImage:@"01_07b" AtIndex:2];
     [self setTabBarItemTitle:@"我的" Image:@"01_08a" SelectedImage:@"01_08b" AtIndex:3];*/
}
- (void)setTabBarItemTitle:(NSString *)title
                     Image:(NSString *)image
             SelectedImage:(NSString *)selectedImage
                   AtIndex:(NSInteger)index {

  if (self.tabBar.items.count > index) {

    UITabBarItem *item = [self.tabBar.items objectAtIndex:index];

    [item setTitle:title];

    [item
        setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                 UIColorFromRGB(0x878787),
                                                 NSForegroundColorAttributeName,
                                                 [UIFont systemFontOfSize:11.0],
                                                 NSFontAttributeName, nil]
                      forState:UIControlStateNormal];

    [item
        setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                 kRGBCOLOR(252, 61, 78),
                                                 NSForegroundColorAttributeName,
                                                 [UIFont systemFontOfSize:11.0],
                                                 NSFontAttributeName, nil]
                      forState:UIControlStateSelected];

    [item setSelectedImage:
              [[UIImage imageNamed:selectedImage]
                  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

    [item setImage:
              [[UIImage imageNamed:image]
                  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
  }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
