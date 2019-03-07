//
//  LYForwardRoomStateView.m
//  XPMS
//
//  Created by zhiqing on 2019/1/21.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//



#import "ZQDataGridComponent.h"
#import "ZQDataGridRightTableViewCell.h"
#import "ZQDataGridLeftTabelViewCell.h"

static NSString * rightTableReuserId = @"rightTableReuserId";
static NSString * leftTableReuserId = @"leftTableReuserId";

@interface ZQDataGridComponent ()

@end

@implementation ZQDataGridComponent

- (instancetype)initWithFrame:(CGRect)frame dataSource:(ZQDataGridComponentModel *)dataSource{
    if (self = [super initWithFrame:frame]) {
        self.dataModel = dataSource;
        [self configUI];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)configUI{
    [self addSubview:self.rightScrollView];
    [self addSubview:self.leftTableView];
    [self.rightScrollView addSubview:self.rightTableView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _leftHeadView.frame = CGRectMake(0, 0,self.dataModel.firstColumnWidth, self.dataModel.firstRowHeight);
    _rightScrollView.frame = CGRectMake(self.dataModel.firstColumnWidth, 0,self.width - self.dataModel.firstColumnWidth, self.height);
    CGFloat rightViewWidth = [self getRightViewWidth];
    _rightHeadView.frame = CGRectMake(0, 0,rightViewWidth, self.dataModel.firstRowHeight);
    _rightScrollView.contentSize = CGSizeMake(rightViewWidth, 0);
    _leftTableView.frame = CGRectMake(0, 0, self.dataModel.firstColumnWidth, self.height);
    _rightTableView.frame = CGRectMake(0, 0,rightViewWidth, _rightScrollView.height);
}

- (CGFloat)getRightViewWidth{
    CGFloat width = 0;
    for (NSNumber * itemwidth in self.dataModel.columnWidthArray) {
        width += itemwidth.doubleValue;
    }
    return width;
}

- (void)reloadData:(ZQDataGridComponentModel *)data{
    self.dataModel = data;
//    for (UIView * view in self.leftHeadView.subviews) {
//        [view removeFromSuperview];
//    }
    data.headDataModel.columnWidthArray = data.columnWidthArray;
    data.headDataModel.itemHeight = data.firstRowHeight;
    self.rightHeadView.dataModel = data.headDataModel;
    [self.leftTableView reloadData];
    [self.rightTableView reloadData];

    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)reloadDataRow:(NSInteger)row{
    
    [self.rightTableView beginUpdates];
    [self.rightTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:(UITableViewRowAnimationNone)];
    [self.rightTableView endUpdates];

}

#pragma -mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView==self.rightTableView){
        CGFloat offsetY= self.rightTableView.contentOffset.y;
        CGPoint timeOffsetY=self.leftTableView.contentOffset;
        timeOffsetY.y=offsetY;
        self.leftTableView.contentOffset=timeOffsetY;
        if(offsetY==0){
            self.leftTableView.contentOffset=CGPointZero;
        }
    }else if(scrollView==self.leftTableView){
        CGFloat offsetY= self.leftTableView.contentOffset.y;
        CGPoint timeOffsetY=self.rightTableView.contentOffset;
        timeOffsetY.y=offsetY;
        self.rightTableView.contentOffset=timeOffsetY;
        if(offsetY==0){
            self.rightTableView.contentOffset=CGPointZero;
        }
    }
    
}

