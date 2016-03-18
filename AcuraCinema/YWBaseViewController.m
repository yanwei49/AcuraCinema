//
//  YWBaseViewController.m
//  AcuraCinema
//
//  Created by David Yu on 17/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWBaseViewController.h"
#import "YWBuyMemberView.h"

#define ROOT_STATE @"root"

@implementation YWBaseViewController
{
    BOOL                 _isMember;          //是否是会员
    UIView              *_buyMemberBackgroundView;
    YWBuyMemberView     *_buyMemberView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMemberView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _isMember = [[[NSUserDefaults standardUserDefaults] objectForKey:ROOT_STATE] boolValue];
}

- (void)createMemberView {
    _buyMemberBackgroundView = [[UIView alloc] init];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:_buyMemberBackgroundView];
    _buyMemberView = [[YWBuyMemberView alloc] init];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:_buyMemberView];
    _buyMemberBackgroundView.hidden = YES;
    _buyMemberView.hidden = YES;
}

- (void)showNotMemberView {
    _buyMemberBackgroundView.hidden = NO;
    _buyMemberView.hidden = NO;
}

- (void)hiddenNotMemberView {
    _buyMemberBackgroundView.hidden = YES;
    _buyMemberView.hidden = YES;
}


@end

