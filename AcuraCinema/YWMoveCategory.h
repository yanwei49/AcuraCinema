//
//  YWMoveCategory.h
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    kCategoryHY,
    kCategoryRH,
    kCategoryZF,
    kCategoryNX,
    kCategoryGZ,
    kCategoryLX,
    kCategoryJJ,
    kCategoryRS,
    kCategoryZK,
    kCategoryMV,
    kCategoryYP,
    kCategoryJM,
    kCategoryLL,
    kCategoryWY,
    kCategoryJD,
    kCategoryZX,
    kCategoryTM,
    kCategoryZN,
    kCategoryHB,
    kCategoryQL,
    kCategoryRB,
    kCategoryRU,
    kCategoryXG
} MovieCategoryType;

@interface YWMoveCategory : NSObject

@property (nonatomic, assign) MovieCategoryType movieCategoryId;
@property (nonatomic, strong) NSString *movieCategoryName;
@property (nonatomic, strong) NSString *movieCategoryImage;

@end
