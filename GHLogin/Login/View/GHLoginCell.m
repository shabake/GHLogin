//
//  GHLoginCell.m
//  GHLogin
//
//  Created by eiboran-imac5k on 2017/7/3.
//  Copyright © 2017年 eiboran-imac5k. All rights reserved.
//

#import "GHLoginCell.h"
#import "Masonry.h"
#import "GHDataModel.h"
#import "DDSMSButton.h"
#define kScreenWidth     [UIScreen mainScreen].bounds.size.width
#define kScreenHeight     [UIScreen mainScreen].bounds.size.height

@interface GHLoginCell()<UITextFieldDelegate>
@property (nonatomic , strong) UITextField *textView;
@property (nonatomic , strong) UIButton *registe;
@property (nonatomic , strong) UIButton *chose;
/// 验证码
@property (nonatomic , strong)DDSMSButton *sendCode;
@end
@implementation GHLoginCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        [self setupUI];
    }
    return self;
}
#pragma mark - 输入框代理方法
-(void)textFieldDidChange :(UITextField *)textField {
    [textField becomeFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginCell:textField:)]) {
        [self.delegate loginCell:self textField:textField];
    }
}
#pragma mark - 注册/发送验证码事件
- (void)clickButton: (UIButton *)button {
    button.selected = !button.selected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginCell:button:)]) {
        [self.delegate loginCell:self button:button];
    }
}


- (void)setupUI {
    [self.contentView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.width.equalTo(@(kScreenWidth * 0.8));
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        
    }];
    
    
    [self.contentView addSubview:self.registe];
    [self.registe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.width.equalTo(@(kScreenWidth * 0.8));
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        
    }];
    
    [self.contentView addSubview:self.chose];
    [self.chose mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textView);
        make.width.equalTo(@(kScreenWidth * 0.4));
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@21);
        
    }];
    
    [self.textView addSubview:self.sendCode];
    [self.sendCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.textView).offset(-10);
        make.width.equalTo(@(kScreenWidth * 0.4));
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(self.textView);
        
    }];
}


#pragma mark - set方法
- (void)setDataModel:(GHDataModel *)dataModel {
    _dataModel = dataModel;
    
    self.textView.placeholder = dataModel.title;
    self.textView.hidden = dataModel.textFieldHidden.integerValue;
    self.registe.hidden = dataModel.loginHidden.integerValue;
    self.chose.hidden = dataModel.choseHidden.integerValue;
    self.sendCode.hidden = dataModel.sendCodeHidden.integerValue;
    self.textView.tag = dataModel.tag.integerValue;
    self.registe.tag = dataModel.tag.integerValue;
    self.chose.tag = dataModel.tag.integerValue;
    self.sendCode.tag = dataModel.tag.integerValue;
    
}

#pragma mark - 懒加载
- (DDSMSButton *)sendCode {
    if (_sendCode == nil) {
        _sendCode = [[DDSMSButton alloc]init];
        _sendCode.enabled = YES;
        [_sendCode setTitle:@"获取验证码" forState:UIControlStateNormal];
        _sendCode.titleLabel.font = [UIFont fontWithName:@"Arial" size:14.0f];
        [_sendCode setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [_sendCode setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_sendCode setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        [_sendCode addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendCode;
}
- (UIButton *)chose {
    if (_chose == nil) {
        _chose = [[UIButton alloc]init];
        [_chose setTitle:@"请选择" forState:UIControlStateNormal];
        [_chose setImage:[UIImage imageNamed:@"dx_checkbox_on"] forState:UIControlStateNormal];
        [_chose setImage:[UIImage imageNamed:@"dx_checkbox_off"] forState:UIControlStateSelected];
        [_chose setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_chose addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        _chose.titleLabel.textAlignment = NSTextAlignmentLeft;
        _chose.titleLabel.font = [UIFont fontWithName:@"Arial" size:14.0f];
        _chose.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
        _chose.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
    }
    return _chose;
}
- (UIButton *)registe {
    if (_registe == nil) {
        _registe = [[UIButton alloc]init];
        [_registe setTitle:@"注 册" forState:UIControlStateNormal];
        [_registe setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registe addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        _registe.backgroundColor = [UIColor redColor];
        _registe.layer.masksToBounds = YES;
        _registe.layer.cornerRadius = 5;
    }
    return _registe;
}
- (UITextField *)textView {
    if (_textView == nil) {
        _textView = [[UITextField alloc]init];
        _textView.layer.masksToBounds = YES;
        _textView.layer.cornerRadius = 5;
        _textView.layer.borderColor = [UIColor whiteColor].CGColor;
        _textView.layer.borderWidth = 0.5;
        _textView.tintColor = [UIColor darkGrayColor];
        _textView.delegate = self;
        _textView.textColor = [UIColor whiteColor];
        _textView.font = [UIFont fontWithName:@"Arial" size:14.0f];
        _textView.leftView = [[UIView alloc]initWithFrame:CGRectMake(10, 1, 7, 26)];
        _textView.leftViewMode = UITextFieldViewModeAlways;
        [_textView addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }
    return _textView;
}


@end
