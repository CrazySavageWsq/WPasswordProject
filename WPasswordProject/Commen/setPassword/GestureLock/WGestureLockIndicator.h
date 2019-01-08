//
//  WGestureLockIndicator.h
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/25.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//  九宫格指示器 小图

#import <UIKit/UIKit.h>

@interface WGestureLockIndicator : UIView

//设置小指示图
- (void)setGesturePassword:(NSString *)gesturePassword;
//清除轨迹
- (void)cleanPasssword;

@end
