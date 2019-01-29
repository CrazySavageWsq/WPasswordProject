//
//  WGestureLockVC.m
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/25.
//  Copyright © 2018年 Crazy Wang. All rights reserved.

#import "WGestureLockVC.h"
#import "WLGestureLockView.h"
#import "WGestureLockIndicator.h"
#import "WSQAlertController.h"
#import "HomeViewController.h"

#define GesturesPassword @"gesturespassword"

//#define SetGesturesPassword @"setGesturesPassword"
@interface WGestureLockVC () <ZLGestureLockDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) WLGestureLockView *gestureLockView;
@property (strong, nonatomic) WGestureLockIndicator *gestureLockIndicator;

// 手势状态栏提示label
@property (weak, nonatomic) UILabel *statusLabel;

// 账户名
@property (weak, nonatomic) UILabel *nameLabel;
// 账户头像
@property (weak, nonatomic) UIImageView *headIcon;
// 其他账户登录按钮
@property (weak, nonatomic) UIButton *otherAcountBtn;


// 创建的手势密码
@property (nonatomic, copy) NSString *lastGesturePsw;

@property (nonatomic) WUnlockType unlockType;

@property (nonatomic) NSInteger errorCount;
@end

@implementation WGestureLockVC

#pragma mark - 类方法

+ (void)deleteGesturesPassword {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:GesturesPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)addGesturesPassword:(NSString *)gesturesPassword {
    [[NSUserDefaults standardUserDefaults] setObject:gesturesPassword forKey:GesturesPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)gesturesPassword {
    return [[NSUserDefaults standardUserDefaults] objectForKey:GesturesPassword];
}

//+ (void)addGesturesPasswordBool:(BOOL)setBools{
//    [[NSUserDefaults standardUserDefaults] setBool:setBools forKey:SetGesturesPassword];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}
//+ (BOOL)setgesturesPassword{
//    return [[NSUserDefaults standardUserDefaults] objectForKey:SetGesturesPassword];
//
//}

#pragma mark - inint

- (instancetype)initWithUnlockType:(WUnlockType)unlockType {
    if (self = [super init]) {
        _unlockType = unlockType;
    }
    return self;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupMainUI];
    
    self.gestureLockView.delegate = self;
    

    switch (_unlockType) {
        case WUnlockTypeCreatePsw:
        {
            self.gestureLockIndicator.hidden = NO;
           self.nameLabel.hidden = self.headIcon.hidden = YES;
        }
            break;
        case WUnlockTypeValidatePsw:
        {
            _errorCount = 10;
            self.gestureLockIndicator.hidden = YES;
           self.nameLabel.hidden = self.headIcon.hidden = YES;
            
        }
            break;
        default:
            break;
    }
    
}

