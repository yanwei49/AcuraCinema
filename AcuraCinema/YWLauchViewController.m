//
//  YWLauchViewController.m
//  AcuraCinema
//
//  Created by David Yu on 19/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWLauchViewController.h"
#import "YWMoviePlayView.h"

@interface YWLauchViewController ()

@end

@implementation YWLauchViewController
{
    YWMoviePlayView     *_movie1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url = @"";
    _movie1 = [[YWMoviePlayView alloc] initWithFrame:[UIScreen mainScreen].bounds playUrl:url];
    _movie1.backgroundColor = CustomColor(30, 30, 30);
    [self.view addSubview:_movie1];
}

@end
