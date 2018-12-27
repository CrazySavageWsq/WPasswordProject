//
//  NSDictionary+NullJudge.m
//  CarRaceWorld
//
//  Created by qiangqiang mei on 2018/7/25.
//  Copyright © 2018年 gsyf. All rights reserved.
//

#import "NSDictionary+NullJudge.h"

@implementation NSDictionary (NullJudge)


+ (NSDictionary *)judgeNull:(NSDictionary *)dictw{

    NSMutableDictionary *ssd = [[NSMutableDictionary alloc]initWithDictionary:dictw];
    
    
    for (NSString *keyStr in ssd.allKeys) {
        if ([[ssd objectForKey:keyStr] isKindOfClass:[NSNull class]] || [ssd objectForKey:keyStr] == nil) {
            [ssd setValue:@"" forKey:keyStr];
        }
        else{
            [ssd setObject:[ssd objectForKey:keyStr] forKey:keyStr];
        }
    }


    return ssd;
}
@end
