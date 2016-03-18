//
//  YWFiveTableViewCell.m
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWFiveTableViewCell.h"
#import "YWPictureModel.h"

@implementation YWFiveTableViewCell
{
    NSMutableArray *_imageViews;
    NSMutableArray *_labels;
    NSMutableArray *_buttons;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        _imageViews = [[NSMutableArray alloc] init];
        _labels = [[NSMutableArray alloc] init];
        _buttons = [[NSMutableArray alloc] init];
        
        for (NSInteger i=0; i<8; i++) {
            UIButton *button = [[UIButton alloc] init];
            [button addTarget:self action:@selector(actionOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:button];
            [_buttons addObject:button];
            [button makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(10+(kDeviceWidth-30)/2*(i%2));
                make.width.offset((kDeviceWidth-30)/2);
                make.height.offset(80);
                make.top.offset(10+90*(i/2));
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
        }
    }
    
    return self;
}

- (void)actionOnClick:(UIButton *)button {
    if ([_delegate respondsToSelector:@selector(fiveTableViewCell:didSelectWithIndex:)]) {
        [_delegate fiveTableViewCell:self didSelectWithIndex:[_buttons indexOfObject:button]];
    }
}

- (void)setDataSouces:(NSArray *)dataSouces {
    _dataSouces = dataSouces;
    for (NSInteger i=0; i<dataSouces.count; i++) {
        YWPictureModel *picture = dataSouces[i];
        UIImageView *imageView = _imageViews[i];
        UILabel *label = _labels[i];
        imageView.image = [UIImage imageNamed:picture.pictureUrl];
        label.text = picture.pictureName;
    }
}

@end
