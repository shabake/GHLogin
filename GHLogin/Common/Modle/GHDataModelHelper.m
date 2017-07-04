//
//  ZCDataModelHelper.m
//  eiboran
//
//  Created by eiboran-imac5k on 2017/6/23.
//  Copyright © 2017年 eiboran-imac5k. All rights reserved.
//

#import "GHDataModelHelper.h"

@implementation GHDataModelHelper
+ (instancetype)dataModelHepler {
    static GHDataModelHelper *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[GHDataModelHelper alloc]init];
    });
    return _instance;
}

- (NSArray *)creatLoginDataArray {
    
    NSArray *array = @[
                       @{
                           @"title" : @"请输入用户邮箱",
                           @"textFieldHidden" : @"0",
                           @"tag" : @"0",
                           @"sendCodeHidden" : @"1",
                           @"lineHidden":@"0",
                           @"choseHidden":@"1",

                           @"loginHidden":@"1"
                           },
                       @{
                           @"title" : @"请输入验证码",
                           @"textFieldHidden" : @"0",
                           @"textFieldTag" : @"102",
                           @"sendCodeHidden" : @"0",
                           @"lineHidden":@"0",
                           @"loginHidden":@"1",
                           @"choseHidden":@"1",
                           @"tag" : @"1",

                           },
                       @{
                           @"title" : @"请输入密码",
                           @"choseHidden":@"1",
                           @"tag" : @"2",

                           @"textFieldHidden" : @"0",
                           @"sendCodeHidden" : @"1",
                           @"lineHidden":@"1",
                           @"loginHidden":@"1"
                           },
                  
                       @{
                           @"title" : @"登录",
                           @"choseHidden":@"1",
                           @"tag" : @"4",
                           @"textFieldHidden" : @"1",
                           @"textFieldTag" : @"102",
                           @"sendCodeHidden" : @"1",
                           @"lineHidden":@"0",
                           @"loginHidden":@"0"
                           
                           },
                 
                       ];
    return array;
}
@end
