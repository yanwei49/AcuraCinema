//
//  YWExpandViewController.m
//  AcuraCinema
//
//  Created by David Yu on 17/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWExpandViewController.h"
#import "YWExpandCollectionViewCell.h"
#import "YWLoadDataSource.h"

@interface YWExpandViewController()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation YWExpandViewController
{
    UICollectionView        *_collectionView;
    NSMutableArray          *_dataSources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSources = [[NSMutableArray alloc] init];
    [_dataSources addObjectsFromArray:[[YWLoadDataSource shareInstance] obtainMovieCategory]];
    
    [self createSubViews];
}

- (void)createSubViews {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [_collectionView registerClass:[YWExpandCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [_collectionView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.offset(0);
    }];
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSources.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YWExpandCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.category = _dataSources[indexPath.row];
    
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kDeviceWidth-15)/2, (kDeviceWidth-15)/2);
}

@end
