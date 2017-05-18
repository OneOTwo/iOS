//
//  BaseViewController.m
//  OneOTwo
//
//  Created by 郭良烜 on 2017/5/18.
//  Copyright © 2017年 郭良烜. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property(nonatomic,strong)UILabel *navText;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavView];
}

-(void)setNavView{
    self.view.backgroundColor=kBackgroundColor;
    
    _navView=[[UIView alloc]initWithFrame:CGRectZero];
    _navView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_navView];
    [_navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@64);
    }];
    
    if(self.navigationController.viewControllers.count>1){
        UIButton *backBtn=[[UIButton alloc]initWithFrame:CGRectZero];
        [backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(goBackAction) forControlEvents:UIControlEventTouchUpInside];
        [_navView addSubview:backBtn];
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(20);
            make.left.equalTo(self.view.mas_left).offset(13);
            make.width.equalTo(@44);
            make.height.equalTo(@44);
        }];
        [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 25)];
    }
}
-(void)goBackAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

//MARK:-
//MARK: 设置title
-(void)setTitle:(NSString *)title{
    self.navText.text=title;
}
-(UILabel*)navText{
    if (_navText == nil) {
        _navText=[[UILabel alloc]initWithFrame:CGRectZero];
        _navText.font=kMainFontSize(16);
        _navText.textColor=kMainTextColor;
        _navText.textAlignment=NSTextAlignmentCenter;
        [_navView addSubview:_navText];
        [_navText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_navView.mas_left).offset(55);
            make.right.equalTo(_navView.mas_right).offset(-55);
            make.top.equalTo(_navView.mas_top).offset(20);
            make.bottom.equalTo(_navView.mas_bottom);
        }];
    }
    return _navText;
}
//MARK:没有数据显示视图
-(void)noMsgShowTitle:(UIView*)view withframe:(CGRect)frame{
    if (![view viewWithTag:110]) {
        UILabel *title_lb=[[UILabel alloc]initWithFrame:frame];
        title_lb.text=@"暂无数据";
        title_lb.tag=110;
        title_lb.font=kMainFontSize(18);
        title_lb.textColor=kMainTextColor;
        title_lb.backgroundColor=[UIColor whiteColor];
        title_lb.textAlignment=NSTextAlignmentCenter;
        [view addSubview:title_lb];
    }
}
-(void)dismissTitleLbfromVIew:(UIView*)view{
    UILabel *title_lb=[view viewWithTag:110];
    [title_lb removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
