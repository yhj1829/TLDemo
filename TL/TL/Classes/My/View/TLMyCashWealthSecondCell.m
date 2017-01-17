//
//  TLMyCashWealthSecondCell.m
//  TL
//
//  Created by 阳光 on 16/12/6.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLMyCashWealthSecondCell.h"

@interface TLMyCashWealthSecondCell ()

//// 是否选中
//@property(nonatomic,strong)UIImageView *isSelectImage;
//
//// 文字
//@property(nonatomic,strong)UILabel *nameLabel;

@property(nonatomic,strong)UIView *lineView;

@end

@implementation TLMyCashWealthSecondCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // ➡️Cell类型
        self.accessoryType=UITableViewCellAccessoryNone;
        
        self.isSelectImage.hidden=NO;
        
        _isSelectImage.image=[UIImage imageNamed:@"ready"];
        
        self.nameLabel.font=Font_Number(13);
        
        self.lineView.hidden=NO;
        
        self.backgroundColor=WhiteColor;
        
    }
    return self;
}

// isSelectImage
-(UIImageView *)isSelectImage
{
    if (!_isSelectImage) {
        _isSelectImage=[[UIImageView alloc]init];
        [self.contentView addSubview:_isSelectImage];
        [_isSelectImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kmargin);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(kmargin*3/2,kmargin*3/2));
        }];
    }
    return _isSelectImage;
}

// nameLabel
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel=[self getLabelWithText:@"提现到哪" font:Font_Number(13) textColor:Color333333 textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.isSelectImage.mas_centerY);
            make.left.mas_equalTo(self.isSelectImage.mas_right).offset(kmargin);
        }];
    }
    return _nameLabel;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView=[UIView new];
        _lineView.backgroundColor=MAIN_BACK_COLOR;
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(APPW,1));
            make.bottom.mas_equalTo(0);
        }];
    }
    return _lineView;
}

@end
