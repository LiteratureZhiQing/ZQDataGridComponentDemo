//
//  LYDataFromSelectView.m
//  XPMS
//
//  Created by lynb180305 on 2019/2/21.
//  Copyright © 2019 zhenhua.shen. All rights reserved.
//

#import "LYDataFromSelectView.h"


@implementation LYDataFromSelectView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.contentView];
    }
    return self;
}
-(void)setIsSelect:(BOOL)isSelect{
    _isSelect = isSelect;
    if (isSelect) {
        self.contentView.layer.borderWidth = 2;
        self.contentView.layer.borderColor = [UIColor colorWithHexString:@"#4f8dfa"].CGColor;
        self.selectImg.hidden = NO;
        self.contentView.backgroundColor = [UIColor whiteColor];
    }else{
        self.contentView.layer.borderColor = [UIColor clearColor].CGColor;
        self.selectImg.hidden = YES;
        self.contentView.backgroundColor = [UIColor clearColor];
    }
}
-(void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = CGRectMake(5, 4, self.width-10, self.height-8);
    self.titleLabel.frame =CGRectMake(5, 4, self.contentView.width-10, self.contentView.height-8);
    self.selectImg.right = self.contentView.width;
    self.selectImg.bottom = self.contentView.height;
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        [_contentView addSubview:self.titleLabel];
        [_contentView addSubview:self.selectImg];
        _contentView.layer.cornerRadius = 5;
    }
    return _contentView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,0, 0)];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#555555"];
        _titleLabel.font = [UIFont fontWithName:pingfangRegular size:15];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UIImageView *)selectImg{
    if (!_selectImg) {
        _selectImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _selectImg.image = [UIImage imageNamed:@"realtimeSelected"];
        _selectImg.hidden = YES;
    }
    return _selectImg;
}

@end
