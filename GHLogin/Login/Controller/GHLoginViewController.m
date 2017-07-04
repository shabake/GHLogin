
//
//  GHLoginViewController.m
//  GHLogin
//
//  Created by eiboran-imac5k on 2017/7/3.
//  Copyright © 2017年 eiboran-imac5k. All rights reserved.
//

#import "GHLoginViewController.h"
#import "GHLoginCell.h"
#import "GHLoginHeaderView.h"
#import "GHDataModel.h"
#import "GHDataModelHelper.h"
#import "MJExtension.h"
#import "DDSMSButton.h"
static NSString *GHLoginCellID = @"GHLoginCellID";


@interface GHLoginViewController ()<UITableViewDelegate,UITableViewDataSource,GHLoginCellDelegate>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSArray *dataArray;
@property (nonatomic , strong) GHLoginHeaderView *headerView;

@property (nonatomic , copy) NSString *emailAccount;
@property (nonatomic , copy) NSString *userCode;
@property (nonatomic , copy) NSString *serverCode;
@property (nonatomic , copy) NSString *password;
@property (nonatomic , strong) UIImageView *backImageView;
@end

@implementation GHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    [self loadData];
}
- (void)setupUI {
    [self.view addSubview:self.backImageView];
    [self.backImageView addSubview:self.tableView];
    self.tableView.tableHeaderView = self.headerView;
    
}


- (void)loadData {
    NSArray *tempArray= [[GHDataModelHelper dataModelHepler] creatLoginDataArray];
    self.dataArray = [GHDataModel mj_objectArrayWithKeyValuesArray:tempArray];
    
}

- (void)loginCell:(GHLoginCell *)loginCell button:(UIButton *)button {
    if (button.tag == 1) {
        
        DDSMSButton *sendButton = (DDSMSButton *)button;
        [sendButton startCountDownWithSecond:120];
        [sendButton countDownChanging:^NSString *(DDSMSButton *countDownButton,NSUInteger second) {
            NSString *title = [NSString stringWithFormat:@"已发送 %zd s",second];
            sendButton.userInteractionEnabled = NO;
            return title;
        }];
        
        [sendButton countDownFinished:^NSString *(DDSMSButton *countDownButton, NSUInteger second) {
            sendButton.userInteractionEnabled = YES;
            return @"获取验证码";
        }];
    } else if (button.tag == 4) {
        
    }
}

#pragma mark - cell - 输入框 代理方法
- (void)loginCell:(GHLoginCell *)loginCell textField:(UITextField *)textField {
    if (textField.tag == 0) {
        /// 获得用户名
        self.emailAccount = textField.text;
    } else if (textField.tag == 1) {
        /// 获得验证码
        self.userCode = textField.text;
        
    } else if (textField.tag == 2) {
        
        self.password = textField.text;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01f;
}
#pragma mark - 每组返回有几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
#pragma mark - 返回每组有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count ;
}
#pragma mark - 返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GHDataModel *dataModel = self.dataArray[indexPath.row];
    GHLoginCell *cell = [tableView dequeueReusableCellWithIdentifier:GHLoginCellID];
    cell.dataModel = dataModel;
    dataModel.indexPath = indexPath;
    cell.delegate = self;
    return cell;
    
}

#pragma mark - 懒加载
- (UIImageView *)backImageView {
    if (_backImageView == nil) {
        _backImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _backImageView.image = [UIImage imageNamed:@"login_register_background"];
        _backImageView.userInteractionEnabled = YES;
    }
    return _backImageView;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[GHLoginCell class] forCellReuseIdentifier:GHLoginCellID];
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.sectionFooterHeight = 0.01f;
        _tableView.sectionHeaderHeight = 0.01f;
        _tableView.rowHeight = 56;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (GHLoginHeaderView *)headerView {
    if (_headerView == nil) {
        _headerView = [[GHLoginHeaderView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 140)];
    }
    return _headerView;
}

- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

@end
