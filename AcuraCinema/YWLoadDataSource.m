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
#import "YWMoreModel.h"

@implementation YWLoadDataSource
{
    NSMutableArray  *_movieCategory;
    NSMutableArray  *_movies;
    NSMutableArray  *_pictures;
    NSMutableArray  *_users;
    NSMutableArray  *_mores;
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
        _movies = [[NSMutableArray alloc] init];
        _pictures = [[NSMutableArray alloc] init];
        _users = [[NSMutableArray alloc] init];
        _mores = [[NSMutableArray alloc] init];

//        [self loadMovieCategory];
//        [self loadMovie];
//        [self loadPicture];
//        [self loadUsers];
//        [self loadMore];
    }
    
    return self;
}

- (void)loadMovieCategory {
    NSArray *titles = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    NSArray *images = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    for (NSInteger i=0; i<23; i++) {
        YWMoveCategory *category = [[YWMoveCategory alloc] init];
        category.movieCategoryId = i;
        category.movieCategoryName = titles[i];
        category.movieCategoryImage = images[i];
        
        [_movieCategory addObject:category];
    }
}

- (void)loadMovie {
//    @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""
    NSArray *movieId = @[];
    NSArray *movieName = @[];
    NSArray *movieImage = @[];
    NSArray *movieUrl = @[];
    NSArray *movieTime = @[];
    NSArray *movieState = @[];
    for (NSInteger i=0; i<23; i++) {
        YWMoveCategory *category;
        for (NSInteger k=0; k<23; k++) {
            if ([_movieCategory[k] movieCategoryId] == i) {
                category = _movieCategory[k];
                break;
            }
        }
        for (NSInteger j=0; j<20; j++) {
            YWMovieModel *movie = [[YWMovieModel alloc] init];
            movie.movieId = movieId[i];
            movie.movieName = movieName[i];
            movie.movieImage = movieImage[i];
            movie.movieUrl = movieUrl[i];
            movie.movieTime = movieTime[i];
            movie.movieState = movieState[i];
            movie.movieCategory = category;
            
            [_movies addObject:movie];
        }
    }
}

- (void)loadPicture {
    NSArray *titles = @[@"", @"", @"", @"", @"", @""];
    NSArray *images = @[@"", @"", @"", @"", @"", @""];
    for (NSInteger i=0; i<6; i++) {
        YWPictureModel *picture = [[YWPictureModel alloc] init];
        picture.pictureId = [NSString stringWithFormat:@"%ld", i];
        picture.pictureName = titles[i];
        picture.pictureUrl = images[i];
        
        [_pictures addObject:picture];
    }
}

- (void)loadUsers {
    NSArray *userId = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"];
    NSArray *userName = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    NSArray *userAvator = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    NSArray *userSeeNums = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    NSArray *userImage = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    NSArray *userAddress = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    NSArray *userInfos = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    for (NSInteger i=0; i<10; i++) {
        YWUserModel *user = [[YWUserModel alloc] init];
        user.userId = userId[i];
        user.userName = userName[i];
        user.userAvator = userAvator[i];
        user.userSeeNums = userSeeNums[i];
        user.userImage = userImage[i];
        user.userAddress = userAddress[i];
        user.userInfos = userInfos[i];
        
        [_users addObject:user];
    }
}

- (void)loadMore {
    NSArray *image = @[@"", @""];
    NSArray *detail = @[@"", @""];
    NSArray *installImage = @[@"", @""];
    NSArray *title = @[@"", @""];
    NSArray *info = @[@"", @""];

    for (NSInteger i=0; i<2; i++) {
        YWMoreModel *more = [[YWMoreModel alloc] init];
        more.image = image[i];
        more.detail = detail[i];
        more.installImage = installImage[i];
        more.title = title[i];
        more.info = info[i];
        
        [_mores addObject:more];
    }
}

- (NSArray *)obtainMovieCategory {
    return _movieCategory;
}

- (NSArray *)obtainMovieWithType:(NSInteger)type withNums:(NSInteger)nums {
    NSMutableArray *array = [NSMutableArray array];
    for (YWMovieModel *movie in _movies) {
        if (movie.movieCategory.movieCategoryId == type) {
            [array addObject:movie];
        }
        if (array.count == nums) {
            break;
        }
    }
    
    return array;
}

- (NSArray *)obtainPictureWithNums:(NSInteger)nums {
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i=0; i<nums; i++) {
        [array addObject:_pictures[i]];
    }
    
    return array;
}

- (NSArray *)obtainLives {
    return _users;
}

- (NSArray *)obtainMore {
    return _mores;
}

- (NSArray *)obtainAdvertis {
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i=0; i<6; i++) {
        [array addObject:_movies[i]];
    }
    
    return array;
}

- (NSArray *)obtainHome {
    NSMutableArray *array = [NSMutableArray array];
    NSArray *type = @[@"0", @"1", @"2"];
    for (NSInteger j=0; j<type.count; j++) {
        NSMutableArray *data = [NSMutableArray array];
        for (NSInteger i=0; i<_movies.count; i++) {
            YWMovieModel *movie = _movies[i];
            if (movie.movieCategory.movieCategoryId == j) {
                [data addObject:movie];
            }
            if (data.count == 5) {
                break;
            }
        }
        [array addObject:data];
    }
    
    return array;
}

- (NSArray *)obtainExperience {
    NSMutableArray *array = [NSMutableArray array];
    
    return array;
}

@end
