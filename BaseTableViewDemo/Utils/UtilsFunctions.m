//
//  UtilsFunctions.m
//  wfpios
//
//  Created by HMC on 16/9/23.
//  Copyright © 2016年 wangfei. All rights reserved.
//

#import "UtilsFunctions.h"
#import <CommonCrypto/CommonCrypto.h>
#import <Foundation/Foundation.h>

@implementation UtilsFunctions


+ (void)showMessage:(NSString *)message inputView:(UIView *)view{
    
    NSDictionary * dics = @{NSFontAttributeName: [UIFont systemFontOfSize:12.0]};
    
    CGSize labelSize = [message boundingRectWithSize:CGSizeMake(WIDTHOFSCREEN,CGFLOAT_MAX) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dics context:nil].size;
    
    //UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showView =  [[UIView alloc]initWithFrame:CGRectMake(0, view.bounds.size.height - (labelSize.height+10), WIDTHOFSCREEN, labelSize.height+10)];
    
    showView.backgroundColor = [UIColorFromRGB(0xf36303) colorWithAlphaComponent:0.9];
    showView.alpha = 1.0f;
    
    //showView.layer.cornerRadius = 5.0f;
    //showView.layer.masksToBounds = YES;
    //[window addSubview:showView];
    
#warning 此处的 showView 应该在 view 的后面但是实际不在其后,需要修复的 bug
    [((UINavigationBar *)view) insertSubview:showView atIndex:0];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0 , WIDTHOFSCREEN, labelSize.height+10);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:12];
    [showView addSubview:label];
    
    
    [UIView animateWithDuration:1.0 animations:^{
        
        showView.frame = CGRectMake(0, view.bounds.size.height , WIDTHOFSCREEN, labelSize.height+10);
    }];
    
    [UIView animateWithDuration:1.0 delay:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        showView.frame = CGRectMake(0, view.bounds.size.height - (labelSize.height+10), WIDTHOFSCREEN, labelSize.height+10);
        
        showView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [showView removeFromSuperview];
    }];
}


+ (NSString *)showDateFormatter:(NSString *)dateString dateStyle:(NSString *)dateStyle{
    
    NSDateFormatter * format = [[NSDateFormatter alloc]init];
    [format setDateFormat:dateStyle];
    [format setLocale:[NSLocale localeWithLocaleIdentifier:@"en"]];
    
    NSDate * createDate = [format dateFromString:dateString];
    SKLog(@"%@",createDate);
    NSDate * now = [NSDate new];
    NSTimeInterval secondCount = [now timeIntervalSinceDate:createDate];
    
    //NSCalendar * calen = [NSCalendar currentCalendar];
    //NSInteger types = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    //    NSDateComponents * comp =[calen components:types fromDate:createDate toDate:now options:0];
    //    NSInteger year = comp.year;
    //    NSInteger month = comp.month;
    //    NSInteger day = comp.day;
    //    NSInteger hour = comp.hour;
    //    NSInteger min = comp.minute;
    
    
    
    if (secondCount < 60) {
        // 0 - 60秒
        return @"刚刚";
        
    }else if (secondCount < 60 * 60 && secondCount >= 60) {
        // 1 - 60分钟
        return [NSString stringWithFormat:@"%d分钟前",(int)(secondCount / 60)];
        
    }else if (secondCount < 24 * 60 * 60 && secondCount >= 60 * 60) {
        // 1 - 24小时 今天 00:55
        [format setDateFormat:@"HH:mm"];
        NSString * dateStr = [format stringFromDate:createDate];
        return [NSString stringWithFormat:@"今天 %@",dateStr];
        
    }else if (secondCount < 48 * 60 * 60 && secondCount >= 60 * 60 *24) {
        // 24 - 48小时 昨天 00:55
        [format setDateFormat:@"HH:mm"];
        NSString * dateStr = [format stringFromDate:createDate];
        return [NSString stringWithFormat:@"昨天 %@",dateStr];
        
    }else if (secondCount < 24 * 60 * 60 * 365 && secondCount >= 24 * 60 * 60) {
        //一年之内 11月18号 15:33
        [format setDateFormat:@"MM-dd HH:mm"];
        NSString * dateStr = [format stringFromDate:createDate];
        return dateStr;
        
    }else{
        
        //一年之外 2015年3月23号 05:23
        [format setDateFormat:@"yyyy-MM-dd HH:mm"];
        NSString * dateStr = [format stringFromDate:createDate];
        return dateStr;
        
    }
    
}

