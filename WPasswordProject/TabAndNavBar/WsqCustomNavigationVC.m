//
//  WsqCustomNavigationVC.m
//  WsqSuitProject
//
//  Created by webapps on 16/8/11.
//  Copyright © 2016年 webapps. All rights reserved.
//

#import "WsqCustomNavigationVC.h"

@interface WsqCustomNavigationVC ()<UINavigationControllerDelegate>

@end

@implementation WsqCustomNavigationVC

// 是否支持自动转屏
- (BOOL)shouldAutorotate
{
    return [self.visibleViewController shouldAutorotate];
}
// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.visibleViewController supportedInterfaceOrientations];
}

// 默认的屏幕方向（当前ViewController必须是通过模态出来的UIViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
}




- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.view.backgroundColor =[UIColor whiteColor];
}






- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {

        viewController.hidesBottomBarWhenPushed = YES;
        
        
    }
    [super pushViewController:viewController animated:YES];

}




@end
