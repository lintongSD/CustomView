//
//  ShowViewController.m
//  CustomView
//
//  Created by 全速 on 2018/6/19.
//  Copyright © 2018年 lin-tong. All rights reserved.
//

#import "ShowViewController.h"
#import "LTDetailSlectBtn.h"
#import "LTDetailStringView.h"
#import "LTDirectionBtn.h"
#import "UIButton+Extension.h"
#import "LTSettingTipsView.h"
#import "LTAgreeProtocolView.h"
@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    
}

- (void)createView{
    //详情的按钮
    LTDetailSlectBtn *btn = [LTDetailSlectBtn detailBtnTitle:@"title" subTitle:@"subTitle" rightImage:nil];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //详情View
    LTDetailStringView *stringView = [LTDetailStringView detailStringViewTitle:@"titleString" subText:@""];
    stringView.backgroundColor = [UIColor randomColor];
    
    //控制图片位置的按钮
    LTDirectionBtn *directionBtn = [LTDirectionBtn directionBtnWithType:DirectionBtnTypeRight margin:10];
    [directionBtn setTitle:@"查看更多" forState:UIControlStateNormal];
    [directionBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [directionBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [directionBtn addTarget:self action:@selector(directionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //按钮倒计时
    UIButton *getCodeBtn = [UIButton new];
    [getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getCodeBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [getCodeBtn addTarget:self action:@selector(getCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    LTSettingTipsView *tipsView = [LTSettingTipsView settingTipsViewWithSettingString:@"去打开WIFI" Url:@"App-Prefs:root=WIFI"];
    
    LTAgreeProtocolView *protocolView = [LTAgreeProtocolView new];
    [protocolView agreeProtocolWithString:@"请仔细阅读<MIT协议条款>" Range:NSMakeRange(5,9) icon:nil];

    
    NSArray *viewArr = @[btn, stringView, directionBtn, getCodeBtn, tipsView, protocolView];
    for (UIView *view in viewArr) {
        view.hidden = YES;
    }
    [self.view lt_addSubviews:viewArr];
    UIView *selectedView = viewArr[self.index];
    selectedView.hidden = NO;
    
    
    
    
    
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(kScreenW, 40));
    }];
    [stringView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(btn);
    }];
    [directionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [tipsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(btn);
    }];
    [protocolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(btn);
    }];
}


- (void)btnAction:(LTDetailSlectBtn *)btn{
    btn.subLabel.text = @"你已经选择了我";
}

- (void)directionBtnAction:(LTDirectionBtn *)btn{
    btn.directionType = btn.directionType==4?1:btn.directionType+1;
}

- (void)getCodeAction:(UIButton *)btn{
    [btn getCodeWithInterVale:5 EndTitle:@"重新获取"];
}


@end
