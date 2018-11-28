//
//  STableViewCell.h
//  BaseTableViewDemo
//
//  Created by 宋金委 on 2018/11/27.
//  Copyright © 2018 宋金委. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface STableViewCell : UITableViewCell

/**
 初始化 cell

 @param tableView 所在的 tableView
 @return 实例
 */
+ (instancetype)initCellInTable:(UITableView *)tableView;

/**
 填充 cell

 @param model 实体
 */
- (void)fillCellWithModel:(id)model;

@end

NS_ASSUME_NONNULL_END