/**
 *  显示分享菜单
 *
 *  @param view 容器视图
 */

//+ (void)showShareActionSheet:(UIView *)view image:(UIImage *)img urlString:(NSString *)urlString;
//{
//    //显示分享面板
//    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
//
//        //if (platformType == UMSocialPlatformType_Sina) {
//
//            [self shareImageAndTextToPlatformType:platformType image:img urlString:urlString];
//
////        }else{
////
////            [self shareWebPageToPlatformType:platformType image:img urlString:urlString];
////        }
//
//    }];
//}

//网页分享 --暂时不用,因为截屏可以发送图片
//+ (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType image:(UIImage *)img urlString:(NSString *)urlString
//{
//    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//
//    //创建网页内容对象
//    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"i'm Song" descr:@"一个神奇的APP" thumImage:img];
//    //设置网页地址
//    shareObject.webpageUrl = urlString;
//
//    //分享消息对象设置分享内容对象
//    messageObject.shareObject = shareObject;
//
//    //调用分享接口
//    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
//        if (error) {
//            NSLog(@"************Share fail with error %@*********",error);
//        }else{
//            UMSocialShareResponse * rep = (UMSocialShareResponse *)data;
//            NSLog(@"response data is %@",rep.message);
//            [SVProgressHUD showSuccessWithStatus:@"分享成功"];
//        }
//    }];
//}



+(kDeveiceType)showDeviceType{
    
    if ([[UIDevice currentDevice].model rangeOfString:@"nsStrIphone"].location != NSNotFound) {
        
        SKLog(@"此设备是 iPhone");
        return kIPhone;
    }else{
        
        SKLog(@"此设备是 iPad");
        //[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft animated:YES];
        return kIPad;
    }
}

//分享图片和文字
//+ (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType image:(UIImage *)img urlString:(NSString *)urlString
//{
//    //创建分享消息对象
//    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//
//    //设置文本
////    messageObject.text = @"这是一个神奇的APP,http://02002love.coding.me";
//    messageObject.text = urlString;
//
//    //创建图片内容对象
//    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
//    //如果有缩略图，则设置缩略图
//
////    shareObject.thumbImage = [UIImage imageNamed:@"logo"];
////    shareObject.shareImage = [UIImage imageNamed:@"logo"];
//    shareObject.thumbImage = img;
//    shareObject.shareImage = img;
//
//
//    //分享消息对象设置分享内容对象
//    messageObject.shareObject = shareObject;
//
//#ifdef UM_Swift
//    [UMSocialSwiftInterface shareWithPlattype:platformType messageObject:messageObject viewController:self completion:^(UMSocialShareResponse * data, NSError * error) {
//#else
//        //调用分享接口
//        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
//#endif
//            if (error) {
//                UMSocialLogInfo(@"************Share fail with error %@*********",error);
//            }else{
//                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
//                    UMSocialShareResponse *resp = data;
//                    //分享结果消息
//                    UMSocialLogInfo(@"response message is %@",resp.message);
//                    //第三方原始返回的数据
//                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
//
//                }else{
//                    UMSocialLogInfo(@"response data is %@",data);
//                }
//
//                [SVProgressHUD showSuccessWithStatus:@"分享成功"];
//            }
//            //[self alertWithError:error];
//        }];
//    }

/**
 * 获得4位的随机数,作为验证码
 */
