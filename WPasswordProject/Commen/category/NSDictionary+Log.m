//
//  NSDictionary+Log.m
//  CarRaceWorld
//
//  Created by gsyf on 2017/12/18.
//  Copyright © 2017年 gsyf. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)

-  (NSString *)descriptionWithLocale:(id)locale{
    
            if (![self count]) {
                return @"";
            }
            NSString *tempStr1 =
            [[self description] stringByReplacingOccurrencesOfString:@"\\u"
                                                          withString:@"\\U"];
    
            NSString *tempStr2 =
            [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
            NSString *tempStr3 =
            [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
            NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
            NSString *str =
    
            [NSPropertyListSerialization propertyListWithData:tempData
                                                      options:NSPropertyListImmutable
                                                       format:NULL
                                                        error:NULL];
            return str;
    
}

@end
