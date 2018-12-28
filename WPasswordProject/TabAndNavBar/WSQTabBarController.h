//
//  WSQTabBarController.h
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/27.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WsqCustomNavigationVC.h"

@interface WSQTabBarController : UITabBarController

/** 当前选中的底部导航栏的按钮 */
@property (nonatomic) NSInteger tabbarSelectedIndex;
/** 当前选中的底部导航栏的按钮的导航栏 */
@property(nonatomic, strong) WsqCustomNavigationVC *currentNavigtion;
/** 人为的底部导航栏 */
@property (nonatomic, strong) UIImageView * bagImageView;

@end
