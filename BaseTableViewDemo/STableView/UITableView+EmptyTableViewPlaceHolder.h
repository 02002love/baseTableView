//
//  UITableView+EmptyTableViewPlaceHolder.h
//  XHMall
//
//  Created by XH on 2017/7/16.
//  Copyright © 2017年 XH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (EmptyTableViewPlaceHolder)


/**
 当数据为空的时候  展示占位图
 
 @param message 信息
 @param imgName 图片
 @param row 数据个数
 */
- (void)tableViewPlaceHolderShowLabelText:(NSString *)message img:(NSString *)imgName row:(NSInteger )row;

@end
