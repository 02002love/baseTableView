//
//  AFNManager.m
//  MyTableViewController
//
//  Created by HMC on 2016/11/15.
//  Copyright © 2016年 HMC. All rights reserved.
//

#import "AFNManager.h"

@implementation AFNManager

+(void)requestwithURLString:(NSString *)urlString
                       type:(RequestType)type
                 parameters:(id)parameters
                 uploadFile:(UploadFile *)uploadFile
               successBlock:(void (^)(NSURLSessionDataTask * task,id rep))success
               failureBlock:(void (^)(NSError * error))failure
{
    urlString = [HOST stringByAppendingString:urlString];
    
    AFHTTPSessionManager * mamanger = [AFHTTPSessionManager manager];
    
    mamanger.requestSerializer.HTTPShouldHandleCookies = YES;
    
    mamanger.requestSerializer = [AFJSONRequestSerializer serializer];
    mamanger.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSSet * set = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", @"text/html",@"text/xml", nil];
    [mamanger.responseSerializer setAcceptableContentTypes:set];
    
    switch (type) {
            
        case GET:
        {
            
            [mamanger GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                if (success) {
                    
                    success(task ,responseObject);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                SKLog(@"%@",error.description);
                if (failure) {
                    
                    failure(error);
                }
                
            }];
            
            break;
        }
            
        case POST:
        {
            
            [mamanger POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                if (success) {
                    
                    success(task,responseObject);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                SKLog(@"%@",error.description);
                if (failure) {
                    
                    failure(error);
                }
            }];
            
            break;
        }
            
        case DOWNLOAD:
        {
            [mamanger POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                if (success) {
                    
                    success(task, responseObject);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                SKLog(@"%@",error.description);
                if (failure) {
                    
                    failure(error);
                }
            }];
            break;
        }
            
        case UPLOAD:
        {
            [mamanger POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                
                [formData appendPartWithFileData:uploadFile.uploadData name:uploadFile.name fileName:uploadFile.fileName mimeType:uploadFile.MIMEType];
                
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                
                //上传进度
                //  int64_t totalUnitCount          总大小
                //  completedUnitCount              已经上穿的大小
                SKLog(@"%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
                // 主线程 刷新UI
                dispatch_async(dispatch_get_main_queue(), ^{
                    //暂时不处理
                    //self.progressView.progress = 1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
                });
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    
                    success(task ,responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                if (failure) {
                    
                    failure(error);
                }
                
            }];
            break;
        }
            
        default:
            break;
            
    }
    
    
}
/*
 
 //网络监控句柄
 AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
 
 //要监控网络连接状态，必须要先调用单例的startMonitoring方法
 [manager startMonitoring];
 
 [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
 //status:
 //AFNetworkReachabilityStatusUnknown          = -1,  未知
 //AFNetworkReachabilityStatusNotReachable     = 0,   未连接
 //AFNetworkReachabilityStatusReachableViaWWAN = 1,   3G
 //AFNetworkReachabilityStatusReachableViaWiFi = 2,   无线连接
 NSLog(@"%d", status);
 }];
 
 */



@end