// 创建界面
- (void)setupMainUI {
    
    CGFloat maginX = 15;
    CGFloat magin = 5;
    CGFloat btnW = ([UIScreen mainScreen].bounds.size.width - maginX * 2 - magin * 2) / 3;
    CGFloat btnH = 30;
    
    // 账户头像
    UIImageView *headIcon = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 56) * 0.5, 30, 56, 56)];
    headIcon.image = [UIImage imageNamed:@"gesture_headIcon"];
    [self.view addSubview:headIcon];
    
    // 账户名
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 100) * 0.5, 90, 100, 20)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = @"账户昵称";
    nameLabel.font = [UIFont systemFontOfSize:12];
    nameLabel.textColor = [UIColor orangeColor];
    [self.view addSubview:nameLabel];
    self.statusLabel = nameLabel;
    
    // 九宫格指示器 小图
    WGestureLockIndicator *gestureLockIndicator = [[WGestureLockIndicator alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 60) * 0.5, 110, 60, 60)];
    [self.view addSubview:gestureLockIndicator];
    self.gestureLockIndicator = gestureLockIndicator;
    
    // 手势状态栏提示label
    UILabel *statusLabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 200) * 0.5, 160, 200, 30)];
    statusLabel.textAlignment = NSTextAlignmentCenter;
    statusLabel.text = @"请绘制手势密码";
    statusLabel.font = [UIFont systemFontOfSize:12];
    statusLabel.textColor = [UIColor redColor];
    [self.view addSubview:statusLabel];
    self.statusLabel = statusLabel;
    
    // 九宫格 手势密码页面
    WLGestureLockView *gestureLockView = [[WLGestureLockView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - self.view.frame.size.width - 60 - btnH, self.view.frame.size.width, self.view.frame.size.width)];
    gestureLockView.delegate = self;
    [self.view addSubview:gestureLockView];
    self.gestureLockView = gestureLockView;
    
    // 底部三个按钮
    // 其他账户登录按钮
    UIButton *otherAcountBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    otherAcountBtn.frame = CGRectMake(maginX, self.view.frame.size.height - 20 - btnH, btnW, btnH);
    otherAcountBtn.backgroundColor = [UIColor clearColor];
    if (_unlockType == WUnlockTypeCreatePsw) {
        
        [otherAcountBtn setTitle:@"重新绘制" forState:UIControlStateNormal];
        [otherAcountBtn addTarget:self action:@selector(resetGesturePassword:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [otherAcountBtn setTitle:@"其他解锁方式" forState:UIControlStateNormal];
        [otherAcountBtn addTarget:self action:@selector(otherAccountLogin:) forControlEvents:UIControlEventTouchUpInside];

    }
    otherAcountBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [otherAcountBtn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
    [self.view addSubview:otherAcountBtn];
    self.otherAcountBtn = otherAcountBtn;
}

#pragma mark - private

//  创建手势密码
- (void)createGesturesPassword:(NSMutableString *)gesturesPassword {
    
    if (self.lastGesturePsw.length <1) {
        
        if (gesturesPassword.length < 4) {
            self.statusLabel.text = @"至少连接四个点，请重新输入";
            [self shakeAnimationForView:self.statusLabel];
            return;
        }
        
        self.lastGesturePsw = gesturesPassword;
        [self.gestureLockIndicator setGesturePassword:gesturesPassword];
        self.statusLabel.text = @"请再次绘制手势密码";
        [self clearNineGridTrajectory];
        return;
    }
    
    if ([self.lastGesturePsw isEqualToString:gesturesPassword]) { // 绘制成功
        
        [self dismissViewControllerAnimated:YES completion:^{
            // 保存手势密码
            [WGestureLockVC addGesturesPassword:gesturesPassword];
//            [WGestureLockVC addGesturesPasswordBool:YES];
        }];
        
    }else {
        self.statusLabel.text = @"与上一次绘制不一致，请重新绘制";
        [self shakeAnimationForView:self.statusLabel];
        [self clearNineGridTrajectory];
    }
    
    
}

//清除九宫格上的轨迹
-(void)clearNineGridTrajectory{
    [self.gestureLockView clearLockView];
    [self.gestureLockIndicator cleanPasssword];
}

// 验证手势密码
- (void)validateGesturesPassword:(NSMutableString *)gesturesPassword {
    
   
    
    if ([gesturesPassword isEqualToString:[WGestureLockVC gesturesPassword]]) {
        [self dissMissVC];
    } else {
        [self.gestureLockView clearLockView];
        _errorCount --;
        
        if (_errorCount ==1) {//最后一次机会
            NSLog(@"您连续输错%d次，请w忘记密码设置",_errorCount+9);
            
            //弹框告诉
            [WSQAlertController wsqShowAlertControllerAlertWithTitle:@"连续输入出错10次，将清空本APP内所有数据" andDescribeMessage:@"" andAllButtonTitleStringArray:@[@"取消",@"确定"] andBackButtonClikBlock:^(NSUInteger buttonClik) {
                switch (buttonClik) {
                    case 0:
                        [self dismissViewControllerAnimated:YES completion:nil];
                        break;
                        
                    case 1:
                        
                        break;
                        
                    default:
                        break;
                }
                
            } andFather:self];
            
        }
        if (_errorCount== 0) { // 你已经输错五次了！ 退出重新登陆！
            NSLog(@"连续输错%d次，请w忘记密码设置",_errorCount+10);
            //弹框告诉
            [WSQAlertController wsqShowAlertControllerAlertWithTitle:@"您已连续输入出错10次，已将本APP内所有数据清空" andDescribeMessage:@"" andAllButtonTitleStringArray:@[@"确定"] andBackButtonClikBlock:^(NSUInteger buttonClik) {
                switch (buttonClik) {
                    case 0:
                        [WGestureLockVC deleteGesturesPassword ];
                        [self dismissViewControllerAnimated:YES completion:nil];
                        break;
                        
                    default:
                        break;
                }
            } andFather:self];
            return;
        }
        
        self.statusLabel.text = [NSString stringWithFormat:@"密码错误，还可以再输入%ld次",(long)_errorCount];
        [self shakeAnimationForView:self.statusLabel];
    }
}

// 抖动动画
- (void)shakeAnimationForView:(UIView *)view {
    
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint left = CGPointMake(position.x - 10, position.y);
    CGPoint right = CGPointMake(position.x + 10, position.y);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:left]];
    [animation setToValue:[NSValue valueWithCGPoint:right]];
    [animation setAutoreverses:YES]; // 平滑结束
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    
    [viewLayer addAnimation:animation forKey:nil];
}

#pragma mark - 按钮点击事件 Anction

// 点击其他账号登陆按钮
- (void)otherAccountLogin:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    NSLog(@"%s",__FUNCTION__);
}

// 点击重新绘制按钮
- (void)resetGesturePassword:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    
    self.lastGesturePsw = nil;
    self.statusLabel.text = @"请绘制手势密码";
    [self.gestureLockIndicator setGesturePassword:@""];
}

// 点击忘记手势密码按钮
- (void)forgetGesturesPassword:(id)sender {
    NSLog(@"%s",__FUNCTION__);
}


#pragma mark - ZLgestureLockViewDelegate

- (void)gestureLockView:(WLGestureLockView *)lockView drawRectFinished:(NSMutableString *)gesturePassword {
    
    switch (_unlockType) {
        case WUnlockTypeCreatePsw: // 创建手势密码
        {
            [self createGesturesPassword:gesturePassword];
        }
            break;
        case WUnlockTypeValidatePsw: // 校验手势密码
        {
            [self validateGesturesPassword:gesturePassword];
        }
            break;
        default:
            break;
    }
}



//dismiss到指定页面
- (void)dissMissVC{
    UIViewController * presentingViewController = self.presentingViewController;
    do {
        if ([presentingViewController isKindOfClass:[HomeViewController class]]) {
            break;
        }
        presentingViewController = presentingViewController.presentingViewController;
        
    } while (presentingViewController.presentingViewController);
    
    [presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
