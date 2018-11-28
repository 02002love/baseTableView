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

@property (strong, nonatomic) STableView * sTableView;//列表 分组
@property (strong, nonatomic) FetchData * fetchDataTool;//列表 分组

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.fetchDataTool fetchData];
    
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.sTableView];
    
    
}

- (STableView *)sTableView{
    if (!_sTableView) {
        _sTableView = [[STableView alloc]initWithFrame:(CGRect){0,0, WIDTHOFSCREEN, HEIGHTOFSCREEN}];
    }
    return _sTableView;
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
        
        self.sTableView.animatedStyle = TABTableViewAnimationEnd;
        
        self.sTableView.sourceArray = arr;
        [self.sTableView reloadData];
    }
}

@end
