//
//  ZQDataGridLeftTableViewCellModel.h
//  XPMS
//
//  Created by zhiqing on 2019/1/23.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQDataGridBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZQDataGridLeftTableViewCellModel : ZQDataGridBaseCellModel
@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, strong) UIFont *desLabFont;//lab字体大小
@property (nonatomic, strong) UIColor *backgroundColor;//背景颜色
@property (nonatomic, strong) UIColor *titleColor;//字体颜色
@end

NS_ASSUME_NONNULL_END
