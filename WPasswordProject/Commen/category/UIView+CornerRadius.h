//
//  UIView+CornerRadius.h
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/27.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CornerRadius)

/**
 添加圆角边框
  */
-(void)addCornerRadiusWithcornerRadius:(NSInteger )cornerRadius andborderWidth:(NSInteger)width andColor:(UIColor *)color;

@end
