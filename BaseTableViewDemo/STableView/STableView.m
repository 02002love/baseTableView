//
//  STableView.m
//  BaseTableViewDemo
//
//  Created by 宋金委 on 2018/11/27.
//  Copyright © 2018 宋金委. All rights reserved.
//

#import "STableView.h"
#import "STableViewCell.h"
#import "UITableView+Animated.h"


@interface STableView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation STableView

#pragma mark - lifeCycle

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame style:UITableViewStylePlain]) {
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor whiteColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.accessibilityElementsHidden = YES;
        self.animatedStyle = TABTableViewAnimationStart;  // 开启动画
        self.estimatedRowHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
    }
    return self;
}
#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    return self.sourceArray.count;
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (STableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    STableViewCell * cell = [STableViewCell initCellInTable:tableView];
    
    if (tableView.animatedStyle != TABTableViewAnimationStart) {
        [cell fillCellWithModel:self.sourceArray[indexPath.row]];
    }
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return .1;
}

@end
