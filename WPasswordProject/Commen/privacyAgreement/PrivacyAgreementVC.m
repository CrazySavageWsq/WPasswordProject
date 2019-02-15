//
//  PrivacyAgreementVC.m
//  WPasswordProject
//
//  Created by Crazy Wang on 2019/2/15.
//  Copyright © 2019年 Crazy Wang. All rights reserved.
//

#import "PrivacyAgreementVC.h"

@interface PrivacyAgreementVC ()<UIWebViewDelegate>

@end

@implementation PrivacyAgreementVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setNavContentMenuTitle:_titleString];
    [self InitInterFace];
}
-(void)InitInterFace
{
    self.view.backgroundColor = RGB(232, 232, 232);
    NSString * path = [[NSBundle mainBundle] pathForResource:_nameString ofType:@"rtf" ];
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(10, 10, WIDTH-20, HEIGHT-64-20)];
    NSURL * url = [NSURL fileURLWithPath:path];
    NSURLRequest * requ = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requ];
    webView.scrollView.bounces= NO;
    webView.layer.cornerRadius = 10.0f;
    webView.clipsToBounds = YES;
    webView.delegate = self;
    
    if (((NSInteger)[[UIScreen mainScreen]bounds].size.height)==480) {
        [webView setScalesPageToFit:YES];
    }
    [self.view addSubview:webView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)SholdBack
{
    POPVIEW;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
}
@end
