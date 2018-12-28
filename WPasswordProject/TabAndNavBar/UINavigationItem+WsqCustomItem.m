//
//  UINavigationItem+WsqCustomItem.m
//  WsqSuitProject
//
//  Created by webapps on 16/9/19.
//  Copyright © 2016年 webapps. All rights reserved.
//

#import "UINavigationItem+WsqCustomItem.h"

@implementation UINavigationItem (WsqCustomItem)

-(WsqCustomBarItem *)itemWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor andTitleUIFontSize:(UIFont *)font andItemType:(ItemType)itemType{
    
    WsqCustomBarItem *item = [WsqCustomBarItem itemWithTitle:title andTitleColor:titleColor andTitleUIFontSize:font andItemType:itemType];
    [item setItemWithNavigationItem:self itemType:itemType];
    
    return item;
}

-(WsqCustomBarItem *)itemWithImage:(NSString *)imageName andHightImage:(NSString *)hlImage size:(CGSize)size type:(ItemType)type{
    
    WsqCustomBarItem *item = [WsqCustomBarItem itemWithImage:imageName andHightImage:hlImage size:size type:type];
     [item setItemWithNavigationItem:self itemType:type];
    
    return item;
}

-(WsqCustomBarItem *)itemWithCustomeView:(UIView *)customView type:(ItemType)type{
    
    WsqCustomBarItem *item = [WsqCustomBarItem itemWithCustomeView:customView type:type];
    
    [item setItemWithNavigationItem:self itemType:type];
    
    return item;
    
}
@end
