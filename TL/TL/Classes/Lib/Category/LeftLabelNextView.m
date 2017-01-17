//
//  LeftLabelNextView.m
//  TL
//
//  Created by 阳光 on 16/11/16.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "LeftLabelNextView.h"

@implementation LeftLabelNextView

-(instancetype)initWithTitle:(NSString *)title hasNext:(BOOL)next
{
    if (self=[super init]) {
        self.leftTitle=title;
        self.imageIcon.hidden=NO;
        self.leftTitleLabel.textColor=Color333333;
        if (next)
        {
            self.imageIcon.hidden=NO;
        }
        self.backgroundColor=WhiteColor;
    }
    return self;
}

// 预防
- (instancetype)init {
    if (self = [super init]) {
        NSAssert1(NO, @"%s  必须使用initWithTitle:方法初始化", __FUNCTION__);
    }
    return self;
}

-(UIImageView *)imageIcon
{
    if (_imageIcon==nil) {
        _imageIcon=[UIImageView new];
        _imageIcon.backgroundColor=Main_Color;
        _imageIcon.image=[UIImage imageNamed:@"cell_arrow"];
        [self addSubview:_imageIcon];
        [_imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kmargin);
            make.right.mas_equalTo(-kmargin);
            make.size.mas_equalTo(CGSizeMake(kmargin,kmargin));
        }];
    }
    return _imageIcon;
}

- (UILabel *)leftTitleLabel
{
    if (!_leftTitleLabel) {
        _leftTitleLabel=[UILabel new];
        [self addSubview:_leftTitleLabel];
        [_leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(kmargin/2);
            make.width.mas_equalTo(150);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        _leftTitleLabel.font=Font_Number(13);
        _leftTitleLabel.text=_leftTitle;
    }
    return _leftTitleLabel;
}

@end
