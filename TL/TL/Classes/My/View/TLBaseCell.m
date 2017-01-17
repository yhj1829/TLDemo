//
//  TLBaseCell.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLBaseCell.h"

//@interface TLBaseCell ()
//
//// 左边文字
//@property(nonatomic,strong)UILabel *leftTitleLabel;
//
//// 右边文字
//@property(nonatomic,strong)UILabel *rightTitleLabel;
//
//@end

@implementation TLBaseCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // ➡️Cell类型
        self.accessoryType=UITableViewCellAccessoryNone;
        
        self.leftTitleLabel.font=Font_Number(16);
        
        self.rightTitleLabel.font=Font_Number(16);
        
        self.backgroundColor=WhiteColor;
        
    }
    return self;
}

// leftTitleLabel
- (UILabel *)leftTitleLabel
{
    
    if (!_leftTitleLabel) {
        _leftTitleLabel=[self getLabelWithText:@"左边文字" font:Font_Number(16) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_leftTitleLabel];
        [_leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(kmargin);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
    return _leftTitleLabel;
}


// rightTitleLabel
- (UILabel *)rightTitleLabel
{
    if (!_rightTitleLabel) {
        _rightTitleLabel=[self getLabelWithText:@"右边文字" font:Font_Number(16) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentRight lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_rightTitleLabel];
        [_rightTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-kmargin*3/2);
            make.centerY.mas_equalTo(self.leftTitleLabel.mas_centerY);
        }];
        
    }
    return _rightTitleLabel;
}



@end
