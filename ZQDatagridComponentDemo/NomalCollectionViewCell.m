//
//  NomalCollectionViewCell.m
//  ZQDatagridComponentDemo
//
//  Created by zhiqing on 2019/3/6.
//  Copyright © 2019 zhiqing. All rights reserved.
//

#import "NomalCollectionViewCell.h"

@interface NomalCollectionViewCell()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation NomalCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.lineView];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(0, 0 , self.width, self.height);
    self.lineView.frame = CGRectMake(self.width - LYLineViewHeight, 0, LYLineViewHeight, self.height);
}
- (void)setItemModel:(ZQDataGridLeftTableViewCellModel *)itemModel{
    _itemModel = itemModel;
    self.titleLabel.text = itemModel.titleString;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end
