//
//  YWLoadDataSource.h
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWLoadDataSource : NSObject

+(YWLoadDataSource *)shareInstance;

- (NSArray *)obtainMovieCategory;  //获取频道页面数据
- (NSArray *)obtainMovieWithType:(NSInteger)type withNums:(NSInteger)nums;  //根据视频分类id获取视频列表
- (NSArray *)obtainPictureWithNums:(NSInteger)nums;  //根据数量获取图片列表
- (NSArray *)obtainLives;  //获取主播列表
- (NSArray *)obtainMore;   //获取更多列表
- (NSArray *)obtainAdvertis;  //获取首页广告
- (NSArray *)obtainHome;  //获取首页视频数据
- (NSArray *)obtainExperience;  //获取首页体验视频数据

@end
