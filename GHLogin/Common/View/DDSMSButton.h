//
//  CTSMSButton.h
//  CuaTeng
//
//  Created by zombieZJ on 16/8/19.
//  Copyright © 2016年 Cuateng. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DDSMSButton;
typedef NSString* (^CountDownChanging)(DDSMSButton *SMSButton,NSUInteger second);
typedef NSString* (^CountDownFinished)(DDSMSButton *SMSButton,NSUInteger second);

typedef void (^TouchedSMSButtonButtonBlock)(DDSMSButton *button,NSInteger tag);


@interface DDSMSButton : UIButton
{
    NSInteger _second;
    NSUInteger _totalSecond;
    
    NSDate *_startDate;
    
    CountDownChanging _countDownChanging;
    CountDownFinished _countDownFinished;
    TouchedSMSButtonButtonBlock _touchedSMSButtonBlock;
}

@property (nonatomic , strong)NSTimer *timer;

-(void)SMSButtonBlock:(TouchedSMSButtonButtonBlock)touchedCountDownButtonBlock;
-(void)countDownChanging:(CountDownChanging)countDownChanging;
-(void)countDownFinished:(CountDownFinished)countDownFinished;

-(void)startCountDownWithSecond:(NSUInteger)second;
-(void)stopCountDown;

@end
