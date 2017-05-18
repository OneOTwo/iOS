//
//  AlertShowView.m
//  OneOTwo
//
//  Created by 郭良烜 on 2017/5/18.
//  Copyright © 2017年 郭良烜. All rights reserved.
//

#import "AlertShowView.h"

@interface AlertShowView()

@property(nonatomic,strong)UILabel * lblMessage;

@end

@implementation AlertShowView

+(id)shareInstance {
    static dispatch_once_t onceToken;
    static AlertShowView *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[AlertShowView alloc] init];
    });
    return instance;
}
-(instancetype)init {
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self setUI];
    }
    return self;
}

-(void)setUI
{
    //创建蒙版
    UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    showView.backgroundColor = [UIColor colorWithWhite:0.1f alpha:0.4];
    [self addSubview:showView];
    //创建提示框view
    UIView *alertView = [[UIView alloc] initWithFrame:CGRectZero];
    alertView.backgroundColor = [UIColor whiteColor];
    alertView.layer.masksToBounds = YES;
    alertView.layer.cornerRadius = 5;
    [showView addSubview:alertView];
    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(showView.mas_left).offset(35 * kScale_W);
        make.right.equalTo(showView.mas_right).offset(-35 * kScale_W);
        make.centerY.equalTo(showView.mas_centerY);
        make.height.mas_equalTo(105 + 85 * kScale_H);
    }];
    //创建操作提示 label
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
    [alertView addSubview:label];
    label.text = @"付款";
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = NSTextAlignmentCenter;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alertView.mas_top);
        make.centerX.equalTo(alertView.mas_centerX);
        make.height.mas_equalTo(50);
    }];
    //创建上面灰色分割线
    UILabel *UpLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [alertView addSubview:UpLabel];
    UpLabel.backgroundColor = kBackgroundColor;
    [UpLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom);
        make.left.equalTo(alertView.mas_left);
        make.right.equalTo(alertView.mas_right);
        make.height.mas_equalTo(1);
    }];
    //创建message label
    _lblMessage = [[UILabel alloc] initWithFrame:CGRectZero];
    _lblMessage.textColor = kMainTextColor;
    [alertView addSubview:_lblMessage];
    _lblMessage.textAlignment = NSTextAlignmentCenter;
    _lblMessage.numberOfLines = 1;
    _lblMessage.font = [UIFont fontWithName:@"Arial" size:35];
    [_lblMessage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(UpLabel.mas_bottom);
        make.left.equalTo(alertView.mas_left);
        make.right.equalTo(alertView.mas_right);
        make.height.mas_equalTo(85 * kScale_H);
    }];
    //创建下面灰色分割线
    UILabel *downLine = [[UILabel alloc] initWithFrame:CGRectZero];
    [alertView addSubview:downLine];
    downLine.backgroundColor = kBackgroundColor;
    [downLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lblMessage.mas_bottom);
        make.left.equalTo(alertView.mas_left);
        make.right.equalTo(alertView.mas_right);
        make.height.mas_equalTo(1);
    }];
    
    CGFloat btnWidth = kScreenWidth/2 - 35 * kScale_W;
    //创建确定 取消按钮
    UIButton * btnCancel = [[UIButton alloc] initWithFrame:CGRectZero];
    [alertView addSubview:btnCancel];
    [btnCancel setTitleColor:kMainTextColor forState:UIControlStateNormal];
    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [btnCancel setBackgroundColor:self.btnCancelBackgroundColor];
    btnCancel.tag = 0;
    [btnCancel addTarget:self action:@selector(didClickBtnConfirm:) forControlEvents:UIControlEventTouchUpInside];
    [btnCancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(downLine.mas_bottom);
        make.left.equalTo(alertView.mas_left);
        make.width.mas_equalTo(btnWidth);
        make.bottom.equalTo(alertView.mas_bottom);
    }];
    //确定按钮
    UIButton * btnConfirm = [[UIButton alloc] initWithFrame:CGRectZero];
    btnConfirm.tag = 1;
    [alertView addSubview:btnConfirm];
    [btnConfirm setTitleColor:kMainTextColor forState:UIControlStateNormal];
    [btnConfirm setTitle:@"确定" forState:UIControlStateNormal];
    [btnConfirm setBackgroundColor:self.btnConfirmBackgroundColor];
    [btnConfirm addTarget:self action:@selector(didClickBtnConfirm:) forControlEvents:UIControlEventTouchUpInside];
    [btnConfirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(downLine.mas_bottom);
        make.right.equalTo(alertView.mas_right);
        make.width.mas_equalTo(btnWidth);
        make.bottom.equalTo(alertView.mas_bottom);
    }];
    //创建按钮中间灰色分割线
    UILabel *centerLine = [[UILabel alloc] initWithFrame:CGRectZero];
    [alertView addSubview:centerLine];
    centerLine.backgroundColor = kBackgroundColor;
    [centerLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(downLine.mas_bottom);
        make.centerX.equalTo(alertView.mas_centerX);
        make.width.mas_equalTo(1 * kScale_W);
        make.bottom.equalTo(alertView.mas_bottom);
    }];
}
-(void)alertViewControllerWithMessage:(NSString *)message andBlock:(AlertBlock) block
{
    self.block = block;
    _lblMessage.text = message;
}
/** 点击确定 or 取消触发事件 */
-(void)didClickBtnConfirm:(UIButton *)sender{
    
    if (sender.tag == 0) {
        [self removeFromSuperview];
        return;
    }
    self.block();
    [self removeFromSuperview];
}
-(UIColor *)alertBackgroundColor{
    
    if (_alertBackgroundColor == nil) {
        _alertBackgroundColor = [UIColor whiteColor];
    }
    return _alertBackgroundColor;
}

/** 确定按钮背景色 */
-(UIColor *)btnConfirmBackgroundColor{
    
    if (_btnConfirmBackgroundColor == nil) {
        _btnConfirmBackgroundColor = [UIColor whiteColor];
    }
    return _btnConfirmBackgroundColor;
}

/** 取消按钮背景色 */
-(UIColor *)btnCancelBackgroundColor{
    
    if (_btnCancelBackgroundColor == nil) {
        _btnCancelBackgroundColor = [UIColor whiteColor];
    }
    return _btnCancelBackgroundColor;
}

/** message字体颜色 */
-(UIColor *)messageColor{
    
    if (_messageColor == nil) {
        _messageColor = kMainTextColor;
    }
    return _messageColor;
}

@end
