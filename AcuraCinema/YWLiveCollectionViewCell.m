//
//  YWLiveCollectionViewCell.m
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWLiveCollectionViewCell.h"
#import "YWUserModel.h"

@implementation YWLiveCollectionViewCell
{
    UIImageView     *_avator;
    UILabel         *_name;
    UIImageView     *_state;
    UILabel         *_nums;
    UILabel         *_title;
    UILabel         *_address;
    UIImageView     *_background;
    UIImageView     *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _background = [[UIImageView alloc] init];
        _background.backgroundColor = [UIColor greenColor];
        _background.layer.masksToBounds = YES;
        _background.layer.cornerRadius = 5;
        _background.layer.borderWidth = 0.5;
        _background.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self.contentView addSubview:_background];
        [_background makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.offset(0);
        }];
        
        _avator = [[UIImageView alloc] init];
        _avator.backgroundColor = [UIColor whiteColor];
        _avator.layer.masksToBounds = YES;
        _avator.layer.cornerRadius = 20;
        [self.contentView addSubview:_avator];
        [_avator makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(10);
            make.width.height.offset(40);
        }];
        
        _state = [[UIImageView alloc] init];
        _state.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_state];
        [_state makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10);
            make.right.offset(-10);
            make.height.offset(25);
            make.width.offset(50);
        }];
        
        _name = [[UILabel alloc] init];
        _name.backgroundColor = [UIColor whiteColor];
        _name.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_name];
        [_name makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10);
            make.left.equalTo(_avator.mas_right).offset(10);
            make.right.equalTo(_state.mas_left).offset(-10);
            make.height.offset(20);
        }];
        
        _nums = [[UILabel alloc] init];
        _nums.backgroundColor = [UIColor whiteColor];
        _nums.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_nums];
        [_nums makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_name.mas_bottom);
            make.left.equalTo(_avator.mas_right).offset(10);
            make.height.offset(20);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor whiteColor];
        label.text = @"在看";
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_nums.mas_bottom);
            make.left.equalTo(_nums.mas_right);
            make.height.offset(15);
        }];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor redColor];
        [_background addSubview:_imageView];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_avator.mas_bottom).offset(5);
            make.bottom.left.right.offset(0);
        }];
        
        UIView *view1 = [[UIView alloc] init];
        view1.backgroundColor = CustomColor(52,129,201);
        [self.contentView addSubview:view1];
        [view1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_avator.mas_bottom).offset(10);
            make.left.equalTo(_avator.mas_left);
            make.height.offset(20);
            make.width.offset(60);
        }];
        
        UIImageView *iv = [[UIImageView alloc] init];
        iv.backgroundColor = CustomColor(52,129,201);
        [view1 addSubview:iv];
        [iv makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(0);
            make.height.offset(20);
            make.width.offset(18);
        }];
        
        _address = [[UILabel alloc] init];
        _address.backgroundColor = CustomColor(52,129,201);
        _address.textColor = [UIColor whiteColor];
        _address.textAlignment = NSTextAlignmentCenter;
        _address.font = [UIFont systemFontOfSize:14];
        [view1 addSubview:_address];
        [_address makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.offset(0);
            make.left.equalTo(iv.mas_right);
            make.height.offset(20);
            make.width.offset(40);
        }];
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.5;
        [_background addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.height.offset(30);
            make.bottom.left.right.offset(0);
        }];
        
        _title = [[UILabel alloc] init];
        _title.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_title];
        [_title makeConstraints:^(MASConstraintMaker *make) {
            make.height.offset(30);
            make.bottom.right.offset(0);
            make.left.offset(10);
        }];
    }
    
    return self;
}

- (void)setUser:(YWUserModel *)user {
    _user = user;
    _avator.image = [UIImage imageNamed:user.userAvator];
    _name.text = user.userName;
    _nums.text = user.userSeeNums;
    _title.text = user.userInfos;
    _imageView.image = [UIImage imageNamed:user.userImage];
    _address.text = user.userAddress;
}


@end
