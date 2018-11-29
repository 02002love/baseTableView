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

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.animatedStyle = TABTableViewAnimationStart;  // 开启动画
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor whiteColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.accessibilityElementsHidden = YES;
        self.estimatedRowHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
    }
    return self;
}
#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    [tableView tableViewPlaceHolderShowLabelText:@"空空如也" img:@"empty-img" row:self.sourceArray.count];
    return self.sourceArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (STableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    STableViewCell * cell = [STableViewCell initCellInTable:tableView];
    
    if (tableView.animatedStyle != TABTableViewAnimationStart) {
        if (self.sourceArray.count > 0) {
            [cell fillCellWithModel:self.sourceArray[indexPath.row]];
        }
    }
    
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return .1;
}

- (NSMutableArray *)sourceArray{
    if (!_sourceArray) {
        _sourceArray = [NSMutableArray array];
    }
    return _sourceArray;
}

@end
