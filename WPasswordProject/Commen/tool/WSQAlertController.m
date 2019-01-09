//
//  WSQAlertController.m
//  CarRaceWorld
//
//  Created by gsyf on 2018/4/11.
//  Copyright © 2018年 gsyf. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "WSQAlertController.h"

@implementation WSQAlertController



#pragma mark --- 获取当前控制器
+ (UIViewController*)getTopViewController
{

    UIViewController *currentViewController = (UIViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;

    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];

    NSLog(@"%@",currentViewController);
    return  currentViewController ;
}


+(void)wsqShowAlertControllerAlertWithTitle:(NSString *)titleString andDescribeMessage:(NSString *)descMessageString andAllButtonTitleStringArray:(NSArray<NSString *> *)buttonArray andBackButtonClikBlock:(void (^)(NSUInteger))clikBlock andFather:(UIViewController *)fa{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titleString message:descMessageString preferredStyle:UIAlertControllerStyleAlert];
    
    for (int i = 0; i < buttonArray.count; i ++) {
        
        UIAlertActionStyle style = (i == 0) ? UIAlertActionStyleCancel :UIAlertActionStyleDefault;
        
        UIAlertAction * action = [UIAlertAction actionWithTitle:buttonArray[i] style:style handler:^(UIAlertAction * _Nonnull action) {
            if (clikBlock) {
                clikBlock(i);
            }
        }];
        
        [alertController addAction:action];
    }
    
    
    if (fa) {
        [fa presentViewController:alertController animated:YES completion:nil];

    }else{
        [[WSQAlertController getTopViewController]  presentViewController:alertController animated:YES completion:nil];

    }
}



+(void)wsqShowAlertControllerActionSheetWithTitle:(NSString *)titleString andDescribeMessage:(NSString *)descMessageString andCancelButtonTitle:(NSString *)cancelString destructiveButtonTitle:(NSString *)destructiveButtonTitle andAllButtonTitleStringArray:(NSArray<NSString *> *)buttonArray andBackButtonClikBlock:(void (^)(NSInteger))block andFather:(UIViewController *)fa{
    
    NSMutableArray* argsArray = [[NSMutableArray alloc] initWithCapacity:3];
    
    
    if (cancelString) {
        [argsArray addObject:cancelString];
    }
    if (destructiveButtonTitle) {
        [argsArray addObject:destructiveButtonTitle];
    }
    
    [argsArray addObjectsFromArray:buttonArray];
    

        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:titleString message:descMessageString preferredStyle:UIAlertControllerStyleActionSheet];
        for (int i = 0; i < [argsArray count]; i++)
        {
            UIAlertActionStyle style =  (i ==0 )? UIAlertActionStyleCancel: UIAlertActionStyleDefault;
            
            if (1==i && destructiveButtonTitle) {
                
                style = UIAlertActionStyleDestructive;
            }
            UIAlertAction *action = [UIAlertAction actionWithTitle:[argsArray objectAtIndex:i] style:style handler:^(UIAlertAction *action) {
                if (block) {
                    block(i);
                }
            }];
            [alertController addAction:action];
        }
        
    if (fa) {
        [fa presentViewController:alertController animated:YES completion:nil];
        
    }else{
        [[WSQAlertController getTopViewController]  presentViewController:alertController animated:YES completion:nil];
        
    }

}

@end
