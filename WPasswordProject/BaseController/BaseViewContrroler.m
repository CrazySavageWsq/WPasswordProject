//
//  WsqBaseVC.m
//  WsqSuitProject
//
//  Created by webapps on 16/8/11.
//  Copyright © 2016年 webapps. All rights reserved.
//

#import "BaseViewContrroler.h"


@interface BaseViewContrroler ()
{
    NSArray * texFileArray;
    
    NSString    *serStr;
    
//    UIImageView *navBarHairlineImageView;


}
@end

@implementation BaseViewContrroler


/*    右滑返回上个页面    */

- (void)viewDidAppear:(BOOL)animated
{
    __weak typeof(self) weakSelf = self;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)weakSelf;
}




#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer{
    //判断是否为rootViewController
    if (self.navigationController && self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    return YES;
}


- (void)viewDidLoad {
  
    self.navigationController.navigationBar.translucent = NO;
  
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];//UIColorFromRGB(0X2e7ff9);

    //修改导航条背景色（图片）
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"image01"] forBarMetrics:UIBarMetricsDefault]

    [super viewDidLoad];

   //设置说有的输入框的光标颜色
//    [[UITextField appearance] setTintColor: RGBColor(29, 130, 210)];


    self.view.backgroundColor =[UIColor whiteColor] ;//MainBackViewColor;
    
    if (self.isHideBack) {
        self.navigationItem.hidesBackButton = YES;
    }else{
        WsqCustomBarItem *back = [self.navigationItem itemWithImage:@"icon_back_white" andHightImage:@"icon_back_white" size:CGSizeMake(30,30) type:left];
        [back addTarget:self selector:@selector(backMenuPressed) event:UIControlEventTouchUpInside];
    }
    
    
    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    


}

//隐藏导航栏的那条线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

//状态栏颜色
-(void)changeTarColor{
    UIView *statusBarView = [[UIView alloc]   initWithFrame:CGRectMake(0, -44,    self.view.bounds.size.width, 44)];
    
    if (_tarColor !=nil) {
        statusBarView.backgroundColor = _tarColor;

    }else{
        statusBarView.backgroundColor = [UIColor whiteColor];//UIColorFromRGB(0X2073f6);

    }
 
    [self.navigationController.navigationBar addSubview:statusBarView];
    
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    navBarHairlineImageView.hidden = YES;
    
    //当不调用修改状态栏时，状态栏颜色自动跟随导航栏颜色
//    [self changeTarColor];
    

    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    navBarHairlineImageView.hidden = NO;

}





- (void)chagebarTintImage:(NSString *)barImage barTintColor:(UIColor *)color  andTitleColor:(UIColor *)titleColor andTitle:(NSString*)title{
    
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    

    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:barImage] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];


    //修改导航条背景色（themeColor）
    self.navigationController.navigationBar.barTintColor = color ;
    //修改导航条标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:titleColor,NSForegroundColorAttributeName,nil]];
    
    [self.navigationItem itemWithTitle:title andTitleColor:titleColor andTitleUIFontSize:[UIFont systemFontOfSize:19] andItemType:center];

}



#pragma mark --  修改状态栏颜色
//(如果还是没改变看你的info.plist文件中是否有View controller-based status bar appearance 这个属性，如果有看是否为YES，为YES的话应该就能成功的)
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;

}

#pragma mark -- 导航栏标题设置
- (void)setNavContentMenuTitle:(NSString*)title{
  
    if (_navagationTitleColor !=nil) {
       [self.navigationItem itemWithTitle:title andTitleColor:_navagationTitleColor andTitleUIFontSize:[UIFont systemFontOfSize:21] andItemType:center];
    }else{
        [self.navigationItem itemWithTitle:title andTitleColor:[UIColor whiteColor] andTitleUIFontSize:[UIFont systemFontOfSize:21] andItemType:center];
    }
    
    

}

