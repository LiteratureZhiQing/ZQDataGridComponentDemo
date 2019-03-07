//
//  DefineFile.h
//  ZQDatagridComponentDemo
//
//  Created by zhiqing on 2019/3/6.
//  Copyright © 2019 zhiqing. All rights reserved.
//

#ifndef DefineFile_h
#define DefineFile_h

typedef NS_ENUM(NSInteger, ZQDataGridComponentClickType) {
    ZQDataGridComponentClickTypeHead    = 1,   //头部点击
    ZQDataGridComponentClickTypeLeftTab   = 2,   //左侧tab点击
    ZQDataGridComponentClickTypeRightTab   = 3,   //右侧tab点击
};

#define SCREEN_WIDTH     ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT    ([UIScreen mainScreen].bounds.size.height)
#define IsiPhoneXLater  (SCREEN_WIDTH >= 375.f && SCREEN_HEIGHT >= 812.f)
#define kSafeAreaTopHeight      (IsiPhoneXLater ? 88 : 64)
#define SafeAreaBottomHeight                        (IsiPhoneXLater ? 34 : 0)

#define Weak(obj) __weak typeof(obj) weak##obj = obj;
#define LYLineViewHeight  1
#define  LYMainBigLabelHeight   21
#define  LYMainMidLabelHeight   17
#define  LYMainSmallLabelHeight 14
#define kWord_Font_12pt                 12.0f

#endif /* DefineFile_h */
