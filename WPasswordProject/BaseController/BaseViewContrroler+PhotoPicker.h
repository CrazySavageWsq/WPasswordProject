//
//  BaseViewContrroler+PhotoPicker.h
//  SmallPigsFarm
//
//  Created by webapps on 2017/5/25.
//  Copyright © 2017年 wsq. All rights reserved.
//

#import "BaseViewContrroler.h"

@interface BaseViewContrroler (PhotoPicker)<UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic,copy)NSString *canCamera;

/*展示选取照片*/
- (void)showPhotoPickerr;

/*返回照片的二进制流数据和照片*/
- (void)photoDataReturn:(NSData *) data image:(UIImage *)image;

/*保存照片*/
- (void)saveImageToPhotos:(UIImage *)savedImage;


@end
