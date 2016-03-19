//
//  YWMoviePlayView.h
//  ShowOn
//
//  Created by David Yu on 9/12/15.
//  Copyright © 2015年 yanwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YWMoviePlayView;
@protocol YWMoviePlayViewDelegate <NSObject>

- (void)moviePlayViewPlayDown:(YWMoviePlayView *)view;

@end

@interface YWMoviePlayView : UIView

@property (nonatomic, assign) id<YWMoviePlayViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame playUrl:(NSString *)url;

//停止
- (void)stop;

@end
