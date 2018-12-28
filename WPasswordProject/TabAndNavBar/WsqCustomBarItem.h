//
//  WsqCustomBarItem.h
//  WsqSuitProject
//
//  Created by webapps on 16/9/19.
//  Copyright © 2016年 webapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    
    left,
    center,
    right
    
}ItemType;

@interface WsqCustomBarItem : NSObject

@property(nonatomic, strong) UIButton              *contentBarItem;
@property(nonatomic, strong) NSMutableArray        *items;
@property(nonatomic, assign) ItemType              itemType;
@property(nonatomic, strong) UIView                *customView;
@property(nonatomic, assign) BOOL                  isCustomView;


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
+ (WsqCustomBarItem *)itemWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor andTitleUIFontSize:(UIFont *)font andItemType:(ItemType)itemType;



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
+ (WsqCustomBarItem *)itemWithImage:(NSString *)imageName andHightImage:(NSString *)hlImage size:(CGSize)size type:(ItemType)type;


/**
 *  自定义导航栏每个按钮的底View
 *
 *  @param customView view
 *  @param type       左还是右按钮
 *
 *  @return 返回
 */
+ (WsqCustomBarItem *)itemWithCustomeView:(UIView *)customView type:(ItemType)type;


/**
 *  设置导航栏按钮
 *
 *  @param navigationItem 按钮
 *  @param type           左还是右按钮
 */
- (void)setItemWithNavigationItem:(UINavigationItem *)navigationItem itemType:(ItemType)type;


/**
 *  添加点击事件
 *
 *  @param target   <#target description#>
 *  @param selector <#selector description#>
 *  @param event    <#event description#>
 */
- (void)addTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event;

/**
 *
 *设置item偏移量
 *@param offSet 正值向左偏，负值向右偏
 */
- (void)setOffset:(CGFloat)offSet;


@end
