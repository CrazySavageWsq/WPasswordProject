//
//  WPromptView.m
//  WPasswordProject
//
//  Created by Crazy Wang on 2019/1/28.
//  Copyright © 2019年 Crazy Wang. All rights reserved.
//

#import "WPromptView.h"


@interface WPromptView()

@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIColor *backColor;

@end


static WPromptView * instance = nil;
@implementation WPromptView

-(instancetype)init{
    
    self = [super init];
    
    if (self) {
        self.backgroundColor =  RGBP(0, 0, 0, 0.5);
        self.layer.cornerRadius = 8.0f;
        self.clipsToBounds = YES;
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.font = [UIFont systemFontOfSize:13.0f];
        _messageLabel.layer.masksToBounds = YES;
        _messageLabel.numberOfLines = 0;
        [self addSubview:_messageLabel];
    }
    return self;
}

+( instancetype )promptViewShare{
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc]init];
    });
    
    return instance;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    
    return instance;
}



+(void)showPrompt_bottom:(NSString *)promptString{
    
    WPromptView* aler = [WPromptView promptViewShare];
    if (aler.hidden == NO) {
        return;
    }
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    aler.hidden = NO;
    aler.alpha = 1.0f;
    UILabel * label = aler.messageLabel;
    label.frame = CGRectMake(0, 0, window.frame.size.width-100, 1000);
    label.backgroundColor = [UIColor grayColor];
    label.layer.masksToBounds = YES;
    label.text = [NSString stringWithFormat:@"%@",promptString];
    [label sizeToFit];
    
    CGFloat width = label.frame.size.width;
    CGFloat height = label.frame.size.height;
    aler.frame = CGRectMake(0, 0, width + 40, height+20);
    label.center = aler.center;
    aler.center = CGPointMake(window.center.x, window.frame.size.height - height - 50);
    [window addSubview:aler];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:2.0 animations:^{
            aler.alpha = 0.0f;
        } completion:^(BOOL finished) {
            aler.hidden = YES;
        }];
    });
    
}

+ (void)showPropt_center:(NSString *)promptString{
    
    
    WPromptView* aler = [WPromptView promptViewShare];
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    aler.hidden = NO;
    aler.alpha = 1.0f;
    UILabel * label = aler.messageLabel;
     label.frame = CGRectMake(0, 0, window.frame.size.width-100, 1000);
    label.text = promptString;
    label.layer.masksToBounds = YES;
    [label sizeToFit];

    CGFloat width = label.frame.size.width;
    CGFloat height = label.frame.size.height;
    aler.frame = CGRectMake(0, 0, width + 40, height+20);
    label.center = aler.center;
    aler.center = CGPointMake(window.center.x, window.center.y - height/2.0);
    [window addSubview: aler];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:2.0 animations:^{
            aler.alpha = 0.0f;
        } completion:^(BOOL finished) {
            aler.hidden = YES;
        }];
    });
    
    
}

@end
