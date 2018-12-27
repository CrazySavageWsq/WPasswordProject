//
//  UIButton+UrlImageView.h
//  SmallPigsFarm
//
//  Created by webapps on 2017/6/23.
//  Copyright © 2017年 wsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (UrlImageView)


/**
 设置背景

 @param urlString 图片链接
 */
- (void)setBackImageWithUrl:(NSString *)urlString;


/**
 设置图片

 @param urlString 图片链接
 */
- (void)setImageWithUrls:(NSString *)urlString;

@end
