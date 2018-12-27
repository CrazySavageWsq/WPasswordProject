//
//  NSArray+NullJudge.h
//  CarRaceWorld
//
//  Created by gsyf on 2017/8/24.
//  Copyright © 2017年 gsyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (NullJudge)

/**
 数组中元素都为字典

 @param Array 数组
 @return 剔除null
 */
+ (NSArray *)judgeNull:(NSArray *)Array;


@end
