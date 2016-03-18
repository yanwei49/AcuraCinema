//
//  YWFiveTableViewCell.h
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWFiveTableViewCell;
@protocol YWFiveTableViewCellDelegate <NSObject>

- (void)fiveTableViewCell:(YWFiveTableViewCell *)cell didSelectWithIndex:(NSInteger)index;

@end
@interface YWFiveTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray   *dataSouces;
@property (nonatomic, assign) id<YWFiveTableViewCellDelegate> delegate;

@end
