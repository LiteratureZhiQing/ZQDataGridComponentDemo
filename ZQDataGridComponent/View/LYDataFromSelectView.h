//
//  LYDataFromSelectView.h
//  XPMS
//
//  Created by lynb180305 on 2019/2/21.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYDataFromSelectView : UIView
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *selectImg;
@property (nonatomic,assign) BOOL isSelect;
@property (nonatomic,strong) NSString *titleStr;
@end

