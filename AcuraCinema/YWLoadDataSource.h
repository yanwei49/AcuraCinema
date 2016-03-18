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

- (NSArray *)obtainMovieCategory;
- (NSArray *)obtainMovieWithType:(NSInteger)type;
- (NSArray *)obtainPicture;

@end
