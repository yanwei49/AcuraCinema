//
//  YWMineViewController.m
//  AcuraCinema
//
//  Created by David Yu on 17/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWMineViewController.h"

#import "YWMoreViewController.h"
@interface YWMineViewController()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation YWMineViewController
{
    UITableView         *_tableView;
    NSArray             *_images;
    NSArray             *_titles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _titles = @[@"意见投诉", @"会员协议", @"联系客服"];
    _images = @[@"", @"", @""];
    
    [self createSubViews];
}

- (void)createSubViews {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = CustomColor(50, 50, 50);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 40)];
    headView.backgroundColor = SeparatorColor;
    _tableView.tableHeaderView = headView;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.left.right.offset(0);
    }];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(onclick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onclick {
    YWMoreViewController *vc = [[YWMoreViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.imageView.image = [UIImage imageNamed:_images[indexPath.row]];
    cell.textLabel.text = _titles[indexPath.row];
    
    return cell;
}


@end