#pragma mark -- 左边按钮
-(void)setLeftMenuTitle:(NSString *)leftMenuTitle{
    
    WsqCustomBarItem *leftItem = [self.navigationItem itemWithTitle:leftMenuTitle andTitleColor:[UIColor whiteColor] andTitleUIFontSize:[UIFont systemFontOfSize:17] andItemType:left];
    [leftItem addTarget:self selector:@selector(leftMenuPressed:) event:UIControlEventTouchUpInside];
    
}
#pragma mark -- 右边按钮
-(void)setRightMenuTitle:(NSString *)rightMenuTitle{
    
    WsqCustomBarItem *rightItem = [self.navigationItem itemWithTitle:rightMenuTitle andTitleColor:[UIColor lightGrayColor] andTitleUIFontSize:[UIFont systemFontOfSize:19] andItemType:right];
    
    [rightItem addTarget:self selector:@selector(rightMenuPressed:) event:UIControlEventTouchUpInside];
    
}

#pragma mark -- 左边按钮图片
-(void)setLeftMenuWithNorImage:(NSString *)norImage selectImage:(NSString *)selectImage{
    
    WsqCustomBarItem *leftItemImage = [self.navigationItem itemWithImage:norImage andHightImage:selectImage size:CGSizeMake(40, 40) type:left];
    [leftItemImage addTarget:self selector:@selector(leftMenuPressed:) event:UIControlEventTouchUpInside];
}
#pragma mark -- 右边按钮图片
-(void)setRightMenuWithNorImage:(NSString *)norImage selectImage:(NSString *)selectImage{
    
    WsqCustomBarItem *rightItemImage = [self.navigationItem itemWithImage:norImage andHightImage:selectImage size:CGSizeMake(40, 40) type:right];
    
    [rightItemImage addTarget:self selector:@selector(rightMenuPressed:) event:UIControlEventTouchUpInside];
    
}

#pragma mark -- 修改右边按钮的字体颜色
-(void)setRightMenuTitle:(NSString *)rightMenuTitle titleColor:(UIColor *)color{
    
    UIColor *rddd;
    if (self.rightColor) {
        rddd = self.rightColor;
    }else{
        rddd = color;
    }
    WsqCustomBarItem *rightItem = [self.navigationItem itemWithTitle:rightMenuTitle andTitleColor:rddd andTitleUIFontSize:[UIFont systemFontOfSize:16] andItemType:right];
    
    [rightItem addTarget:self selector:@selector(rightMenuPressed:) event:UIControlEventTouchUpInside];

}


#pragma mark -- 左边按钮被点击，子类重载
- (void)leftMenuPressed:(id)sender{

}

#pragma mark -- 右边按钮被点击，子类重载
- (void)rightMenuPressed:(id)sender{
    
}

#pragma mark -- 返回按钮实现功能，子类可重载
- (void)backMenuPressed{
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/**
 *  创建TableView
 */

#pragma mark -- 创建TableView
- (void)createWtableViewWithFrame:(CGRect)frame WithStyle:(UITableViewStyle)style WithBackColor:(UIColor *)color{
    
    self.wTableView = [[UITableView alloc] initWithFrame:frame style:style];
    self.wTableView.backgroundColor = color;
    self.wTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.wTableView.delegate = self;
    self.wTableView.dataSource = self;

    

    [self.view addSubview:self.wTableView];
}

//组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;//
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}
//组头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}
//组尾高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

//行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    
    
    return cell;
}

//行的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


/**
 *  隐藏键盘
 *
 *  @return 返回
 */
