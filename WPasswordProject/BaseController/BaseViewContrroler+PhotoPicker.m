//
//  BaseViewContrroler+PhotoPicker.m
//  SmallPigsFarm
//
//  Created by webapps on 2017/5/25.
//  Copyright © 2017年 wsq. All rights reserved.
//

#import "BaseViewContrroler+PhotoPicker.h"
#import <objc/runtime.h>
#import "UIImage+FixOrientation.h"

static NSString *canCameraKey   = @"canCamera";
@implementation BaseViewContrroler (PhotoPicker)





/*
 * 对象类型
 */
- (void)setCanCamera:(NSString *)canCamera{
    
    objc_setAssociatedObject(self, &canCameraKey, canCamera, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)canCamera {
    
    return objc_getAssociatedObject(self, &canCameraKey);
}


- (void)showPhotoPickerr{
    

    UIActionSheet *actionSheet ;
    if (![self.canCamera isEqualToString:@"camera"]) {
      actionSheet  = [[UIActionSheet alloc]
           initWithTitle:@"照片来源"
           delegate:self
           cancelButtonTitle:@"取消"
           destructiveButtonTitle:nil
           otherButtonTitles:@"相册",nil];
    }else{
        
        actionSheet  = [[UIActionSheet alloc]
                        initWithTitle:@"照片来源"
                        delegate:self
                        cancelButtonTitle:@"取消"
                        destructiveButtonTitle:nil
                        otherButtonTitles:@"相册",@"现在拍照",nil];
    }

    actionSheet.tag = 520;
    [actionSheet showInView:self.view];
}

#pragma mark -
#pragma UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //上传照片
    if (actionSheet.tag == 520)
    {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.05 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
            
            
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.delegate = self;          // 设置委托
            imagePickerController.allowsEditing = NO;
            imagePickerController.restorationIdentifier = [NSString stringWithFormat:@"%ld", (long) actionSheet.tag];
            
            if (![self.canCamera isEqualToString:@"camera"]) {
                switch (buttonIndex){
                    case 0://相册
                        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                        imagePickerController.sourceType    = sourceType;
                        [self presentViewController:imagePickerController animated:YES completion:nil];  //需要以模态的形式展示
                        break;
                }
            }else{
                    switch (buttonIndex){
                        case 0://相册
                            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                            imagePickerController.sourceType    = sourceType;
                            [self presentViewController:imagePickerController animated:YES completion:nil];  //需要以模态的形式展示
                            break;
                        case 1://拍照
                            //判断是否有摄像头
                            if(![UIImagePickerController isSourceTypeAvailable:sourceType])
                            {
                                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                            }else{
                                        sourceType = UIImagePickerControllerSourceTypeCamera;
                                
                            }
                            imagePickerController.sourceType    = sourceType;
                            [self presentViewController:imagePickerController animated:YES completion:nil];  //需要以模态的形式展示
                            break;
                            
                            
                    }
                
            }
   
        });
    }
}

#pragma mark -
#pragma mark UIImagePickerController Method

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}


//完成拍照
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^
     {
         UIImage *image    = [info objectForKey:UIImagePickerControllerOriginalImage];
         
         UIImage *fixImage = [UIImage fixOrientation:image];
         
         NSData *imageData = UIImageJPEGRepresentation(fixImage, 0.85);
         if (imageData.length > 1042349)
         {
             imageData  = UIImageJPEGRepresentation(fixImage, 0.5);
         }

         [self photoDataReturn:imageData image:fixImage];
     }];
}

- (void)photoDataReturn:(NSData *) data image:(UIImage *)image {
    
}

//用户取消拍照
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveImageToPhotos:(UIImage*)savedImage
{
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel  =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            
        }];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
    }else{
        msg = @"保存图片成功!请到相册里查看" ;
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        /* 照片是否可以编辑 */
        picker.allowsEditing = YES;
        picker.delegate = self;
        /* 根据照片来源确定AlertAction */
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleActionSheet];
        /* 判断相册是否可以访问 */
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"立即前往" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:picker animated:NO completion:^{}];
            }];
            
            [alert addAction:action1];
        }
        
        
        
        UIAlertAction *cancel  =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            
        }];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
//
    }
}

@end
