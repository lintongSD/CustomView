//
//  LTAgreeProtocolView.m
//  RACTest
//
//  Created by 全速 on 2018/4/18.
//  Copyright © 2018年 全速. All rights reserved.
//

#import "LTAgreeProtocolView.h"

@implementation LTAgreeProtocolView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

- (void)createView{
    _agreeBtn = [UIButton new];
    _protocolLabel = [UILabel new];
    [self lt_addSubviews:@[_agreeBtn, _protocolLabel]];
    [self updateFrame];
    [_agreeBtn setImage:[UIImage imageNamed:@"lbd_icon_agree_normal"] forState:UIControlStateNormal];
}

- (void)agreeProtocolWithString:(NSString *)protocolString Range:(NSRange)range icon:(UIImage *)icon{
    [_agreeBtn setImage:icon?:[UIImage imageNamed:@"lbd_icon_agree_normal"] forState:UIControlStateNormal];
    _protocolLabel.font = [UIFont systemFontOfSize:12.f];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:protocolString];
    [attrStr addAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} range:range];
    
    _protocolLabel.attributedText = attrStr;
}

- (void)updateFrame{
    [_protocolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    [_agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_protocolLabel.mas_left).with.offset(-kNumFrom375(5));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kNumFrom375(16), kNumFrom375(16)));
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
