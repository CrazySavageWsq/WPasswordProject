//
//  UIImage+FixOrientation.h
//  CarRaceWorld
//
//  Created by qiangqiang mei on 2018/6/23.
//  Copyright © 2018年 gsyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FixOrientation)
+ (UIImage *)fixOrientation:(UIImage *)aImage;


- (NSData *)compressQualityWithMaxLength:(NSInteger)maxLength;

+(NSData *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize;

//修改图片尺寸 同比缩放
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;
@end
