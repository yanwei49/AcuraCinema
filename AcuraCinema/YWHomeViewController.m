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
#import "YWThirdTableViewCell.h"
#import "YWFourTableViewCell.h"
#import "YWFiveTableViewCell.h"

@interface YWHomeViewController()<UITableViewDataSource, UITableViewDelegate, YWFirstTableViewCellDelegate, YWFiveTableViewCellDelegate, YWSecondTableViewCellDelegate, YWThirdTableViewCellDelegate, YWFourTableViewCellDelegate>

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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _headDict = @{@"head1": @{@"name": @"激情体验"}, @"head2": @{@"name": @"会员专区", @"nums": @"今日更新43部", @"total": @"总更新5345部"}, @"head3": @{@"name": @"日韩专区", @"nums": @"今日更新25部", @"total": @"总更新15378部"}, @"head4": @{@"name": @"制服诱惑", @"nums": @"今日更新64部", @"total": @"1578"}, @"总更新25738部": @{@"name": @"美女图集"}};
    _dataSouces1 = [[NSMutableArray alloc] init];
    _dataSouces2 = [[NSMutableArray alloc] init];
    _dataSouces3 = [[NSMutableArray alloc] init];
    _dataSouces4 = [[NSMutableArray alloc] init];
    _dataSouces5 = [[NSMutableArray alloc] init];
    
    [self createSubViews];
}

- (void)createSubViews {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = CustomColor(50, 50, 50);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[YWFirstTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [_tableView registerClass:[YWSecondTableViewCell class] forCellReuseIdentifier:@"cell2"];
    [_tableView registerClass:[YWThirdTableViewCell class] forCellReuseIdentifier:@"cell3"];
    [_tableView registerClass:[YWFourTableViewCell class] forCellReuseIdentifier:@"cell4"];
    [_tableView registerClass:[YWFiveTableViewCell class] forCellReuseIdentifier:@"cell5"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.left.right.offset(0);
    }];
}

#pragma mark - YWFirstTableViewCellDelegate
- (void)firstTableViewCell:(YWFirstTableViewCell *)cell didSelectWithIndex:(NSInteger)index {

}

- (void)firstTableViewCell:(YWFirstTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index {

}

#pragma mark - YWFiveTableViewCellDelegate
- (void)fiveTableViewCell:(YWFiveTableViewCell *)cell didSelectWithIndex:(NSInteger)index {

}

- (void)fiveTableViewCell:(YWFiveTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index {
    
}

#pragma mark - YWSecondTableViewCellDelegate
- (void)secondTableViewCell:(YWSecondTableViewCell *)cell didSelectWithIndex:(NSInteger)index {

}

- (void)secondTableViewCell:(YWSecondTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index {
    
}

#pragma mark - YWThirdTableViewCellDelegate
- (void)thirdTableViewCell:(YWThirdTableViewCell *)cell didSelectWithIndex:(NSInteger)index {

}

- (void)thirdTableViewCell:(YWThirdTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index {
    
}

#pragma mark - YWFourTableViewCellDelegate
- (void)fourTableViewCell:(YWFourTableViewCell *)cell didSelectWithIndex:(NSInteger)index {

}

- (void)fourTableViewCell:(YWFourTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index {
    
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
            cell.dataSouces = _dataSouces1;
            cell.delegate = self;
            
            return cell;
        }
            break;
        case 1:
        {
            YWSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
            cell.dataSouces = _dataSouces2;
            cell.delegate = self;

            return cell;
        }
            break;
        case 2:
        {
            YWThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
            cell.dataSouces = _dataSouces3;
            cell.delegate = self;

            return cell;
        }
            break;
        case 3:
        {
            YWFourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
            cell.dataSouces = _dataSouces4;
            cell.delegate = self;

            return cell;
        }
            break;
        case 4:
        {
            YWFiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell5"];
            cell.dataSouces = _dataSouces5;
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
            return 100;
            break;
        case 1:
        case 2:
        case 3:
            return 280;
            break;
        case 4:
            return 370;
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
    UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 10, 20)];
    l1.backgroundColor = [UIColor redColor];
    [view addSubview:l1];
    
    NSArray *keys = @[@"head1", @"head2", @"head3", @"head4", @"head5"];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 60, 30)];
    label1.font = [UIFont systemFontOfSize:14];
    label1.text = _headDict[keys[section]][@"name"];
    [view addSubview:label1];
    
    if (section==1 || section==2 || section == 3) {
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 60, 30)];
        label2.font = [UIFont systemFontOfSize:14];
        NSString *nums = _headDict[keys[section]][@"nums"];
        NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:nums];
        NSRange redRange = NSMakeRange(4, nums.length-5);
        [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange];
        [noteStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:redRange];
        [label2 setAttributedText:noteStr] ;
        [label2 sizeToFit];
        [view addSubview:label2];
        
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 60, 30)];
        label3.font = [UIFont systemFontOfSize:14];
        NSString *total = _headDict[keys[section]][@"name"];
        NSMutableAttributedString *noteStr1 = [[NSMutableAttributedString alloc] initWithString:total];
        NSRange redRange1 = NSMakeRange(3, total.length-4);
        [noteStr1 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange1];
        [noteStr1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:redRange1];
        [label2 setAttributedText:noteStr1] ;
        [label2 sizeToFit];
        [view addSubview:label3];
    }
    
    return view;
}


@end
