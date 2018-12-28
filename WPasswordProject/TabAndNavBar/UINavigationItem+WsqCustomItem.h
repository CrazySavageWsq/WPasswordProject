//
//  UINavigationItem+WsqCustomItem.h
//  WsqSuitProject
//
//  Created by webapps on 16/9/19.
//  Copyright © 2016年 webapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WsqCustomBarItem.h"

@interface UINavigationItem (WsqCustomItem)

/**
 *  自定义导航栏上的左右按钮的字与字体颜色
 *
 *  @param title      标题
 *  @param titleColor 标题颜色
 *  @param font       字体的类型与大小
 *  @param itemType   左还是右按钮
 *
 *  @return 返回
 */
- (WsqCustomBarItem *)itemWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor andTitleUIFontSize:(UIFont *)font andItemType:(ItemType)itemType;



/**
 *  自定义导航栏左右按钮的图片
 *
 *  @param imageName 常态图片
 *  @param hlImage   点击高亮图片
 *  @param size      大小
 *  @param type      左还是右按钮
 *
 *  @return 返回
 */
- (WsqCustomBarItem *)itemWithImage:(NSString *)imageName andHightImage:(NSString *)hlImage size:(CGSize)size type:(ItemType)type;


/**
 *  自定义导航栏每个按钮的底View
 *
 *  @param customView view
 *  @param type       左还是右按钮
 *
 *  @return 返回
 */
- (WsqCustomBarItem *)itemWithCustomeView:(UIView *)customView type:(ItemType)type;


@end
