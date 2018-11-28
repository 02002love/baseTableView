//
//  UtilsFunctions.h
//  wfpios
//
//  Created by HMC on 16/9/23.
//  Copyright © 2016年 wangfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//用户的设备类型
typedef enum : NSUInteger {
    kIPhone = 0,
    kIPad,
    kSimulator,
} kDeveiceType;


//用户的密码类型
typedef enum : NSUInteger {
    weakPsd = 0,
    nomalePsd,
    strongPsd,
} kPsdType;

@interface UtilsFunctions : NSObject


/** 显示列表刷新是否成功的提示消息
 
 @param message 消息内容
 */
+ (void)showMessage:(NSString *)message inputView:(UIView *)view;


/** 显示格式化时间
 
 @param dateString 字符串时间
 @param dateStyle 要转换的时间格式
 EEE         星期
 MM          月
 dd          日
 HH:mm:ss    时分秒
 Z           时区
 yyyy        年
 
 例如 : Wed Mar 06 00:12:15 +0800 2013 -> EEE MM dd HH:mm:ss Z yyyy
 
 @return 返回时间格式
 */
+ (NSString *)showDateFormatter:(NSString *)dateString dateStyle:(NSString *)dateStyle;


/**  分享的相关设置
 
 @param view 分享页面的容器
 @param img 分享的图片
 @param urlString 分享的 URL
 */
//+ (void)showShareActionSheet:(UIView *)view image:(UIImage *)img urlString:(NSString *)urlString;


/** 判定用户设备类型
 */
+ (kDeveiceType)showDeviceType;


/**  获得4位的随机数,作为验证码
 
 @return 验证码
 */
+ (NSString *)generateVerificationCodeString;


/**
 获取随机色
 
 @param alpha 透明度
 @return 返回的随机色
 */
+ (UIColor *)generateRandomColorWithAlpha:(CGFloat)alpha;




/**
 校验手机号
 
 @param tel 被校验手机号
 @return 真假
 */
+ (BOOL)checkTelNum:(NSString *)tel;


/**
 AES加密
 
 @param sourceString 加密前的字符串
 @return 加密后的字符串
 */
+ (NSString *)aes256_encrypt:(NSString *)sourceString;


/**
 AES解密
 
 @param secretString 加密后的字串
 @return 解密后的字串
 */
+ (NSString *)aes256_decrypt:(NSString *)secretString;

/**
 MD5加密
 
 @param sourceString 原始字串
 @return 加密后字串
 */
+ (NSString *)md5_encrypt:(NSString *) sourceString;

/**
 字典转字符串
 
 @param dic 字典
 @return 字符串
 */
+ (NSString*)dictionaryToJsonString:(NSDictionary *)dic;


/**
 字符串转字典
 
 @param jsonString 字符串
 @return 字典
 */
+ (NSDictionary *)jsonStringToDictionary:(NSString *)jsonString;

/**
 请求前的参数加密
 
 @param dict 请求的字典
 @return 加密后的字典
 */
+ (NSDictionary *)params_encryptedWithDict:(NSDictionary *)dict;

/**
 解密返回的结果
 
 @param res 请求返回的结果
 @return 解密后的字典
 */
+ (NSDictionary *)result_decryptWithData:(NSData *)res;

/**
 是否登录
 
 @return yes 登录 no 非登录
 */
+ (BOOL)isLogin;

/**
 跳转登录页面
 
 @param vc 目标 vc
 */
+ (void)goToLoginWithViewController:(UIViewController *)vc;

/**
 监测网络状态
 
 */
+ (void)mornitorNetStatus;




/**
 格式化时间
 
 @param jsonDate /Date(13位)/
 @return  iOS 时间
 */
+ (NSString *)convertJsonDateToIOSDate:(NSString *)jsonDate;




/**
 判断密码强度
 
 @param psd 密码
 @return 密码强度
 */
+ ( NSInteger ) judgePasswordStrength:(NSString*) psd;


/**
 动态计算String高度

 @param width 指定的高度
 @param font 字体
 @param string 字符串
 @return 高度
 */
+ (CGFloat)dynamicHeightWithWidth:(CGFloat)width font:(CGFloat)font str:(NSString *)string;


/**
 动态计算String宽度

 @param height 指定的高的
 @param font 字体
 @param string 字符串
 @return 宽度
 */
+ (CGFloat)dynamicWidthWithHeight:(CGFloat)height font:(CGFloat)font str:(NSString *)string;

@end
