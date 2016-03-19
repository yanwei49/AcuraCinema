//
//  YWExpandCollectionViewCell.m
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWExpandCollectionViewCell.h"
#import "YWMoveCategory.h"

@implementation YWExpandCollectionViewCell
{
    UIImageView     *_imageView;
    UILabel         *_titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor greenColor];
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.cornerRadius = 5;
        [self.contentView addSubview:_imageView];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.left.offset(0);
        }];
//        
//        UIImageView *iv = [[UIImageView alloc] init];
//        iv.backgroundColor = [UIColor blackColor];
//        [_imageView addSubview:iv];
//        [iv makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.left.right.offset(0);
//            make.height.offset(30);
//        }];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(0);
            make.left.offset(10);
            make.right.offset(-10);
            make.height.offset(30);
        }];
    }
    
    return self;
}

- (void)setTextFont:(NSInteger)textFont {
    _textFont = textFont;
    _titleLabel.font = [UIFont systemFontOfSize:textFont];
}

- (void)setCategory:(YWMoveCategory *)category {
    _category = category;
    _imageView.image = [UIImage imageNamed:category.movieCategoryImage];
    _titleLabel.text = category.movieCategoryName;
}

@end
