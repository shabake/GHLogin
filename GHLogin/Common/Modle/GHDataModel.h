//
//  ZCDataModel.h
//  eiboran
//
//  Created by eiboran-imac5k on 2017/6/23.
//  Copyright © 2017年 eiboran-imac5k. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHDataModel : NSObject
@property (nonatomic , copy) NSString *tag;
@property (nonatomic , strong)NSIndexPath *indexPath;

@property (nonatomic , copy) NSString *choseHidden;

@property (nonatomic , copy) NSString *textFieldHidden;
@property (nonatomic , copy) NSString *textFieldTag;
@property (nonatomic , copy) NSString *sendCodeHidden;
@property (nonatomic , copy) NSString *lineHidden;
@property (nonatomic , copy) NSString *loginHidden;

/// 状态码
@property (nonatomic , copy) NSString *code;
/// 服务器返回信息
@property (nonatomic , copy) NSString *message;

/// data 数组类型
@property (nonatomic , strong) NSArray *data;
@property (nonatomic , copy) NSString *userid;
@property (nonatomic , copy) NSString *token;
@property (nonatomic , copy) NSString *testid;
@property (nonatomic , copy) NSString *testNo;
@property (nonatomic , copy) NSString *type;
@property (nonatomic , copy) NSString *type_cn;
@property (nonatomic , copy) NSString *score;
@property (nonatomic , copy) NSString *testTitle;
@property (nonatomic , copy) NSString *answerid;
@property (nonatomic , copy) NSString *color;
@property (nonatomic , copy) NSString *cardmaxnum;
@property (nonatomic , copy) NSString *examid;
@property (nonatomic , copy) NSString *isrand;
@property (nonatomic , copy) NSString *paperid;


/// 地点
@property (nonatomic , copy) NSString *address;

/// 时间
@property (nonatomic , copy) NSString *day;
/// 报名id
@property (nonatomic , copy) NSString *signupId;
/// 展示图片
@property (nonatomic , copy) NSString *img;
/// 已报名人数
@property (nonatomic , copy) NSString *ordernum;
/// 活动总人数
@property (nonatomic , copy) NSString *peoplenum;
/// 价格，单位元，0-免费
@property (nonatomic , copy) NSString *price;

/// 按钮显示文字
@property (nonatomic , copy) NSString *status;
/// 标题
@property (nonatomic , copy) NSString *title;
/// 0-不跳转，1-跳转支付
@property (nonatomic , copy) NSString *url;
@end
