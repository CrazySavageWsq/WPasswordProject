//
//  WNumberLockVC.m
//  WPasswordProject
//
//  Created by Crazy Wang on 2019/1/11.
//  Copyright © 2019年 Crazy Wang. All rights reserved.
//

#import "WNumberLockVC.h"
#import "WSQAlertController.h"
#define NumberPassword @"numberpassword"


@interface WNumberLockVC ()
@property (weak, nonatomic) IBOutlet UITextField *fristPasswordTF;
@property (weak, nonatomic) IBOutlet UITextField *lastPasswordTF;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backViewH;
@property (weak, nonatomic) IBOutlet UIView *sureAginView;
@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (nonatomic) NSInteger errorCount;

@end

@implementation WNumberLockVC

- (NSString *)getNumPasssword{
    
 return  [[NSUserDefaults standardUserDefaults] valueForKey:NumberPassword];
    
}

- (void)saveNumPassword:(NSString *)password{
    [[NSUserDefaults standardUserDefaults] setValue:password forKey:NumberPassword];
}

- (void)clearNumPasssword{
   [[NSUserDefaults standardUserDefaults] setValue:nil forKey:NumberPassword];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    if ([self getNumPasssword] .length >1) {
        
        _backViewH.constant = _backViewH.constant /2.0;
        _sureAginView.hidden = YES;
         _titleL.text = @"密码解锁";
        _errorCount =10;
    }
    
    
    
}
- (IBAction)backBtnClik:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//确定
- (IBAction)sureBtnClik:(UIButton *)sender {
    
    [self.view endEditing:YES];
    
    if ([self getNumPasssword].length >1) {
        
        _errorCount --;
        
        if (![_fristPasswordTF.text isEqualToString:[self getNumPasssword]]) {
           
            if (_errorCount==0) {
                
                NSLog(@"密码连续输错10次");
                
                [WSQAlertController wsqShowAlertControllerAlertWithTitle:@"您已连续输入出错10次，已将本APP内所有数据清空" andDescribeMessage:@"" andAllButtonTitleStringArray:@[@"确定"] andBackButtonClikBlock:^(NSUInteger buttonClik) {
                    switch (buttonClik) {
                        case 0:
                            [self clearNumPasssword];
                            [self dismissViewControllerAnimated:YES completion:nil];
                            break;
                            
                        default:
                            break;
                    }
                } andFather:self];
                
                
            }else if (_errorCount ==1){
                
                //弹框告诉
                [WSQAlertController wsqShowAlertControllerAlertWithTitle:@"连续输入出错10次，将清空本APP内所有数据,你已经输入9次！" andDescribeMessage:@"" andAllButtonTitleStringArray:@[@"取消",@"确定"] andBackButtonClikBlock:^(NSUInteger buttonClik) {
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
                
            } else{
                NSLog(@"密码不对，请重新输入");
                
            }
        }else{
              [self dismissViewControllerAnimated:self completion:nil];
        }
        
        
    }else{
        if (![_fristPasswordTF.text isEqualToString:_lastPasswordTF.text]) {
            
            NSLog(@"两次密码不通");
            
            return;
        }
        
        [self saveNumPassword:_lastPasswordTF.text];
    }
    
    
}


@end
