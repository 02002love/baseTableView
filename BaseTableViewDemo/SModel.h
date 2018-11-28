//
//  SModel.h
//  BaseTableViewDemo
//
//  Created by 宋金委 on 2018/11/28.
//  Copyright © 2018 宋金委. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SModel : NSObject

@property (copy,nonatomic) NSString * title;
@property (copy,nonatomic) NSString * year;
@property (strong,nonatomic) NSMutableDictionary  * images;
@property (copy,nonatomic) NSString * original_title;

@end

NS_ASSUME_NONNULL_END
