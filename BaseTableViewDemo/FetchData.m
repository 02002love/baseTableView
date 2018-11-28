//
//  FetchData.m
//  BaseTableViewDemo
//
//  Created by 宋金委 on 2018/11/28.
//  Copyright © 2018 宋金委. All rights reserved.
//

#import "FetchData.h"
#import "SModel.h"

@interface FetchData()
/**
 订单数据源
 */
@property (strong, nonatomic) NSMutableArray *arr;


@end

@implementation FetchData

- (NSMutableArray *)arr{
    
    if (!_arr) {
        
        _arr = [NSMutableArray array];
    }
    
    return _arr;
}

- (void)fetchData{
    
    [AFNManager requestwithURLString:@"v2/movie/top250" type:POST parameters:nil uploadFile:nil successBlock:^(NSURLSessionDataTask * task, id res) {
        
        NSDictionary * dict = [UtilsFunctions result_decryptWithData:res];
        
        SKLog(@"返回数据 :%@",dict);
        NSArray * subjects = dict[@"subjects"];
        
        for (NSDictionary * subject in subjects) {
            
            SModel * model = [SModel mj_objectWithKeyValues:subject];
            [self.arr addObject:model];
        }
        
        [self.delegate fetchDataSuccess:self.arr];
        
    } failureBlock:^(NSError * error) {
        
    }];
    
}

@end