+ (NSString *)generateVerificationCodeString
{
    static int kNumber = CHAPCHA_NUMBER;
    
    NSString *sourceStr = @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = arc4random() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

+ (UIColor *)generateRandomColorWithAlpha:(CGFloat)alpha{
    
    
    return [UIColor colorWithRed:arc4random()%100 / 100.0 green:arc4random()%100 / 100.0 blue:arc4random()%100 / 100.0 alpha:alpha];
    
}

+ (BOOL)checkTelNum:(NSString *)tel{
    
    
    if (tel.length == 0) {
        
        [SVProgressHUD showInfoWithStatus:@"手机号不能为空"];
        
        return NO;
    }else{
        
        if (tel.length != 11) {
            
            [SVProgressHUD showInfoWithStatus:@"手机号长度不正确"];
            
            return NO;
        }else{
            
            
            NSString * rule = @"^1[3|4|5|67|8]\\d{9}";
            NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",rule];
            
            if([pred evaluateWithObject:tel]){
                
                return YES;
                
            }else{
                
                [SVProgressHUD showInfoWithStatus:@"手机号格式不正确"];
                
                return NO;
            }
            
        }
        
    }
    
}

static NSString * KEY_ENCODE = @"aaaaaaaaaaaaaaaa";

+ (NSString *)aes256_encrypt:(NSString *)sourceString
{
    
    
    //2017年06月27日15:34:35
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [KEY_ENCODE getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSData *sourceData = [sourceString dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [sourceData length];
    size_t buffersize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(buffersize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode , keyPtr, kCCBlockSizeAES128, keyPtr, [sourceData bytes], dataLength, buffer, buffersize, &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData *encryptData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        //对加密后的二进制数据进行base64转码
        return [encryptData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    else
    {
        free(buffer);
        return nil;
    }
}

+ (NSString *)aes256_decrypt:(NSString *)secretString
{
    //先对加密的字符串进行base64解码
    NSData *decodeData = [[NSData alloc] initWithBase64EncodedString:secretString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [KEY_ENCODE getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [decodeData length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, keyPtr, kCCBlockSizeAES128, NULL, [decodeData bytes], dataLength, buffer, bufferSize, &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return result;
    }
    else
    {
        free(buffer);
        return nil;
    }
}

+ (NSString *)md5_encrypt:(NSString *) sourceString{
    
    if (!sourceString) {
        
        return nil;
    }
    const char * cStr = sourceString.UTF8String ;
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest );
    
    //    NSMutableString *outputString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    NSMutableString *outputString = [NSMutableString new];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [outputString appendFormat:@"%02x", digest[i]];
    
    return outputString;
}


//字典转字符串
+ (NSString*)dictionaryToJsonString:(NSDictionary *)dic
{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

//字符串转字典
+ (NSDictionary *)jsonStringToDictionary:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


//请求前的参数加密
+ (NSDictionary *)params_encryptedWithDict:(NSDictionary *)dict{
    
    NSString * param = [UtilsFunctions dictionaryToJsonString:dict];
    
    NSDictionary * parameters = [NSDictionary dictionaryWithObjectsAndKeys:[UtilsFunctions aes256_encrypt:param], @"param",nil];
    
    return parameters;
    
    
    
}

+ (NSDictionary *)result_decryptWithData:(NSData *)res{
    
    
    NSString * result = [[NSString alloc] initWithData:res encoding:NSUTF8StringEncoding];
    
//    result = [UtilsFunctions aes256_decrypt:result];
    
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:[result dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
    
    
    return dict;
    
}

+ (BOOL)isLogin{
    
    NSString * UserCookie = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserCookie"];
    
//    if (UserCookie == nil) {
//
//
//        return NO;
//
//    }else{
    
        return YES;
        
//    }
    
    
}

//
//typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
//    AFNetworkReachabilityStatusUnknown          = -1, //未知
//    AFNetworkReachabilityStatusNotReachable     = 0,  //无连接
//    AFNetworkReachabilityStatusReachableViaWWAN = 1,  //3G
//    AFNetworkReachabilityStatusReachableViaWiFi = 2,  //WIFI

#warning 需要修改
+ (void)mornitorNetStatus{
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                //未知网络
                NSLog(@"未知网络");
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                //无法联网
                NSLog(@"无法联网");
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                //手机自带网络
                NSLog(@"当前使用的是2g/3g/4g网络");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                //WIFI
                NSLog(@"当前在WIFI网络下");
            }
                
        }
    }];
}

/**
 * @brief  将Json数据中的Date截取转换成yyyy-MM-dd HH:mm:ss格式的字符串
 * @param jsonDate json数据的Date
 * @return  返回yyyy-MM-dd HH:mm:ss格式的字符串,至于转换成NSDate,自己看着办
 */
+ (NSString *)convertJsonDateToIOSDate:(NSString *)jsonDate
{
    //返回的Json日期应该是这样的Date(xxxxxxxxx)
    NSString *tmpStr = [jsonDate substringWithRange:NSMakeRange(6, 13)];
    //将json日期转变为ios的系统时间
    NSTimeInterval userTime = [tmpStr doubleValue];
    
    //设定时间格式,这里可以设置成自己需要的格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    //这里比较关键,需要将NSTimeInterval除以1000
    NSString *iosDate = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:userTime/1000.0]];
    //    [dateFormatter release];
    
    return iosDate;
}

+ ( NSInteger ) judgePasswordStrength:(NSString*) psd{
    
    
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];
    
    
    
    NSArray* termArray1 = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];
    
    NSArray* termArray2 = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", nil];
    
    NSArray* termArray3 = [[NSArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    
    NSArray* termArray4 = [[NSArray alloc] initWithObjects:@"~",@"`",@"@",@"#",@"$",@"%",@"^",@"&",@"*",@"(",@")",@"-",@"_",@"+",@"=",@"{",@"}",@"[",@"]",@"|",@":",@";",@"“",@"'",@"‘",@"<",@",",@".",@">",@"?",@"/",@"、", nil];
    
    
    
    NSString* result1 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray1 Password:psd]];
    
    NSString* result2 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray2 Password:psd]];
    
    NSString* result3 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray3 Password:psd]];
    
    NSString* result4 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray4 Password:psd]];
    
    [resultArray addObject:[NSString stringWithFormat:@"%@",result1]];
    
    [resultArray addObject:[NSString stringWithFormat:@"%@",result2]];
    
    [resultArray addObject:[NSString stringWithFormat:@"%@",result3]];
    
    [resultArray addObject:[NSString stringWithFormat:@"%@",result4]];
    
    
    
    int intResult=0;
    
    for (int j=0; j<[resultArray count]; j++)
        
    {
        if ([[resultArray objectAtIndex:j] isEqualToString:@"1"])
            
        {
            intResult++;
        }
    }
    
    NSInteger result = weakPsd;
    
    if (intResult <2)
    {
        result = weakPsd;
    }
    
    else if (intResult == 2&&[psd length]>=6)
    {
        result = nomalePsd;
    }
    
    if (intResult > 2&&[psd length]>=6)
    {
        result = strongPsd;
    }
    return result;
    
}


//判断是否包含
+ (BOOL) judgeRange:(NSArray*) termArray Password:(NSString*) psd
{
    NSRange range;
    BOOL result =NO;
    for(int i=0; i<[termArray count]; i++)
    {
        range = [psd rangeOfString:[termArray objectAtIndex:i]];
        if(range.location != NSNotFound)
        {
            result =YES;
        }
    }
    return result;
}




+ (CGFloat)dynamicHeightWithWidth:(CGFloat)width font:(CGFloat)font str:(NSString *)string{
    
    UIFont * fonts = [UIFont systemFontOfSize:font];
    CGSize size  =CGSizeMake(width, 10000.0);
    NSDictionary * dict  = [NSDictionary dictionaryWithObjectsAndKeys:fonts,NSFontAttributeName ,nil];
    size = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    return size.height;
}


+ (CGFloat)dynamicWidthWithHeight:(CGFloat)height font:(CGFloat)font str:(NSString *)string{

    UIFont * fonts = [UIFont systemFontOfSize:font];
    CGSize size  = CGSizeMake(10000.0,height);
    NSDictionary * dict  = [NSDictionary dictionaryWithObjectsAndKeys:fonts,NSFontAttributeName ,nil];
    size = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    return size.width;
}


@end
