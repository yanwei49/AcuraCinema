//
//  YWLoadDataSource.m
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWLoadDataSource.h"
#import "YWMovieModel.h"
#import "YWPictureModel.h"
#import "YWUserModel.h"
#import "YWMoveCategory.h"

@implementation YWLoadDataSource
{
    NSMutableArray  *_movieCategory;
    NSMutableArray  *_movie;
    NSMutableArray  *_picture;
}

+(YWLoadDataSource *)shareInstance {
    static YWLoadDataSource *obcj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obcj = [[YWLoadDataSource alloc] init];
    });
    
    return obcj;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _movieCategory = [[NSMutableArray alloc] init];
        _movie = [[NSMutableArray alloc] init];
        _picture = [[NSMutableArray alloc] init];
        
        [self loadMovieCategory];
        [self loadMovie];
        [self loadPicture];
    }
    
    return self;
}

- (void)loadMovieCategory {
    
}

- (void)loadMovie {

}

- (void)loadPicture {

}


- (NSArray *)obtainMovieCategory {
    return _movieCategory;
}

- (NSArray *)obtainMovieWithType:(NSInteger)type {
    NSMutableArray *array = [NSMutableArray array];
    for (YWMovieModel *movie in _movie) {
        if (movie.movieCategory.movieCategoryId == type) {
            [array addObject:movie];
        }
    }
    
    return array;
}

- (NSArray *)obtainPicture {
    return _picture;
}


@end
