//
//  LabelTextFieldView.m
//  TL
//
//  Created by 阳光 on 16/12/18.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "LabelTextFieldView.h"

@implementation LabelTextFieldView

-(instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder
{
    if (self=[super init]) {
        self.leftTitle=title;
        self.leftTitleLabel.textColor=Color333333;
        self.textField.placeholder=placeholder;
        self.textField.hidden=NO;
        self.textField.textColor=Color757575;
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

- (UILabel *)leftTitleLabel
{
    if (!_leftTitleLabel) {
        _leftTitleLabel=[UILabel new];
        [self addSubview:_leftTitleLabel];
        _leftTitleLabel.textAlignment=NSTextAlignmentRight;
        [_leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kmargin);
            make.width.mas_equalTo(70);
            make.top.mas_equalTo(kmargin/2);
            make.bottom.mas_equalTo(-kmargin/2);
        }];
        _leftTitleLabel.font = [UIFont systemFontOfSize:13];
        _leftTitleLabel.text = _leftTitle;
    }
    return _leftTitleLabel;
}


- (UITextField *)textField
{
    if (!_textField) {
        _textField=[UITextField new];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftTitleLabel.mas_right).offset(kmargin);
            make.width.mas_equalTo(APPW-CGRectGetMaxX(self.leftTitleLabel.frame)-kmargin*3);
            make.top.mas_equalTo(kmargin/2);
            make.bottom.mas_equalTo(-kmargin/2);
        }];
        _textField.font=Font_Number(13);
        _textField.placeholder=_placeholder;
    }
    return _textField;
}

@end
