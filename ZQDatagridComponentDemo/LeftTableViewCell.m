//
//  LeftTableViewCell.m
//  ZQDatagridComponentDemo
//
//  Created by zhiqing on 2019/3/6.
//  Copyright © 2019 zhiqing. All rights reserved.
//

#import "LeftTableViewCell.h"

@interface LeftTableViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subLabel;
@property (nonatomic, strong) UIView  *rightLine;
@property (nonatomic, strong) UIView  *bottomLine;
@end

@implementation LeftTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subLabel];
        [self.contentView addSubview:self.rightLine];
        [self.contentView addSubview:self.bottomLine];
        self.contentView.clipsToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(0, 0, self.width - LYLineViewHeight, self.height * 0.5);
    self.subLabel.frame = CGRectMake(0, self.titleLabel.bottom, self.width - LYLineViewHeight, self.height * 0.5);
    _rightLine.frame = CGRectMake(_titleLabel.right, 0, LYLineViewHeight, self.height);
    _bottomLine.frame = CGRectMake(0, self.height - LYLineViewHeight, self.width, LYLineViewHeight);
}

- (void)setModel:(LeftCellModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
    self.subLabel.text = model.subTitle;
}

- (UILabel *)subLabel{
    if (!_subLabel) {
        _subLabel = [[UILabel alloc]init];
        _subLabel.font = [UIFont systemFontOfSize:12];
        _subLabel.textColor = [UIColor redColor];
        _subLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _subLabel;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIView *)rightLine{
    if (!_rightLine) {
        _rightLine = [[UIView alloc]init];
        _rightLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _rightLine;
}
- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc]init];
        _bottomLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _bottomLine;
}
@end