#pragma mark -- 二级键盘加个done 法一
- (void)levelTwoKeyboard:(NSArray *)arrray{
    
    texFileArray = arrray;
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
    //设置style
    [topView setBarStyle:0];
    //定义两个flexibleSpace的button，放在toolBar上，这样完成按钮就会在最右边
    UIBarButtonItem* button1 =[[UIBarButtonItem  alloc]initWithBarButtonSystemItem:                                        UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem* button2 = [[UIBarButtonItem  alloc]initWithBarButtonSystemItem:                                        UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    
    UIButton *done = [[UIButton alloc]initWithFrame:CGRectMake(topView.frame.size.width - 60, 0, 40, 40)];
    [done setTitle:@"完成" forState:UIControlStateNormal];
    [done setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [done addTarget:self action:@selector(resignKeyboard:) forControlEvents:UIControlEventTouchUpInside];
    done.titleLabel.font = [UIFont systemFontOfSize:19];
    
    UIBarButtonItem *doneButon = [[UIBarButtonItem alloc] initWithCustomView:done];
    
//    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成"style:UIBarButtonItemStyleDone target:self action:@selector(resignKeyboard:)];
    //在toolBar上加上这些按钮
    NSArray * buttonsArray = [NSArray arrayWithObjects:button1,button2,doneButon,nil];
    [topView setItems:buttonsArray];
    
    for (id subView in arrray) {
        
         [subView setInputAccessoryView:topView];
        
//        if ([subView isKindOfClass:[UITextField class]]) {
//            UITextField *textfile = (UITextField *)subView;
//            [textfile setInputAccessoryView:topView];
//        }else{
//            UITextView * textView = (UITextView *)subView;
//            [textView setInputAccessoryView:topView];
//            
//        }
    }
}
//收回键盘
- (void)resignKeyboard:(UIBarButtonItem *)btn{
    
    for (id subView in texFileArray) {
        
        [subView resignFirstResponder];
//        
//        if ([subView isKindOfClass:[UITextField class]]) {
//            UITextField *textfile = (UITextField *)subView;
//            [textfile resignFirstResponder];
//        }else{
//            UITextView * textView = (UITextView *)subView;
//            [textView resignFirstResponder];
//        }
    }
}

#pragma mark -- 点空白收回键盘 法二
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];

    [self.view endEditing:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




- (id)init{
    self = [super init];
    if (self) {
        self.enablePanGesture = YES;
    }
    return self;
}


//- (void)addHud
//{
//    if (!_hud) {
//        _hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    }
//}
//- (void)addHudWithMessage:(NSString*)message
//{
//    if (!_hud)
//    {
//        _hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        _hud.label.text=message;
//    }
//
//}
//- (void)removeHud
//{
//    if (_hud) {
//        [_hud removeFromSuperview];
//        _hud=nil;
//    }
//}
//
//- (void)requestWithServe:(NSString *)ser andInfos:(NSDictionary *)infos imageData:(NSData *)imageData image:(UIImage *)image completion:(RequestCompletionBlock)block
//{
//
//        NSString *imgeType = [NSString contentTypeWithImageData:imageData];
//    [Tools showMbProgressHud];
//
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer new];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
//
//
//    [manager POST:ser parameters:infos constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
//        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//        formatter.dateFormat = @"yyyyMMddHHmmss";
//        NSString *string = [formatter stringFromDate:[NSDate date]];
//
//        [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"up_file"] fileName:[NSString stringWithFormat:@"%@.jpg",string] mimeType:[NSString stringWithFormat:@"image/%@",imgeType]]; //@"image/jpg/png/jpeg"
//
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        if (self.completionBlock) {
//
//        }
//
//        if ([responseObject isKindOfClass:[NSData class]]) {
//            id dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//            if ([dic isKindOfClass:[NSDictionary class]]) {
//                NSDictionary *dict = (NSDictionary *)dic;
//
//                NSLog(@"成功responseObject:%@",dict);
//
//                if ([dict[@"ret"] integerValue] == 1001) {
//
////                    [self putImageSuccessful:dict];
//                }
//                NSLog(@"成功responseObject：%@",dict);
//
////                [self requestSucc:ser andResults:dict];
//
//            }
//        }else{
//            NSDictionary *dict = (NSDictionary *)responseObject;
//            if ([dict[@"ret"] integerValue] == 1001) {
////                [self putImageSuccessful:dict];
//                NSLog(@"responseObject：%@",dict);
////                [self requesFail:ser FailedDic:dict];
//            }
//
//        }
//
//
//        [Tools hideMbProgressHud];
//
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"----失败--%@",error);
//        [Tools hideMbProgressHud];
//
//    }];
//
//}

//+ (void)requestSucc:(NSString *)ser andResults:(NSDictionary *)results{
//    
//    NSLog(@"成功");
//}
//
//+ (void)requesFail:(NSString *)ser  FailedDic:(NSDictionary *)dic{
//    NSLog(@"失败");
//}



@end
