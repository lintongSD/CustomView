//
//  LTAgreeProtocolView.h
//  RACTest
//
//  Created by 全速 on 2018/4/18.
//  Copyright © 2018年 全速. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTAgreeProtocolView : UIView
@property (strong, nonatomic) UIButton *agreeBtn;
@property (strong, nonatomic) UILabel *protocolLabel;

- (void)agreeProtocolWithString:(NSString *)protocolString Range:(NSRange)range icon:(UIImage *)icon;
@end
