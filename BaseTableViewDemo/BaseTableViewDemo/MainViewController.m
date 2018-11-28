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



@interface MainViewController ()

@property (strong, nonatomic) STableView * sTableView;//列表 分组

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.sTableView];
}

- (STableView *)sTableView{
    
    if (!_sTableView) {
        
        _sTableView = [[STableView alloc]initWithFrame:(CGRect){0,0, WIDTHOFSCREEN, HEIGHTOFSCREEN}];
        _sTableView.backgroundColor = [UIColor whiteColor];
        _sTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _sTableView.accessibilityElementsHidden = YES;
        
    }
    
    return _sTableView;
}

@end
