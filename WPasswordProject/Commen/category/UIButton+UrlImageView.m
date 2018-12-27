//
//  UIButton+UrlImageView.m
//  SmallPigsFarm
//
//  Created by webapps on 2017/6/23.
//  Copyright © 2017年 wsq. All rights reserved.
//

#import "UIButton+UrlImageView.h"

@implementation UIButton (UrlImageView)

- (void)setBackImageWithUrl:(NSString *)urlString{
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    //根据图片的URL下载数据
    
    // 创建GCD线程队列
    dispatch_queue_t imgeQeue = dispatch_queue_create("loadImage....", NULL);
    

    //开启异步
    dispatch_async(imgeQeue, ^{
        
        UIImage *ima = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        
        //回主线程刷新
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self setBackgroundImage:ima forState:UIControlStateNormal];
        });
    });
    
    
}


- (void)setImageWithUrls:(NSString *)urlString{
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    //根据图片的URL下载数据
    
    // 创建GCD线程队列
    dispatch_queue_t imgeQeue = dispatch_queue_create("loadImage....", NULL);
    
    
    //开启异步
    dispatch_async(imgeQeue, ^{
        
        UIImage *ima = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        
        //回主线程刷新
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self setImage:ima forState:UIControlStateNormal];
        });
    });
    
    
}

@end
