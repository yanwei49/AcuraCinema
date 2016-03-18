//
//  YWSecondTableViewCell.m
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWSecondTableViewCell.h"

@implementation YWSecondTableViewCell
{
    NSMutableArray *_imageViews;
    NSMutableArray *_labels;
    NSMutableArray *_buttons;
    NSMutableArray *_plays;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        _imageViews = [[NSMutableArray alloc] init];
        _labels = [[NSMutableArray alloc] init];
        _buttons = [[NSMutableArray alloc] init];
        _plays = [[NSMutableArray alloc] init];
   
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor whiteColor];
        [button addTarget:self action:@selector(actionOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        [_buttons addObject:button];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(10);
            make.width.offset((kDeviceWidth-30)/2);
            make.height.offset(170);
        }];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor whiteColor];
        [button addSubview:imageView];
        [_imageViews addObject:imageView];
        [imageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.top.offset(0);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        [button addSubview:label];
        [_labels addObject:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.offset(0);
            make.height.offset(20);
        }];
        
        UIButton *play = [[UIButton alloc] init];
        [play addTarget:self action:@selector(actionPlay:) forControlEvents:UIControlEventTouchUpInside];
        [button addSubview:play];
        [_plays addObject:button];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(button.mas_centerX);
            make.centerY.equalTo(button.mas_centerY);
            make.width.offset(50);
            make.height.offset(30);
        }];
        
        for (NSInteger i=0; i<2; i++) {
            UIButton *button = [[UIButton alloc] init];
            button.backgroundColor = [UIColor whiteColor];
            [button addTarget:self action:@selector(actionOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:button];
            [_buttons addObject:button];
            [button makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset((kDeviceWidth-30)/2+20);
                make.top.offset(10+80*i);
                make.width.offset((kDeviceWidth-30)/2);
                make.height.offset(80);
            }];
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.backgroundColor = [UIColor whiteColor];
            [button addSubview:imageView];
            [_imageViews addObject:imageView];
            [imageView makeConstraints:^(MASConstraintMaker *make) {
                make.left.bottom.right.top.offset(0);
            }];
            
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:15];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            [button addSubview:label];
            [_labels addObject:label];
            [label makeConstraints:^(MASConstraintMaker *make) {
                make.left.bottom.right.offset(0);
                make.height.offset(20);
            }];
            
            UIButton *play = [[UIButton alloc] init];
            [play addTarget:self action:@selector(actionPlay:) forControlEvents:UIControlEventTouchUpInside];
            [button addSubview:play];
            [_plays addObject:button];
            [button makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(button.mas_centerX);
                make.centerY.equalTo(button.mas_centerY);
                make.width.offset(50);
                make.height.offset(30);
            }];
        }
        
        for (NSInteger i=0; i<2; i++) {
            UIButton *button = [[UIButton alloc] init];
            button.backgroundColor = [UIColor whiteColor];
            [button addTarget:self action:@selector(actionOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:button];
            [_buttons addObject:button];
            [button makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset((kDeviceWidth-30)/2*i+10);
                make.top.offset(10+80*i+180);
                make.width.offset((kDeviceWidth-30)/2);
                make.height.offset(80);
            }];
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.backgroundColor = [UIColor whiteColor];
            [button addSubview:imageView];
            [_imageViews addObject:imageView];
            [imageView makeConstraints:^(MASConstraintMaker *make) {
                make.left.bottom.right.top.offset(0);
            }];
            
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:15];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor whiteColor];
            [button addSubview:label];
            [_labels addObject:label];
            [label makeConstraints:^(MASConstraintMaker *make) {
                make.left.bottom.right.offset(0);
                make.height.offset(20);
            }];
            
            UIButton *play = [[UIButton alloc] init];
            [play addTarget:self action:@selector(actionPlay:) forControlEvents:UIControlEventTouchUpInside];
            [button addSubview:play];
            [_plays addObject:button];
            [button makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(button.mas_centerX);
                make.centerY.equalTo(button.mas_centerY);
                make.width.offset(50);
                make.height.offset(30);
            }];
        }
    }
    
    return self;
}


- (void)actionOnClick:(UIButton *)button {
    if ([_delegate respondsToSelector:@selector(secondTableViewCell:didSelectWithIndex:)]) {
        [_delegate secondTableViewCell:self didSelectWithIndex:[_buttons indexOfObject:button]];
    }
}

- (void)actionPlay:(UIButton *)button {
    if ([_delegate respondsToSelector:@selector(secondTableViewCell:didSelectPlayButtonWithIndex:)]) {
        [_delegate secondTableViewCell:self didSelectPlayButtonWithIndex:[_buttons indexOfObject:button]];
    }
}

@end
