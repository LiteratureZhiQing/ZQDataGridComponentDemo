//
//  ZQDataGridHeadItemCel.m
//  XPMS
//
//  Created by zhiqing on 2019/1/23.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//

#import "ZQDataGridHeadItemCell.h"

@interface ZQDataGridHeadItemCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation ZQDataGridHeadItemCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.lineView];
    }
    return self;
}

- (void)setItemModel:(ZQDataGridHeadItemModel *)itemModel{
    _itemModel = itemModel;
    self.titleLabel.text = itemModel.titleString;
    if (itemModel.titleColor) {
        self.titleLabel.textColor = itemModel.titleColor;
    }else{
        self.titleLabel.textColor = [UIColor blackColor];
    }
    if (itemModel.isHideLine) {
        self.lineView.hidden = YES;
    }else{
        self.lineView.hidden = NO;
    }
    if (itemModel.backgroundColor) {
        self.backgroundColor = itemModel.backgroundColor;
    }
    if (itemModel.titleFont) {
        self.titleLabel.font = itemModel.titleFont;
    }else{
         self.titleLabel.font = [UIFont systemFontOfSize:12];
    }
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 8, self.width - 16, LYMainMidLabelHeight)];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(self.width - LYLineViewHeight, 0, LYLineViewHeight, self.height)];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}
@end
