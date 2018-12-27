//
//  UIView+CornerRadius.m
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/27.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)

-(void)addCornerRadiusWithcornerRadius:(NSInteger )cornerRadius andborderWidth:(NSInteger)width andColor:(UIColor *)color{
    
    self.layer.masksToBounds=YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = width;
    self.layer.borderColor = [color CGColor];
    
}

@end
