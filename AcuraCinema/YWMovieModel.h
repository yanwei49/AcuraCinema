//
//  YWMovieModel.h
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YWMoveCategory;
@interface YWMovieModel : NSObject

@property (nonatomic, strong) NSString *movieId;
@property (nonatomic, strong) NSString *movieName;
@property (nonatomic, strong) NSString *movieImage;
@property (nonatomic, strong) NSString *movieUrl;
@property (nonatomic, strong) NSString *movieTime;
@property (nonatomic, strong) NSString *movieTag;       //1.最新   2.最火
@property (nonatomic, strong) YWMoveCategory *movieCategory;

@end
