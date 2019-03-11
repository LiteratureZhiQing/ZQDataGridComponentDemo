//
//  ZQDataGridRowViewCollectionView.m
//  XPMS
//
//  Created by zhiqing on 2019/1/23.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//

#import "ZQDataGridRowViewCollectionView.h"

@interface ZQDataGridRowViewCollectionView () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation ZQDataGridRowViewCollectionView

- (void)layoutSubviews{
    [super layoutSubviews];
    _collectionView.frame = CGRectMake(0, 0, self.width, self.height - LYLineViewHeight);
    _bottomLine.frame = CGRectMake(0, _collectionView.bottom, self.width, LYLineViewHeight);
}
- (void)setDataModel:(ZQDataGridRightTableViewCellModel *)dataModel{
    _dataModel = dataModel;
    [self addSubview:self.collectionView];
    [self addSubview:self.bottomLine];
    if (self.dataModel.collectionViewCellClass) {
        Class class = NSClassFromString(self.dataModel.collectionViewCellClass);
        [self.collectionView registerClass:class forCellWithReuseIdentifier:self.dataModel.collectionViewCellClass];
    }
    [self.collectionView reloadData];
}

#pragma -mark UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataModel.itemModelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.dataModel.collectionViewCellClass forIndexPath:indexPath];
    SEL sel = NSSelectorFromString(self.dataModel.setDataMethodName);
    if ([cell respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [cell performSelector:sel withObject:self.dataModel.itemModelArray[indexPath.row]];
#pragma clang diagnostic pop
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.itemClick) {
        ZQDataGridBaseCellModel * model = (ZQDataGridBaseCellModel *)self.dataModel.itemModelArray[indexPath.row];
        self.itemClick(model.numOfRowIndex, model.numOfColumnNumIndex,[collectionView cellForItemAtIndexPath:indexPath]);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger width = [self.dataModel.columnWidthArray[indexPath.row] integerValue];
    return CGSizeMake(width, self.dataModel.itemHeight);
}

#pragma -mark lazy load

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        if (self.dataModel.collectionViewCellClass) {
            Class class = NSClassFromString(self.dataModel.collectionViewCellClass);
            [_collectionView registerClass:class forCellWithReuseIdentifier:self.dataModel.collectionViewCellClass];
        }
       
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
    }
    return _layout;
}

- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc]init];
        _bottomLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _bottomLine;
}

@end
