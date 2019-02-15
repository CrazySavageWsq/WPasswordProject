//
//  PersonalViewController.m
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/29.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalCenterCell.h"
#import "PrivacyAgreementVC.h"

@interface PersonalViewController ()

@property(nonatomic, strong)NSMutableArray *pdataSouce;

@end

@implementation PersonalViewController

- (void)viewWillAppear:(BOOL)animated{
    
     APPDELEGATE.tabbarManager.bagImageView.hidden = NO;
    [super viewWillAppear:animated];
    
    
}

- (void)viewWillDisappear:(BOOL)animated{
    if (self.navigationController.viewControllers.count>=2) {
        APPDELEGATE.tabbarManager.bagImageView.hidden = YES;
    }
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
     self.isHideBack =YES;
    [super viewDidLoad];
    [self setNavContentMenuTitle:@"个人中心"];
    [self createPersonalCenterDataSocuce];
    [self createPTableView];
    
    ///是否需要导航栏上的那条线
    navBarHairlineImageView =nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



///创建数据源
-(void)createPersonalCenterDataSocuce{
    
    NSArray *data =@[@{@"title":@"首页背景图"},@{@"title":@"设置"},@{@"title":@"清除所有记录"},@{@"title":@"隐私协议"},@{@"title":@"关关于APP"}];
    _pdataSouce = [NSMutableArray arrayWithArray:data];
 
    [self.wTableView reloadData];
}

///创建列表
- (void)createPTableView{
    [self createWtableViewWithFrame:self.view.frame WithStyle:UITableViewStylePlain WithBackColor:color_background];
    self.wTableView.scrollEnabled  =NO;//禁止滑动
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _pdataSouce.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PersonalCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalCenterCell"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"PersonalCenterCell" owner:nil options:nil] lastObject];
        cell.selectionStyle =0;
    }
    cell.titleL.text = _pdataSouce[indexPath.row][@"title"];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            
            break;
            
        case 1:
            
            break;
            
        case 2:
            
            break;
            
        case 3:
            
            break;
            
        case 4:{
            PrivacyAgreementVC *vc = [PrivacyAgreementVC new];
            vc.nameString = @"AboutApp";
            vc.titleString =@"关于APP";
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            
            break;
            
        default:
            break;
    }
}

@end
