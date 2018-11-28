//
//  UploadFile.h
//  MyTableViewController
//
//  Created by 宋金委 on 2016/11/15.
//  Copyright © 2016年 HMC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UploadFile : NSObject

@property (copy, nonatomic) NSString * name;

@property (copy, nonatomic) NSString * fileName;

@property (copy, nonatomic) NSString * MIMEType;

@property (copy, nonatomic) NSData * uploadData;


- (instancetype)initWithFile:(id) file name:(NSString * ) name fileName:(NSString * ) fileName MIMEType:(NSString * ) MIMEType;
@end
