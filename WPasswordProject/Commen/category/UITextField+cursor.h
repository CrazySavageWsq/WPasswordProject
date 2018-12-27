//
//  UITextField+cursor.h
//  CarRaceWorld
//
//  Created by gsyf on 2017/9/22.
//  Copyright © 2017年 gsyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (cursor)

- (NSRange) selectedRange;

- (void) setSelectedRange:(NSRange) range;


@end
