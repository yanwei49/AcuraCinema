//
//  YWThirdTableViewCell.h
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWThirdTableViewCell;
@protocol YWThirdTableViewCellDelegate <NSObject>

- (void)thirdTableViewCell:(YWThirdTableViewCell *)cell didSelectWithIndex:(NSInteger)index;
- (void)thirdTableViewCell:(YWThirdTableViewCell *)cell didSelectPlayButtonWithIndex:(NSInteger)index;

@end
@interface YWThirdTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray   *dataSouces;
@property (nonatomic, assign) id<YWThirdTableViewCellDelegate> delegate;

@end
