//
//  UploadFile.m
//  MyTableViewController
//
//  Created by 宋金委 on 2016/11/15.
//  Copyright © 2016年 HMC. All rights reserved.
//

#import "UploadFile.h"

@implementation UploadFile

- (instancetype)initWithFile:(id) file name:(NSString * ) name fileName:(NSString * ) fileName MIMEType:(NSString * ) MIMEType{
    
    if (self = [super init]) {
        
        if ([file isKindOfClass:[UIImage class]]) {
            
            if (UIImagePNGRepresentation(file) == nil) {
               _uploadData =  UIImageJPEGRepresentation(file, 0.4);
            }else{
            
               _uploadData = UIImagePNGRepresentation(file);
            }
            
        }else{
        
            //暂不处理
        }
        _name = name;
        _fileName = fileName;
        _MIMEType = MIMEType;
    
        
        
    }
    
    return self;
}

@end
