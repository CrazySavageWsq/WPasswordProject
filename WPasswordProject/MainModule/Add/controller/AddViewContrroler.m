//
//  AddViewContrroler.m
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/29.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//

#import "AddViewContrroler.h"

@interface AddViewContrroler ()

@end

@implementation AddViewContrroler




- (void)viewDidLoad {
     self.isHideBack =YES;
    [super viewDidLoad];
   
//    self.navigationController.navigationBar.hidden =NO;
    [self setNavContentMenuTitle:@"添加"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
