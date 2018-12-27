//
//  UIView+Action.h
//  SmallPigsFarm
//
//  Created by webapps on 2017/6/27.
//  Copyright © 2017年 wsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Action)


/**
 给控件添加点击事件 UIVIew、UILable、UIImageView等

 @param clickedAction 返回点击事件
 */
- (void)addClickedBlock:(void (^)(id))clickedAction;
@end
