//
//  YWExpandCollectionViewCell.h
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWCollectionViewCell.h"

@class YWMoveCategory;
@interface YWExpandCollectionViewCell : YWCollectionViewCell

@property (nonatomic, assign) NSInteger textFont;
@property (nonatomic, strong) YWMoveCategory *category;

@end
