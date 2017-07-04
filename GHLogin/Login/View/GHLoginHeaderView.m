
//
//  GHLoginHeaderView.m
//  GHLogin
//
//  Created by eiboran-imac5k on 2017/7/3.
//  Copyright © 2017年 eiboran-imac5k. All rights reserved.
//

#import "GHLoginHeaderView.h"
#import "Masonry.h"

@interface GHLoginHeaderView()
@property (nonatomic , strong) UIImageView *logo;

@end
@implementation GHLoginHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.logo];
    [self.logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

- (UIImageView *)logo {
    if (_logo == nil) {
        _logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png"]];
        _logo.layer.masksToBounds = YES;
        _logo.layer.cornerRadius = 5;
        [_logo sizeToFit];
    }
    return _logo;
}

@end
