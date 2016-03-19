//
//  YWMovieListTableViewCell.m
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWMovieListTableViewCell.h"
#import "YWMovieModel.h"

@implementation YWMovieListTableViewCell
{
    UIImageView     *_imageView;
    UIImageView     *_stateImageView;
    UILabel         *_timeLabel;
    UILabel         *_titleLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor blackColor];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_imageView];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(10);
            make.width.height.offset(80);
        }];
        
        _stateImageView = [[UIImageView alloc] init];
        _stateImageView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_stateImageView];
        [_stateImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10);
            make.left.equalTo(_imageView.mas_right).offset(10);
            make.height.offset(20);
            make.width.offset(50);
        }];
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.backgroundColor = [UIColor whiteColor];
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_timeLabel];
        [_timeLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10);
            make.height.offset(20);
            make.left.equalTo(_stateImageView.mas_right).offset(10);
        }];
        
        UIImageView *iv = [[UIImageView alloc] init];
        iv.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:iv];
        [iv makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.offset(-10);
            make.width.offset(15);
            make.height.offset(20);
        }];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(iv.mas_left).offset(-10);
            make.height.offset(20);
            make.left.equalTo(_stateImageView.mas_left);
        }];
    }
    
    return self;
}

- (void)setMovie:(YWMovieModel *)movie {
    _movie = movie;
    _imageView.image = [UIImage imageNamed:movie.movieImage];
    NSArray *states = @[@"", @"", @""];
    _stateImageView.image = [UIImage imageNamed:states[movie.movieState.integerValue-1]];
    _timeLabel.text = [NSString stringWithFormat:@"【%@】", movie.movieTime];
    _titleLabel.text = movie.movieName;
}

@end
