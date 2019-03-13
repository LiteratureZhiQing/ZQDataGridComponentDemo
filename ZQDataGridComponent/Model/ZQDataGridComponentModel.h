//
//  dataGridComponentModel.h
//  XPMS
//
//  Created by zhiqing on 2019/1/21.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZQDataGridRightTableViewCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZQDataGridComponentModel : NSObject
@property (nonatomic, assign) CGFloat  firstColumnWidth;  // 第一列的宽度
@property (nonatomic, assign) CGFloat  firstRowHeight;     // 第一行的高度
@property (nonatomic, strong) NSArray * columnWidthArray;       // 列宽数组
@property (nonatomic, assign) CGFloat  rowHeight;         // 行高
@property (nonatomic,strong)  NSArray *rowHeightArr;     //行高数组  -- 不传的话，以rowHeight 定高
@property (nonatomic, strong) ZQDataGridRightTableViewCellModel *headDataModel;   // 上方表头数据
@property (nonatomic, strong) NSArray *leftTableDataArray;   // 左侧方=列表头数据
@property (nonatomic, copy) NSString *leftTableViewCellClass; // 左侧列表cell类名
@property (nonatomic, copy) NSString *setDataMethodName;   //  左侧列表cell 设置数据的方法签名

@property (nonatomic, strong) NSArray *rowDataArray;  // 数据源


@end

NS_ASSUME_NONNULL_END
