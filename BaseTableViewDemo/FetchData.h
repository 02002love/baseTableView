//
//  FetchData.h
//  BaseTableViewDemo
//
//  Created by 宋金委 on 2018/11/28.
//  Copyright © 2018 宋金委. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FetchDataDelegate <NSObject>

@required

- (void) fetchDataSuccess:(NSMutableArray *) arr;

@end

@interface FetchData : NSObject

@property (nonatomic, weak) id <FetchDataDelegate> delegate;

- (void)fetchData;

@end

NS_ASSUME_NONNULL_END
