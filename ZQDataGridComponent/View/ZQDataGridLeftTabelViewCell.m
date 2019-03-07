//
//  ZQDataGridLeftTabelViewCell.m
//  XPMS
//
//  Created by zhiqing on 2019/1/23.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//

#import "ZQDataGridLeftTabelViewCell.h"

@implementation ZQDataGridLeftTabelViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.isShowBottomLine = YES;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.rightLine];
        [self.contentView addSubview:self.bottomLine];

    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _titleLabel.frame = CGRectMake(0, (self.height - LYMainMidLabelHeight)/2 , self.width - LYLineViewHeight, LYMainMidLabelHeight);
    _rightLine.frame = CGRectMake(_titleLabel.right, 0, LYLineViewHeight, self.height);
    _bottomLine.frame = CGRectMake(0, self.height-1, self.width, 1);

}

- (void)setCellModel:(ZQDataGridLeftTableViewCellModel *)cellModel{
    _cellModel = cellModel;
    self.titleLabel.text = cellModel.titleString;
    
    if (cellModel.backgroundColor) {
        self.contentView.backgroundColor = cellModel.backgroundColor;
    }else{
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    if (cellModel.desLabFont) {
        self.titleLabel.font = cellModel.desLabFont;
    }else{
        self.titleLabel.font =  [UIFont systemFontOfSize:kWord_Font_12pt];
    }
    
    if (cellModel.titleColor) {
        self.titleLabel.textColor = cellModel.titleColor;
    }else{
        self.titleLabel.textColor = [UIColor blackColor];
    }
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:kWord_Font_12pt];
        _titleLabel.textColor = [UIColor blackColor];
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

