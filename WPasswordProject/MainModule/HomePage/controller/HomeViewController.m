//
//  HomeViewController.m
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/29.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//

#import "HomeViewController.h"
#import "SetecPasswordVC.h"//选择解锁


@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
  
    [super viewDidLoad];
    [self setNavContentMenuTitle:@"首页"];
      navBarHairlineImageView =nil;
    
    [self showUnlockView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 弹出解锁页面
 */
-(void)showUnlockView{
    
    [self presentViewController:[SetecPasswordVC new] animated:YES completion:^{
        
    }];
    
}



@end