#pragma -mark UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataModel.rowDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataModel.rowHeightArr.count>indexPath.row) {
        NSNumber *height =self.dataModel.rowHeightArr[indexPath.row];
        return  height.floatValue;
    }
    return self.dataModel.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == self.rightTableView) {
        ZQDataGridRightTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:rightTableReuserId];
        if (!cell) {
            cell = [[ZQDataGridRightTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:rightTableReuserId];
        }
        ZQDataGridRightTableViewCellModel *cellmodel =self.dataModel.rowDataArray[indexPath.row];
        cellmodel.columnWidthArray = self.dataModel.columnWidthArray;
        cellmodel.itemHeight = self.dataModel.rowHeight;
        cell.dataModel = cellmodel;
        Weak(self);
        cell.itemClick = ^(NSInteger row, NSInteger column,UIView * _Nullable tagetView) {
              weakself.itemClick(ZQDataGridComponentClickTypeRightTab,row, column,tagetView);
        };
        return cell;
    }else{
        
        if (self.dataModel.leftTableViewCellClass) {
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.dataModel.leftTableViewCellClass];
            if (!cell) {
                cell = [[NSClassFromString(self.dataModel.leftTableViewCellClass) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.dataModel.leftTableViewCellClass];
            }
            SEL sel = NSSelectorFromString(self.dataModel.setDataMethodName);
            if ([cell respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [cell performSelector:sel withObject:self.dataModel.leftTableDataArray[indexPath.row]];
#pragma clang diagnostic pop
            }
            return cell;
        }else{
            ZQDataGridLeftTabelViewCell * cell = [tableView dequeueReusableCellWithIdentifier:leftTableReuserId];
            if (!cell) {
                cell = [[ZQDataGridLeftTabelViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:leftTableReuserId];
            }
            if (self.isHideLeftTableLine) {
                cell.rightLine.hidden = YES;
            }else{
                cell.rightLine.hidden = NO;
            }
            cell.cellModel = self.dataModel.leftTableDataArray[indexPath.row];
            
            return cell;
        }
        
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([tableView isEqual:self.leftTableView]) {
        return self.leftHeadView;
    }else{
        return self.rightHeadView;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.dataModel.firstRowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.leftTableView) {
        self.itemClick(ZQDataGridComponentClickTypeLeftTab, indexPath.row, 0,[tableView cellForRowAtIndexPath:indexPath]);
    }
}

#pragma -mark lazy load
- (UIScrollView *)rightScrollView{
    if (!_rightScrollView) {
        _rightScrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
        _rightScrollView.delegate = self;
        _rightScrollView.bounces = NO;
        _rightScrollView.showsVerticalScrollIndicator = NO;
        _rightScrollView.showsHorizontalScrollIndicator = NO;
    }
    return _rightScrollView;
}

- (UIView *)leftHeadView{
    if (!_leftHeadView) {
        _leftHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.dataModel.firstColumnWidth, self.dataModel.firstRowHeight)];
        _leftHeadView.backgroundColor = [UIColor redColor];
        
    }
    return _leftHeadView;
}

- (ZQDataGridRowViewCollectionView *)rightHeadView{
    if (!_rightHeadView) {
        _rightHeadView = [[ZQDataGridRowViewCollectionView alloc]init];
        _rightHeadView.backgroundColor = [UIColor redColor];
        self.dataModel.headDataModel.columnWidthArray = self.dataModel.columnWidthArray;
        self.dataModel.headDataModel.itemHeight = self.dataModel.firstRowHeight;
        _rightHeadView.dataModel = self.dataModel.headDataModel;
        Weak(self);
        _rightHeadView.itemClick = ^(NSInteger row, NSInteger column,UIView * _Nullable tagetView) {
            weakself.itemClick(ZQDataGridComponentClickTypeHead,row, column,tagetView);
        };
    }
    return _rightHeadView;
}

- (UITableView *)leftTableView{
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.showsVerticalScrollIndicator = NO;
        _leftTableView.showsHorizontalScrollIndicator = NO;
        _leftTableView.clipsToBounds = NO;
    }
    return _leftTableView;
}

- (UITableView *)rightTableView{
    if (!_rightTableView) {
        _rightTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.showsVerticalScrollIndicator = NO;
        _rightTableView.showsHorizontalScrollIndicator = NO;
    }
    return _rightTableView;
}

@end
