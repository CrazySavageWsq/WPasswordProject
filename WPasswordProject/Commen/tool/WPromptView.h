//
//  WPromptView.h
//  WPasswordProject
//
//  Created by Crazy Wang on 2019/1/28.
//  Copyright © 2019年 Crazy Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPromptView : UIView


+ (instancetype)promptViewShare;


/**
 显示在下面的提示语

 @param promptString 提示的文字内容
 */
+ (void)showPrompt_bottom:(NSString *)promptString;

/**
 显示在中间的提示语
 
 @param promptString 提示的文字内容
 */
+ (void)showPropt_center:(NSString *)promptString;


@end
