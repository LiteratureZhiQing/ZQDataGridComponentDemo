//
//  CustomCollectionViewCell.h
//  ZQDatagridComponentDemo
//
//  Created by zhiqing on 2019/3/6.
//  Copyright © 2019 zhiqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) CustomViewModel *cellModel;
@end

NS_ASSUME_NONNULL_END
