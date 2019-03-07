//
//  ZQDataGridComponentHeadItemModel.h
//  XPMS
//
//  Created by zhiqing on 2019/1/23.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ZQDataGridBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZQDataGridHeadItemModel : ZQDataGridBaseCellModel
@property (nonatomic, copy) NSString *titleString;  // 标题
@property (nonatomic, strong) UIColor *titleColor;  // 颜色
@property (nonatomic, assign) BOOL isHideLine;//是否隐藏分割线
@property (nonatomic, strong) UIColor *backgroundColor;//背景颜色
@property (nonatomic, strong) UIFont *titleFont; // 文字字号

@end

NS_ASSUME_NONNULL_END
