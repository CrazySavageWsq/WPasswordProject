//
//  WNumberLockVC.h
//  WPasswordProject
//
//  Created by Crazy Wang on 2019/1/11.
//  Copyright © 2019年 Crazy Wang. All rights reserved.
//

#import "BaseViewContrroler.h"

@interface WNumberLockVC : BaseViewContrroler


/**
 获取密码

 @return 返回密码
 */
- (NSString *)getNumPasssword;



/**
 清除密码
 */
- (void )clearNumPasssword;

@end
