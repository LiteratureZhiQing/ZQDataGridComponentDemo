//
//  ZQDataGridRightTableViewCell.m
//  XPMS
//
//  Created by zhiqing on 2019/1/23.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//

#import "ZQDataGridRightTableViewCell.h"

@interface ZQDataGridRightTableViewCell ()
@property (nonatomic, strong) ZQDataGridRowViewCollectionView *cellView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation ZQDataGridRightTableViewCell

- (void)layoutSubviews{
    [super layoutSubviews];
    _cellView.frame = CGRectMake(0, 0, self.width, self.height);
}

- (void)setDataModel:(ZQDataGridRightTableViewCellModel *)dataModel{
    _dataModel = dataModel;
    [self.contentView addSubview:self.cellView];
    self.cellView.dataModel = dataModel;
    
    
}

- (ZQDataGridRowViewCollectionView *)cellView{
    if (!_cellView) {
        _cellView = [[ZQDataGridRowViewCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height -1)];
        Weak(self);
        _cellView.itemClick = ^(NSInteger row, NSInteger column,UIView * _Nullable tagetView) {
            if (weakself.itemClick) {
                weakself.itemClick(row, column,tagetView);
            }
        };
    }
    return _cellView;
}
@end
