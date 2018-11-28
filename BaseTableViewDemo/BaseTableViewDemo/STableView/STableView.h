//
//  STableView.h
//  BaseTableViewDemo
//
//  Created by 宋金委 on 2018/11/27.
//  Copyright © 2018 宋金委. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface STableView : UITableView

/**
 数据源
 */
@property (strong, nonatomic) NSMutableArray * sourceArray;

- (instancetype) initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
