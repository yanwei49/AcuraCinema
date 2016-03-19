//
//  YWHomeViewController.m
//  AcuraCinema
//
//  Created by David Yu on 17/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWHomeViewController.h"
#import "YWFirstTableViewCell.h"
#import "YWSecondTableViewCell.h"
#import "YWFiveTableViewCell.h"
#import "YWMovieListViewController.h"
#import "YWMovieModel.h"
#import "YWLoadDataSource.h"
#import "YWMoviePlayView.h"

@interface YWHomeViewController()<UITableViewDataSource, UITableViewDelegate, YWFirstTableViewCellDelegate, YWFiveTableViewCellDelegate, YWSecondTableViewCellDelegate>

@end

@implementation YWHomeViewController
{
    UITableView     *_tableView;
    NSDictionary    *_headDict;
    NSMutableArray  *_dataSouces1;
    NSMutableArray  *_dataSouces2;
    NSMutableArray  *_dataSouces3;
    NSMutableArray  *_dataSouces4;
    NSMutableArray  *_dataSouces5;
    YWMoviePlayView *_movie1;
    UIView          *_backView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"夜色秀场";
    _headDict = @{@"head1": @{@"name": @"激情体验"}, @"head2": @{@"name": @"会员专区", @"nums": @"今日更新43部", @"total": @"总更新5345部"}, @"head3": @{@"name": @"日韩专区", @"nums": @"今日更新25部", @"total": @"总更新15378部"}, @"head4": @{@"name": @"制服诱惑", @"nums": @"今日更新64部", @"total": @"总更新25738部"}, @"head5": @{@"name": @"美女图集"}};
//    _dataSouces1 = [[NSMutableArray alloc] initWithArray:[[YWLoadDataSource shareInstance] obtainExperience]];
//    _dataSouces2 = [[NSMutableArray alloc] initWithArray:[[YWLoadDataSource shareInstance] obtainHome][0]];
//    _dataSouces3 = [[NSMutableArray alloc] initWithArray:[[YWLoadDataSource shareInstance] obtainHome][1]];
//    _dataSouces4 = [[NSMutableArray alloc] initWithArray:[[YWLoadDataSource shareInstance] obtainHome][2]];
//    _dataSouces5 = [[NSMutableArray alloc] initWithArray:[[YWLoadDataSource shareInstance] obtainPictureWithNums:6]];
    
    [self createSubViews];
}

- (void)createSubViews {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[YWFirstTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [_tableView registerClass:[YWSecondTableViewCell class] forCellReuseIdentifier:@"cell2"];
    [_tableView registerClass:[YWFiveTableViewCell class] forCellReuseIdentifier:@"cell5"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.left.right.offset(0);
    }];
}

- (void)playWithUrl:(NSString *)url {
    _backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _backView.backgroundColor = [UIColor blackColor];
    [_backView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionDelete)]];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:_backView];
    
    _movie1 = [[YWMoviePlayView alloc] initWithFrame:CGRectMake(0, (kDeviceHeight-200)/2, kDeviceWidth-10, 200) playUrl:url];
    _movie1.backgroundColor = CustomColor(30, 30, 30);
    [_backView addSubview:_movie1];
    
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(actionDelete) forControlEvents:UIControlEventTouchUpInside];
    [_backView addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(40);
        make.width.height.offset(40);
    }];
}

- (void)actionDelete {
    [_backView removeFromSuperview];
    [_movie1 stop];
    [_movie1 removeFromSuperview];
}

#pragma mark - YWFirstTableViewCellDelegate
- (void)firstTableViewCell:(YWFirstTableViewCell *)cell didSelectWithIndex:(NSInteger)index {
    [self checkIsMember];
}

- (void)firstTableViewCell:(YWFirstTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index {
    [self checkIsMember];
}

#pragma mark - YWFiveTableViewCellDelegate
- (void)fiveTableViewCell:(YWFiveTableViewCell *)cell didSelectWithIndex:(NSInteger)index {
    [self checkIsMember];
}

- (void)fiveTableViewCell:(YWFiveTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index {
    [self checkIsMember];
}

#pragma mark - YWSecondTableViewCellDelegate
- (void)secondTableViewCell:(YWSecondTableViewCell *)cell didSelectWithIndex:(NSInteger)index {
    YWMovieListViewController *vc = [[YWMovieListViewController alloc] init];
//    vc.category = [cell.dataSouces[index] movieCategory];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)secondTableViewCell:(YWSecondTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index {
    YWMovieListViewController *vc = [[YWMovieListViewController alloc] init];
//    vc.category = [cell.dataSouces[index] movieCategory];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            YWFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
//            cell.dataSouces = _dataSouces1;
            cell.delegate = self;
            
            return cell;
        }
            break;
        case 1:
        case 2:
        case 3:
        {
            YWSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
//            NSArray *array = @[_dataSouces2, _dataSouces3, _dataSouces4];
//            cell.dataSouces = array[indexPath.section-1];
            cell.delegate = self;

            return cell;
        }
            break;
        case 4:
        {
            YWFiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell5"];
//            cell.dataSouces = _dataSouces5;
            cell.delegate = self;

            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 150;
            break;
        case 1:
        case 2:
        case 3:
        case 4:
            return 455;
            break;
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView  *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 10, 20)];
    l1.backgroundColor = [UIColor redColor];
    [view addSubview:l1];
    
    NSArray *keys = @[@"head1", @"head2", @"head3", @"head4", @"head5"];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 60, 30)];
    label1.font = [UIFont systemFontOfSize:14];
    label1.text = _headDict[keys[section]][@"name"];
    [view addSubview:label1];
    
    if (section==1 || section==2 || section == 3) {
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 100, 30)];
        label2.font = [UIFont systemFontOfSize:14];
        NSString *nums = _headDict[keys[section]][@"nums"];
        NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:nums];
        NSRange redRange = NSMakeRange(4, nums.length-5);
        [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange];
        [noteStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:redRange];
        [label2 setAttributedText:noteStr] ;
        [label2 sizeToFit];
        [view addSubview:label2];
        
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(240, 0, 80, 30)];
        label3.font = [UIFont systemFontOfSize:14];
        NSString *total = _headDict[keys[section]][@"total"];
        NSMutableAttributedString *noteStr1 = [[NSMutableAttributedString alloc] initWithString:total];
        NSRange redRange1 = NSMakeRange(3, total.length-4);
        [noteStr1 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange1];
        [noteStr1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:redRange1];
        [label3 setAttributedText:noteStr1] ;
        [label3 sizeToFit];
        [view addSubview:label3];
    }
    
    return view;
}


@end
