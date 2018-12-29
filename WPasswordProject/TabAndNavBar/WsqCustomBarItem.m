//
//  WsqCustomBarItem.m
//  WsqSuitProject
//
//  Created by webapps on 16/9/19.
//  Copyright © 2016年 webapps. All rights reserved.
//

#import "WsqCustomBarItem.h"


#define Default_Offset 10
#define TitleViewSize CGSizeMake(80, 30)// item的尺寸

@implementation WsqCustomBarItem



//初始化按钮
-(void)initWsqCustomItemWithType:(ItemType)type andSize:(CGSize)size{
    
    self.isCustomView = NO;
    self.itemType = type;
    self.items = [[NSMutableArray alloc] init];
    self.contentBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
    self.contentBarItem.frame = CGRectMake(0, 0, size.width, size.height);
    [self.items addObject:self.contentBarItem];
}


//设置字或图片的偏移居中还是左还是右
- (void)setItemContetnWithType:(ItemType)type
{
    if (type == right) {
        
        [self.contentBarItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [self setOffset:Default_Offset/2];
    }
    else if (type == left){
        
        [self.contentBarItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self setOffset:-Default_Offset/2];
    }
}


//设置偏移量
- (void)setOffset:(CGFloat)offSet
{
    if (self.isCustomView) {
        
        CGRect customViewFrame = self.customView.frame;
        customViewFrame.origin.x = offSet;
        self.customView.frame = customViewFrame;
    }
    
    
    else{
        [self.contentBarItem setContentEdgeInsets:UIEdgeInsetsMake(0, offSet, 0, -offSet)];
    }
}


//文字
+ (WsqCustomBarItem *)itemWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor andTitleUIFontSize:(UIFont *)font andItemType:(ItemType)itemType{

    if (itemType == right) {
        
        //右边的按钮
        WsqCustomBarItem *item = [[WsqCustomBarItem alloc] init];
        if (title.length > 2) {
            [item initWsqCustomItemWithType:itemType andSize:CGSizeMake(85, 25)];
        }else{
            [item initWsqCustomItemWithType:itemType andSize:CGSizeMake(50, 25)];
        }
        
        
        [item.contentBarItem setBackgroundColor:[UIColor clearColor]];
        [item.contentBarItem setTitleColor:titleColor forState:UIControlStateNormal];
        item.contentBarItem.layer.cornerRadius = 2.5;
        [item setItemContetnWithType:itemType];
        [item.contentBarItem setTitle:title forState:(UIControlStateNormal)];
        item.contentBarItem.titleLabel.textAlignment = NSTextAlignmentRight;
        [item.contentBarItem.titleLabel setFont:font];
        
        return item;
    }else{
        //左边按钮
        WsqCustomBarItem *item = [[WsqCustomBarItem alloc] init];
        [item initWsqCustomItemWithType:itemType andSize:TitleViewSize];
        [item setItemContetnWithType:itemType];
        [item.contentBarItem setTitle:title forState:(UIControlStateNormal)];
        [item.contentBarItem setTitleColor:titleColor forState:(UIControlStateNormal)];
        [item.contentBarItem.titleLabel setFont:font];
        [item.contentBarItem.titleLabel setTextAlignment:NSTextAlignmentLeft];
        
        return item;
    }
    
}


//图片
+ (WsqCustomBarItem *)itemWithImage:(NSString *)imageName andHightImage:(NSString *)hlImage size:(CGSize)size type:(ItemType)type
{
    WsqCustomBarItem *item = [[WsqCustomBarItem alloc] init];
    [item initWsqCustomItemWithType:type andSize:size];
    [item setItemContetnWithType:type];
    [item.contentBarItem setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    [item.contentBarItem setImage:[UIImage imageNamed:hlImage] forState:(UIControlStateHighlighted)];
    return item;
}


//底View
+ (WsqCustomBarItem *)itemWithCustomeView:(UIView *)customView type:(ItemType)type
{
    WsqCustomBarItem *item = [[WsqCustomBarItem alloc] init];
    [item initWsqCustomItemWithType:type andSize: customView.frame.size];
    item.isCustomView = YES;
    item.customView = customView;
    customView.frame = item.contentBarItem.bounds;
    [item.contentBarItem addSubview:customView];
    [item setItemContetnWithType:type];
    return item;
    
  
}


//点击事件
- (void)addTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event
{
    [self.contentBarItem addTarget:target action:selector forControlEvents:event];
    
}



//赋给导航栏的按钮
- (void)setItemWithNavigationItem:(UINavigationItem *)navigationItem itemType:(ItemType)type
{
    if (type == center) {
        
        [navigationItem setTitleView:self.contentBarItem];
    }
    else if (type == left){
        
        [navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:self.contentBarItem]];
    }
    else if (type == right){
        
        [navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:self.contentBarItem]];
    }
}


/**

 
 
 */

@end
