//
//  ZQDataGridBaseCell.m
//  XPMS
//
//  Created by zhiqing on 2019/1/23.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//

#import "ZQDataGridBaseCell.h"

@implementation ZQDataGridBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect
{
    
    if (!self.isShowBottomLine) return;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //上分割线，
    //    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    //    CGContextStrokeRect(context, CGRectMake(5, -1, rect.size.width - 10, 1));
    //
    //下分割线
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:212/255.0 green:212/255.0 blue:212/255.0 alpha:1].CGColor);
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width, 1));
}

@end
