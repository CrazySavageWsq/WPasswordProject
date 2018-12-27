//
//  NSArray+NullJudge.m
//  CarRaceWorld
//
//  Created by gsyf on 2017/8/24.
//  Copyright © 2017年 gsyf. All rights reserved.
//

#import "NSArray+NullJudge.h"

@implementation NSArray (NullJudge)


+ (NSArray *)judgeNull:(NSArray *)Array{
    
    
    NSMutableArray  *reArray = [NSMutableArray arrayWithArray:Array];
    
    for (int i = 0; i < reArray.count; i ++) {
        
        NSMutableDictionary *ssd = [[NSMutableDictionary alloc]initWithDictionary:Array[i]];
        
        
        for (NSString *keyStr in ssd.allKeys) {
            if ([[ssd objectForKey:keyStr] isKindOfClass:[NSNull class]] || [ssd objectForKey:keyStr] == nil) {
                [ssd setValue:@"" forKey:keyStr];
            }
            else{
                [ssd setObject:[ssd objectForKey:keyStr] forKey:keyStr];
            }
        }
        
        [reArray replaceObjectAtIndex:i withObject:ssd];
    }

    
    return reArray;
}


@end
