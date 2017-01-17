//
//  TLMyFansGiftListCell.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLMyFansGiftListCell.h"

@interface TLMyFansGiftListCell ()

// 头像
@property(nonatomic,strong)UIImageView *imgURL;

// 名称
@property(nonatomic,strong)UILabel *nameLabel;

// 送礼额
@property(nonatomic,strong)UILabel *moneyLabel;

@property(nonatomic,strong)UIView *lineView;

@end

@implementation TLMyFansGiftListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // ➡️Cell类型
        self.accessoryType=UITableViewCellAccessoryNone;
        
        self.imgURL.hidden=NO;
        
        _imgURL.image=[UIImage imageNamed:@"ready"];
        
        self.nameLabel.font=Font_Number(14);
        
        self.moneyLabel.font=Font_Number(12);
        
        self.lineView.hidden=NO;
        
        self.backgroundColor=WhiteColor;
        
    }
    return self;
}

// imgURL
-(UIImageView *)imgURL
{
    if (!_imgURL) {
        _imgURL=[[UIImageView alloc]init];
        [self.contentView addSubview:_imgURL];
        
        // 圆角和边框
        ViewBorderRadius(_imgURL,kmargin*2,kmargin/kmargin,ClearColor);
        
        [_imgURL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(kmargin);
            make.size.mas_equalTo(CGSizeMake(kmargin*4,kmargin*4));
        }];
    }
    return _imgURL;
}

// nameLabel
- (UILabel *)nameLabel
{
    
    if (!_nameLabel) {
        _nameLabel=[self getLabelWithText:@"昵称:科幻德" font:Font_Number(14) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgURL.mas_right).offset(kmargin);
            make.top.mas_equalTo(self.imgURL.mas_top);
        }];
    }
    return _nameLabel;
}


// moneyLabel
- (UILabel *)moneyLabel
{
    if (!_moneyLabel) {
        _moneyLabel=[self getLabelWithText:@"送礼额:5000M币" font:Font_Number(12) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_moneyLabel];
        [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgURL.mas_right).offset(kmargin);
            make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(kmargin/2);
        }];
        
    }
    return _moneyLabel;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView=[UIView new];
        [self.contentView addSubview:_lineView];
        _lineView.backgroundColor=MAIN_BACK_COLOR;
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(APPW,kmargin));
        }];
    }
    return _lineView;
}

@end
