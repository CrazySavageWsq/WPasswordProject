//
//  WGestureLockVC.h
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/25.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//  手势密码界面 控制器

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,WUnlockType) {
    WUnlockTypeCreatePsw, // 创建手势密码
    WUnlockTypeValidatePsw // 校验手势密码
};

@interface WGestureLockVC : UIViewController

+ (void)deleteGesturesPassword;//删除手势密码
+ (NSString *)gesturesPassword;//获取手势密码
//+ (BOOL)setgesturesPassword;//是否设置过了手势密码

- (instancetype)initWithUnlockType:(WUnlockType)unlockType;

@end
