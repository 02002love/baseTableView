//
//  AFNManager.h
//  MyTableViewController
//
//  Created by HMC on 2016/11/15.
//  Copyright © 2016年 HMC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UploadFile.h"
@interface AFNManager : NSObject


typedef enum : int {
    GET = 0,
    POST = 1,
    DOWNLOAD = 2,
    UPLOAD = 3
} RequestType;



/** 请求函数
 
 @param urlString   请求的 URL
 @param type        请求的类型
 @param parameters  参数
 @param uploadFile  上传的图片
 @param success     成功
 @param failure     失败
 */

+(void)requestwithURLString:(NSString *)urlString
                       type:(RequestType)type
                 parameters:(id)parameters
                uploadFile:(UploadFile *)uploadFile
               successBlock:(void (^)(NSURLSessionDataTask * task ,id rep))success
               failureBlock:(void (^)(NSError * error))failure;


@end
