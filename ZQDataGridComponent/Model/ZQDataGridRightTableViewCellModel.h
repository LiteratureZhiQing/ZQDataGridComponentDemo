//
//  ZQDataGridRightTableViewCellModel.h
//  XPMS
//
//  Created by zhiqing on 2019/1/23.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQDataGridBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZQDataGridRightTableViewCellModel : ZQDataGridBaseCellModel
@property (nonatomic, copy) NSString *collectionViewCellClass; // 每个单元格小item cell类型
@property (nonatomic, copy) NSString *setDataMethodName;   // cell 设置数据的方法签名
@property (nonatomic, strong) NSArray *columnWidthArray;
@property (nonatomic, assign) CGFloat  itemHeight;          // 单元格高度
@property (nonatomic, strong) NSArray *itemModelArray; //  每个单元格小item 数组
@end

NS_ASSUME_NONNULL_END
