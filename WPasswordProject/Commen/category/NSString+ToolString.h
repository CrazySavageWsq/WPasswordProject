//
//  NSString+ToolString.h
//  Tools
//
//  Created by webapps on 2017/6/6.
//  Copyright © 2017年 wsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ToolString)


/**
 判断该字符串是不是一个有效的URL
 
 @return YES：是一个有效的URL or NO
 */
- (BOOL)isValidUrl;


/**
 判断该字符串是不是一个有效的邮箱
 
 @return YES：是一个有效的Email or NO
 */
- (BOOL)isValidEmail;


/**
 判断该字符串是不是一个有效的邮手机号（中国大陆）
 
 @return YES：是一个有效的phoneNum or NO
 */
- (BOOL)isValidPhoneNum;



/**
 判断该字符串是不是一个有效的省份证号（中国大陆）
 
 @return YES：是一个有效的isValidIdentityCard or NO
 */
- (BOOL)isValidIdentityCard;



/**
 根据image的data 判断图片类型
 
 @param data 图片data
 @return 图片类型(png、jpg...)
 */
+ (NSString *)contentTypeWithImageData: (NSData *)data;




/**
 正则匹配用户身份证号18位

 @param  userID 身份证号
 @return bool
 */


 +(BOOL)checkUserIDCard:(NSString *)userID;


/**
 15位或18位身份证号码校验

 @param value 号码
 @return bool
 */
+ (BOOL)validateIDCardNumber:(NSString *)value;



/**
 银行卡正则表达式
 
 @param cardNumber 银行卡号
 @return 是否为满足银行卡号尾数
 */
+ (BOOL)IsBankCard:(NSString *)cardNumber;




/**
 判断@"Null"
 
 @param string 传入字符串
 @return 返回字符串
 */
+ (NSString *)judegeNull:(NSString *)string;



/**
 UT-F8 转码
 
 @param str 字符串
 @return 转码后
 */
+ (NSString *)UTF8:(NSString *)str;


/**
 星星代替名字的一部分
 
 @param name 李元芳
 @return 返回李**
 */
+ (NSString *)getName:(NSString *)name;



/**
 获取当前时间并随机生成一个8位数凭借在一起
 
 @return <#return value description#>
 */
+ (NSString *)getCurrentTimeAddEightNum;




/**
 截取字符串中两个指定字符串中间的字符串
 @param startString 开始
 @param endString 结束
 @return 返回
 */
-(NSString*)subStringFrom:(NSString*)startString to:(NSString*)endString;



/**
 用截取字符串中两个指定字符串中间的字符串替换掉两个指定字符串中间的字符
 @param startString 开始
 @param endString 结束
 @return 返回
 */
-(NSString*)ReplacingsubStringFrom:(NSString*)startString to:(NSString*)endString andWhat:(NSInteger)num;


/**
 处理掉一串字符串中的特殊字符
 
 @param string 传入字符串
 @return 返回处理后的字符串
 */
- (NSString *)deleteTheSpecialCharacters:(NSString *)string;




@end
