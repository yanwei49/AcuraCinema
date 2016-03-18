//
//  YWFourTableViewCell.h
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWFourTableViewCell;
@protocol YWFourTableViewCellDelegate <NSObject>

- (void)fourTableViewCell:(YWFourTableViewCell *)cell didSelectWithIndex:(NSInteger)index;
- (void)fourTableViewCell:(YWFourTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index;

@end
@interface YWFourTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray   *dataSouces;
@property (nonatomic, assign) id<YWFourTableViewCellDelegate> delegate;

@end
