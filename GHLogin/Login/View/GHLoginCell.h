//
//  GHLoginCell.h
//  GHLogin
//
//  Created by eiboran-imac5k on 2017/7/3.
//  Copyright © 2017年 eiboran-imac5k. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GHDataModel,GHLoginCell;
@protocol GHLoginCellDelegate <NSObject>
@optional

- (void)loginCell: (GHLoginCell *)loginCell button: (id)button;
- (void)loginCell: (GHLoginCell *)loginCell textField: (UITextField *)textField;

@end
@interface GHLoginCell : UITableViewCell
@property (nonatomic , strong)GHDataModel *dataModel;
@property (nonatomic , weak) id <GHLoginCellDelegate>delegate;
@end
