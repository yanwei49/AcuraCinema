//
//  YWVedioViewController.m
//  AcuraCinema
//
//  Created by David Yu on 19/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWVedioViewController.h"
#import "YWExpandCollectionViewCell.h"
#import "YWLoadDataSource.h"
#import "YWMoveCategory.h"

@interface YWVedioViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation YWVedioViewController
{
    UICollectionView        *_collectionView;
    NSMutableArray          *_dataSources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _category.movieCategoryName;
    _dataSources = [[NSMutableArray alloc] initWithArray:[[YWLoadDataSource shareInstance] obtainMovieWithType:_category.movieCategoryId withNums:20]];
    
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
        make.top.bottom.offset(0);
        make.left.offset(5);
        make.right.offset(-5);
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self checkIsMember];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kDeviceWidth-15)/2, (kDeviceWidth-5)/2);
}

@end
