//
//  MainViewController.m
//  BaseTableViewDemo
//
//  Created by 宋金委 on 2018/11/27.
//  Copyright © 2018 宋金委. All rights reserved.
//

//定义屏幕宽高
#define WIDTHOFSCREEN  [UIScreen mainScreen].bounds.size.width
#define HEIGHTOFSCREEN [UIScreen mainScreen].bounds.size.height

#import "MainViewController.h"
#import "STableView.h"
#import "FetchData.h"
#import "UITableView+Animated.h"


@interface MainViewController ()<FetchDataDelegate>

@property (strong, nonatomic) STableView * tableViewList;//列表 分组
@property (strong, nonatomic) FetchData * fetchDataTool;//列表 数据请求

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.fetchDataTool fetchData];
    [self.view addSubview:self.tableViewList];
    
}

- (STableView *)tableViewList{
    if (!_tableViewList) {
        _tableViewList = [[STableView alloc]initWithFrame:(CGRect){0,0, WIDTHOFSCREEN, HEIGHTOFSCREEN} style:UITableViewStylePlain];
    }
    return _tableViewList;
}

- (FetchData *)fetchDataTool{
    if (!_fetchDataTool) {
        _fetchDataTool = [FetchData new];
        _fetchDataTool.delegate = self;
    }
    return _fetchDataTool;
}

- (void)fetchDataSuccess:(NSMutableArray *)arr{
    if (arr) {
        
        self.tableViewList.animatedStyle = TABTableViewAnimationEnd;
        
        self.tableViewList.sourceArray = arr;
        [self.tableViewList reloadData];
    }
}

@end
