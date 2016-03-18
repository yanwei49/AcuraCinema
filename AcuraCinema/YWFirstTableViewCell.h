//
//  YWFirstTableViewCell.h
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWFirstTableViewCell;
@protocol YWFirstTableViewCellDelegate <NSObject>

- (void)firstTableViewCell:(YWFirstTableViewCell *)cell didSelectWithIndex:(NSInteger)index;
- (void)firstTableViewCell:(YWFirstTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index;

@end
@interface YWFirstTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray   *dataSouces;
@property (nonatomic, assign) id<YWFirstTableViewCellDelegate> delegate;

@end
