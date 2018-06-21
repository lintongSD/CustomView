//
//  LTSettingTipsView.h
//  RACTest
//
//  Created by 全速 on 2018/4/21.
//  Copyright © 2018年 全速. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTSettingTipsView : UIView
@property (strong, nonatomic) UIButton *disappearBtn;
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) UIButton *openBtn;
//设置url
@property (copy, nonatomic) NSString *urlString;
/**
 @param settingString 提示信息
 @param url 不想打开url可以自己添加事件
 */
+ (instancetype)settingTipsViewWithSettingString:(NSString *)settingString Url:(NSString *)url;

@end
