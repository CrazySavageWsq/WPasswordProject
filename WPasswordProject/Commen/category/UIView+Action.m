//
//  UIView+Action.m
//  SmallPigsFarm
//
//  Created by webapps on 2017/6/27.
//  Copyright © 2017年 wsq. All rights reserved.
//

#import "UIView+Action.h"
#import <objc/message.h>

@interface UIView ()

@property void(^clickedAction)(id);

@end


@implementation UIView (Action)

- (void)setClickedAction:(void (^)(id))clickedAction{
    
    objc_setAssociatedObject(self, @"AddClickedEvent", clickedAction,  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}


- (void (^)(id))clickedAction{
    
    return objc_getAssociatedObject(self, @"AddClickedEvent");
}

- (void)addClickedBlock:(void (^)(id))clickedAction{
    
    self.clickedAction = clickedAction;
    // hy:先判断当前是否有交互事件，如果没有的话。。。所有gesture的交互事件都会被添加进gestureRecognizers中
    if (![self gestureRecognizers]) {
        self.userInteractionEnabled = YES;
        // hy:添加单击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
    }

}


-(void)tapAction{
    if (self.clickedAction) {
        self.clickedAction(self);
    }
}

@end
