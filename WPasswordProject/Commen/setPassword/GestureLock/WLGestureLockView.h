//
//  WLGestureLockView.h
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/25.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//  九宫格 手势密码页面

#import <UIKit/UIKit.h>
@class WLGestureLockView;

//检测手势密码答案情况 对/错/不够4个数字
typedef NS_ENUM(NSUInteger, ResultKindType) {
    ResultKindTypeTrue,
    ResultKindTypeFalse,
    ResultKindTypeNoEnough,
    ResultKindTypeClear
};

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height

@protocol ZLGestureLockDelegate <NSObject>

- (void)gestureLockView:(WLGestureLockView *)lockView drawRectFinished:(NSMutableString *)gesturePassword;

@end

@interface WLGestureLockView : UIView

@property (assign, nonatomic) id<ZLGestureLockDelegate> delegate;

- (void)clearLockView;//清除布局 重新开始

- (void)checkPwdResult:(ResultKindType)resultType;

@end
