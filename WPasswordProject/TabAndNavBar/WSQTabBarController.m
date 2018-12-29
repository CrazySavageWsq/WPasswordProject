//
//  WSQTabBarController.m
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/27.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//

#import "WSQTabBarController.h"
#import "HomeViewController.h"
#import "AddViewContrroler.h"
#import "PersonalViewController.h"

@interface WSQTabBarController ()

@end

@implementation WSQTabBarController
{
    NSArray * normalImageArray;
    NSArray * selectedImageArray;
    NSArray * titleArray;
    UIButton * oldBtn;
    UILabel * MessageNum;
}
@synthesize bagImageView;

-(instancetype)init{

    self = [super init];
    
    if (self) {
        self.tabBar.hidden =YES;
        [self initTabarView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//初始化tabr名称
-(void)initTabrData{
    titleArray = @[@"首页",@"添加",@"我的"];
    
    /** 首页 */
    WsqCustomNavigationVC *homeRoot = [[WsqCustomNavigationVC alloc]initWithRootViewController:[HomeViewController new]];
    
    /** 添加 */
    WsqCustomNavigationVC *addRoot = [[WsqCustomNavigationVC alloc]initWithRootViewController:[AddViewContrroler new]];
    
    /** 个人中心 */
    WsqCustomNavigationVC *personalRoot = [[WsqCustomNavigationVC alloc]initWithRootViewController:[PersonalViewController new]];
    
    /** 设置tabar数组 */
    self.viewControllers = @[homeRoot,addRoot,personalRoot];
    self.currentNavigtion = homeRoot;
    
}

//初始化控制器
-(void)initTabarView{
    
    [self initTabrData];
    
    bagImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-TABBAR_HEIGHT, self.view.frame.size.width,TABBAR_HEIGHT)];
    
    bagImageView.userInteractionEnabled = YES;
    bagImageView.layer.shadowColor = RGB_gray(178).CGColor;
    bagImageView.layer.shadowOffset = CGSizeMake(0, -3);
    bagImageView.layer.shadowOpacity = 0.3f;
    bagImageView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.95f];
    [self.view addSubview:bagImageView];
    for (NSInteger i = 0; i<titleArray.count; i++) {
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(bagImageView.frame)/titleArray.count*i, 0, CGRectGetWidth(bagImageView.frame)/titleArray.count, 49)];
       
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:color_text_deep_333 forState:UIControlStateNormal];
        [button setTitleColor:color_main_normal forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(itemsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        button.titleLabel.font = [UIFont systemFontOfSize:10.0f];
        button.titleEdgeInsets = UIEdgeInsetsMake(35, -15, 1, 15);
        button.imageEdgeInsets = UIEdgeInsetsMake(3, (button.frame.size.width-30)/2, 16, (button.frame.size.width-30)/2);
        button.tag = 100+i;
        if(i==0){
            oldBtn = button;
            oldBtn.selected = YES;
            
        }else if (i==3){
            MessageNum = [[UILabel alloc]initWithFrame:CGRectMake(button.frame.size.width/2+8,6, 10, 10)];
            MessageNum.layer.cornerRadius = MessageNum.frame.size.height/2;
            MessageNum.clipsToBounds = YES;
            MessageNum.font = [UIFont systemFontOfSize:10.0f];
            MessageNum.textAlignment = NSTextAlignmentCenter;
            MessageNum.backgroundColor = color_main_normal;
            MessageNum.textColor = [UIColor whiteColor];
            MessageNum.hidden = YES;
            [button addSubview:MessageNum];
        }
        
        [bagImageView addSubview:button];
    }
}


-(void)itemsBtnClick:(UIButton*)sender
{
    if (sender.tag ==100) {
    }
    
    if (sender.tag == 101) {
    }
    if (sender.tag == 102){
    }
    
    
    if (oldBtn != sender) {
        oldBtn.selected = NO;
        oldBtn = sender;
        oldBtn.selected = YES;
        self.selectedIndex = sender.tag - 100;
        _tabbarSelectedIndex = sender.tag - 100;
        self.currentNavigtion = self.viewControllers[self.selectedIndex];
    }
  
    CGRect frame = oldBtn.imageView.frame;
    //    CGPoint center = oldBtn.imageView.center;
    oldBtn.imageView.frame = CGRectMake(oldBtn.frame.size.width/2, oldBtn.frame.size.height/2, 0, 0);
    //    oldBtn.imageView.center = center;
    [UIView animateWithDuration:0.15 animations:^{
        self->oldBtn.imageView.frame = frame;
    }];
    
}
-(void)setTabbarSelectedIndex:(NSInteger)tabbarSelectedIndex
{
    UIButton * btn = [self.bagImageView viewWithTag:100+tabbarSelectedIndex];
    if (btn) {
        [self itemsBtnClick:btn];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
