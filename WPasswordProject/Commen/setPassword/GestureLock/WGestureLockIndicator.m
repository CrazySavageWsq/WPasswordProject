//
//  WGestureLockIndicator.m
//  WPasswordProject
//
//  Created by Crazy Wang on 2018/12/25.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//

#import "WGestureLockIndicator.h"

@interface WGestureLockIndicator()

@property (nonatomic, strong) NSMutableArray *btns;

@end

@implementation WGestureLockIndicator

#pragma mark - getter

- (NSMutableArray *)btns {
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

#pragma mark - initializer

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubviews];
    }
    return self;
}

// 子视图初始化
- (void)initSubviews {
    // 创建9个按钮
    for (int i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.userInteractionEnabled = NO;
        [btn setImage:[UIImage imageNamed:@"灰色椭圆"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"橙色椭圆"] forState:UIControlStateSelected];
        [self addSubview:btn];
        [self.btns addObject:btn];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    
    int cols = 3;//总列数
    
    CGFloat x = 0,y = 0,w = 9,h = 9;//bounds
    CGFloat margin = (self.bounds.size.width - cols * w) / (cols + 1);//间距
    
    CGFloat col = 0;
    CGFloat row = 0;
    for (int i = 0; i < count; i++) {
        
        col = i%cols;
        row = i/cols;
        
        x = margin + (w+margin)*col;
        y = margin + (w+margin)*row;
        
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, w, h);
    }
}

#pragma mark - public

- (void)setGesturePassword:(NSString *)gesturePassword {
    
    if (gesturePassword.length == 0) {
        for (UIButton *button in self.btns) {
            button.selected = NO;
        }
        return;
    }
    
    for (int i = 0; i < gesturePassword.length; i++) {
        
        NSString *s = [gesturePassword substringWithRange:NSMakeRange(i, 1)];
        
        [self.btns[s.integerValue] setSelected:YES];
        
    }
}

- (void)cleanPasssword{
    for (UIButton *button in self.btns) {
        button.selected = NO;
    }
}
@end
