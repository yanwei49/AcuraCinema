//
//  YWMovieListViewController.m
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWMovieListViewController.h"
#import "YWMovieListTableViewCell.h"
#import "YWLoadDataSource.h"
#import "YWMoveCategory.h"

@interface YWMovieListViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation YWMovieListViewController
{
    UITableView         *_tableView;
    NSMutableArray      *_dataSouces;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"VIP专区";
    self.view.backgroundColor = [UIColor blackColor];
    _dataSouces = [[NSMutableArray alloc] initWithArray:[[YWLoadDataSource shareInstance] obtainMovieWithType:_category.movieCategoryId withNums:20]];
    
    [self createSubViews];
}

- (void)createSubViews {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = CustomColor(50, 50, 50);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.left.right.offset(0);
    }];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSouces.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YWMovieListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[YWMovieListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.movie = _dataSouces[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self checkIsMember];
}

@end
