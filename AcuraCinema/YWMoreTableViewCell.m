//
//  YWMoreTableViewCell.m
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWMoreTableViewCell.h"

@implementation YWMoreTableViewCell
{
    UIImageView     *_imageView;
    UILabel         *_nameLabel;
    UILabel         *_vipLabel;
    UILabel         *_detailLabel;
    UIButton        *_installButton;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_imageView];
        [_imageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(10);
            make.height.width.offset(60);
        }];
        
        _installButton = [[UIButton alloc] init];
        _installButton.backgroundColor = [UIColor whiteColor];
        _installButton.userInteractionEnabled = NO;
        [self.contentView addSubview:_installButton];
        [_installButton makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.right.offset(-20);
            make.height.offset(20);
            make.width.offset(60);
        }];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10);
            make.height.offset(20);
            make.left.equalTo(_imageView.mas_right).offset(10);
            make.right.equalTo(_installButton.mas_left).offset(-10);
        }];
        
        _vipLabel = [[UILabel alloc] init];
        _vipLabel.backgroundColor = [UIColor whiteColor];
        _vipLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_vipLabel];
        [_vipLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLabel.mas_bottom);
            make.height.offset(30);
            make.left.equalTo(_imageView.mas_right).offset(10);
            make.right.equalTo(_installButton.mas_left).offset(-10);
        }];
        
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.backgroundColor = [UIColor whiteColor];
        _detailLabel.numberOfLines = 2;
        _detailLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_detailLabel];
        [_detailLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_vipLabel.mas_bottom);
            make.height.offset(40);
            make.left.equalTo(_imageView.mas_right).offset(10);
            make.right.equalTo(_installButton.mas_left).offset(-10);
        }];
    }
    
    return self;
}

@end
