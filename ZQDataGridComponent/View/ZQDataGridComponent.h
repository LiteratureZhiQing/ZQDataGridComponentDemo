//
//  dataGridComponent.h
//  XPMS
//
//  Created by zhiqing on 2019/1/21.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ZQDataGridComponentModel.h"
#import "ZQDataGridRowViewCollectionView.h"
typedef void (^itemClick)(ZQDataGridComponentClickType type ,NSInteger row ,NSInteger column,UIView * tagetView);

NS_ASSUME_NONNULL_BEGIN

@interface ZQDataGridComponent: UIView <UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIScrollView *rightScrollView; // 横向滚动视图
@property (nonatomic, strong) UIView *leftHeadView; // 左侧表头视图
@property (nonatomic, strong) UITableView *leftTableView; // 左侧表头视图
@property (nonatomic, assign) BOOL isHideLeftTableLine;//是否展示左侧表头分割线


@property (nonatomic, strong) ZQDataGridRowViewCollectionView *rightHeadView; // 右侧表头视图
@property (nonatomic, strong) UITableView *rightTableView; // 右侧内容视图

@property (nonatomic, strong) ZQDataGridComponentModel *dataModel;  // 数据模型

@property (nonatomic,copy) itemClick itemClick;   // 点击事件


/**
 初始化方法

 @param frame 大小位置
 @param dataSource 表格数据源
 @return 表格控件
 */
- (instancetype)initWithFrame:(CGRect)frame dataSource:(ZQDataGridComponentModel *)dataSource;


/**
 刷新方法

 @param data 表格数据源
 */
- (void)reloadData:(ZQDataGridComponentModel *)data;


/**
 刷新指定行列

 @param row 行号
 */
- (void)reloadDataRow:(NSInteger)row;

@end

NS_ASSUME_NONNULL_END
