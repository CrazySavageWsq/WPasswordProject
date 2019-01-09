//
//  WSQAlertController.h
//  CarRaceWorld
//
//  Created by gsyf on 2018/4/11.
//  Copyright © 2018年 gsyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSQAlertController : NSObject


/**
 中间弹框的弹框

 @param titleString 标题
 @param descMessageString 副标题
 @param buttonArray 按钮数组，“取消按钮” 请放第一个：例如:@[@"取消",@"确认",@"确认2",@"]
 @param clikBlock 返回点击了哪个按钮事件
 @param fa 父类，可不传
 */
+ (void)wsqShowAlertControllerAlertWithTitle:(NSString *)titleString
                          andDescribeMessage:(NSString *)descMessageString
                andAllButtonTitleStringArray:(NSArray <NSString *> *)buttonArray
                      andBackButtonClikBlock:(void (^)(NSUInteger  buttonClik))clikBlock andFather:(UIViewController*)fa;



/**
底部弹出的框

 @param titleString 标题
 @param descMessageString 副标题
 @param cancelString 取消按钮
 @param destructiveButtonTitle 特殊按钮
 @param buttonArray 按钮数组
 @param block 返回点击了哪个按钮事件
 @param fa 父类，可不传
 */
+(void)wsqShowAlertControllerActionSheetWithTitle:(NSString*)titleString  andDescribeMessage:(NSString*)descMessageString andCancelButtonTitle:(NSString*)cancelString  destructiveButtonTitle:(NSString*)destructiveButtonTitle  andAllButtonTitleStringArray:(NSArray<NSString*>*)buttonArray  andBackButtonClikBlock:(void (^)(NSInteger buttonIdx))block andFather:(UIViewController*)fa;

@end
