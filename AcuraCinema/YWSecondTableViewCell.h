//
//  YWSecondTableViewCell.h
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWSecondTableViewCell;
@protocol YWSecondTableViewCellDelegate <NSObject>

- (void)secondTableViewCell:(YWSecondTableViewCell *)cell didSelectWithIndex:(NSInteger)index;
- (void)secondTableViewCell:(YWSecondTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index;

@end
@interface YWSecondTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray   *dataSouces;
@property (nonatomic, assign) id<YWSecondTableViewCellDelegate> delegate;

@end
