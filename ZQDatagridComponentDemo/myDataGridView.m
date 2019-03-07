//
//  columnAverageView.m
//  ZQDatagridComponentDemo
//
//  Created by zhiqing on 2019/3/6.
//  Copyright © 2019 zhiqing. All rights reserved.
//

#import "myDataGridView.h"

@interface myDataGridView ()
@property (nonatomic, strong) UIButton *leftTitleView;       // 左侧表头文本,用户可以自己定义需要放置什么视图。
@end

@implementation myDataGridView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(ZQDataGridComponentModel *)dataSource{
    if (self = [super initWithFrame:frame dataSource:dataSource]) {
        [self.leftHeadView addSubview:self.leftTitleView];
    }
    return self;
}


#pragma -mark event 左侧顶部表头点击事件
- (void)openTimeClick:(UIButton *)button{
    NSLog(@"点击了 左上角视图");

}


#pragma -mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [super scrollViewDidScroll:scrollView];
    //    if(scrollView==self.rightScrollView){
    //        CGFloat offsetX= self.rightScrollView.contentOffset.x;
    //        if (offsetX > 0) {
    //            self.leftVerticalLine.hidden = NO;
    //        }
    //    }else{
    //        CGFloat offsetY= scrollView.contentOffset.y;
    //        if (offsetY > 0) {
    //            self.leftVerticalLine.hidden = NO;
    //        }
    //    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    BOOL scrollToScrollStop = !scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
    if (scrollToScrollStop) {
        // 停止后要执行的代码
        //        self.verticalLine.hidden = YES;
        //        self.horizontalLine.hidden = YES;
        
        //        self.leftVerticalLine.hidden = YES;
        
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        BOOL dragToDragStop = scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
        if (dragToDragStop) {
            // 停止后要执行的代码
            //            self.verticalLine.hidden = YES;
            //            self.horizontalLine.hidden = YES;
            //            self.leftVerticalLine.hidden = YES;
            
        }
    }
}

#pragma -mark lazy load

- (UIButton *)leftTitleView{
    if (!_leftTitleView) {
        _leftTitleView = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.dataModel.firstColumnWidth -LYLineViewHeight, self.dataModel.firstRowHeight -LYLineViewHeight)];
        [_leftTitleView setTitle:@"左侧表头" forState:UIControlStateNormal];
        _leftTitleView.titleLabel.font = [UIFont systemFontOfSize:kWord_Font_12pt];
        [_leftTitleView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_leftTitleView addTarget:self action:@selector(openTimeClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftTitleView;
}

@end
