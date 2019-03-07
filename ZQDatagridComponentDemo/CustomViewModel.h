//
//  CustomViewModel.h
//  ZQDatagridComponentDemo
//
//  Created by zhiqing on 2019/3/6.
//  Copyright © 2019 zhiqing. All rights reserved.
//

#import "ZQDataGridBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomViewModel : ZQDataGridBaseCellModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;

@end

NS_ASSUME_NONNULL_END
