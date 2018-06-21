//
//  LTSettingTipsView.m
//  RACTest
//
//  Created by 全速 on 2018/4/21.
//  Copyright © 2018年 全速. All rights reserved.
//

#import "LTSettingTipsView.h"

@implementation LTSettingTipsView

+ (instancetype)settingTipsViewWithSettingString:(NSString *)settingString Url:(NSString *)url{
    LTSettingTipsView *tips = [[LTSettingTipsView alloc] init];
    tips.infoLabel.text = settingString;
    tips.urlString = url;
    return tips;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        [self createView];
    }
    return self;
}

- (void)createView{
    _disappearBtn = [UIButton new];
    _infoLabel = [UILabel new];
    _openBtn = [UIButton new];
    [self lt_addSubviews:@[_disappearBtn, _infoLabel, _openBtn]];
    [self updateFrame];
    
    _disappearBtn.backgroundColor = [UIColor orangeColor];

    _openBtn.backgroundColor = [UIColor whiteColor];
    _openBtn.layer.masksToBounds = YES;
    _openBtn.layer.cornerRadius = kNumFrom375(12.5f);
    [_openBtn setTitle:@"去开启" forState:UIControlStateNormal];
    [_openBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    _openBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    
    _infoLabel.font = [UIFont systemFontOfSize:12.f];
    
    [_disappearBtn addTarget:self action:@selector(disappearAction) forControlEvents:UIControlEventTouchUpInside];
    [_openBtn addTarget:self action:@selector(openURLAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)openURLAction{
    NSLog(@"去设置....");
    if (!(self.urlString.length>0)) {
        return;
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.urlString]];
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.urlString] options:@{} completionHandler:^(BOOL success) {
            if (success) {
                NSLog(@"打开成功");
                [self disappearAction];
            }else{
                NSLog(@"打开失败");
            }
        }];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.urlString]];
    }
}

- (void)disappearAction{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.frame;
        self.frame = CGRectMake(kScreenW+frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}
- (void)dealloc{
    NSLog(@"已销毁");
}


- (void)updateFrame{
    [_disappearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(kNumFrom375(10));
        make.size.mas_equalTo(CGSizeMake(kNumFrom375(15), kNumFrom375(15)));
    }];
    [_openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kNumFrom375(60), kNumFrom375(25)));
        make.right.equalTo(self.mas_right).with.offset(-kNumFrom375(10));
    }];
    [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(_disappearBtn.mas_right).with.offset(kNumFrom375(15));
        make.right.equalTo(_openBtn.mas_left).with.offset(-kNumFrom375(15));
    }];
}
@end
