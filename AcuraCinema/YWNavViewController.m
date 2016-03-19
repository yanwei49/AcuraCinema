//
//  YWNavViewController.m
//  AcuraCinema
//
//  Created by David Yu on 19/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWNavViewController.h"

@interface YWNavViewController ()

@end

@implementation YWNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationBar.barTintColor = CustomColor(10, 10, 10);
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationBar.tintColor = [UIColor whiteColor];
}

@end
