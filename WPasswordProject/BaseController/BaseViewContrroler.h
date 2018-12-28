//
//  WsqBaseVC.h
//  WsqSuitProject
//
//  Created by webapps on 16/8/11.
//  Copyright © 2016年 webapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationItem+WsqCustomItem.h"
typedef void(^RequestCompletionBlock)(BOOL isSuccess, NSDictionary *responseModel, NSError *error);

@interface BaseViewContrroler : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
     UIImageView *navBarHairlineImageView;
}

@property(nonatomic, copy) RequestCompletionBlock completionBlock;
//是否隐藏左边按钮
@property(nonatomic, assign) BOOL    isHideBack;
//状态栏的颜色
@property(nonatomic, strong)  UIColor  *tarColor;
//导航栏颜色
@property(nonatomic, strong)  UIColor  *navigationColor;
@property(nonatomic, strong)  UIColor  *navagationTitleColor;


-(void)changeTarColor;

//导航栏的颜色和标题颜色 // 当页面不需要导航栏（看着想一个整体时）调用这个方法
- (void)chagebarTintImage:(NSString *)barImage barTintColor:(UIColor *)color  andTitleColor:(UIColor *)titleColor andTitle:(NSString*)title;

//点击事件
- (void)backMenuPressed;
- (void)leftMenuPressed:(id)sender;
- (void)rightMenuPressed:(id)sender;



//设置文字
- (void)setNavContentMenuTitle:(NSString*)title;
- (void)setLeftMenuTitle:(NSString *)leftMenuTitle;
- (void)setRightMenuTitle:(NSString *)rightMenuTitle;



//设置图片
- (void)setRightMenuWithNorImage:(NSString *)norImage selectImage:(NSString *)selectImage;
- (void)setLeftMenuWithNorImage:(NSString *)norImage selectImage:(NSString *)selectImage;



//右边 自己添颜色
- (void)setRightMenuTitle:(NSString *)rightMenuTitle titleColor:(UIColor *)color;
@property(nonatomic, strong) UIColor * rightColor;


/**
 *  为tableView准备的
 */

@property(nonatomic, strong)  UITableView        *wTableView;

//创建TableView
- (void)createWtableViewWithFrame:(CGRect)frame WithStyle:(UITableViewStyle)style WithBackColor:(UIColor *)color;




/**
 *  二级键盘done
 */

//为texfile或TeXView每个添加done
-(void)levelTwoKeyboard:(NSArray *)arrray;








/*************视频播放************/

/**
 用了自定义的手势返回，则系统的手势返回屏蔽
 不用自定义的手势返回，则系统的手势返回启用
 */
@property (nonatomic, assign) BOOL enablePanGesture;//是否支持自定义拖动pop手势，默认yes,支持手势

//@property (nonatomic,retain) MBProgressHUD* hud;
//- (void)addHud;
//- (void)addHudWithMessage:(NSString*)message;
//- (void)removeHud;



//上传图片  ser 接口名  infos 参数 serialNumber上传图片的标识（上传多张图片时用）
- (void)requestWithServe:(NSString *)ser andInfos:(NSDictionary *)infos imageData:(NSData *)imageData image:(UIImage *)image completion:(RequestCompletionBlock)block;

//
//+ (void)requestSucc:(NSString *)ser andResults:(NSDictionary *)results;
//
//+ (void)requesFail:(NSString *)ser  FailedDic:(NSDictionary *)dic;




@end
