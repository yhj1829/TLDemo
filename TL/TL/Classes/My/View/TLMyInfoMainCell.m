//
//  TLMyInfoMainCell.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLMyInfoMainCell.h"

@interface TLMyInfoMainCell ()

// 昵称
@property(nonatomic,strong)UILabel *nameLabel;

// 个性签名
@property(nonatomic,strong)UILabel *signLabel;

// 头像
@property(nonatomic,strong)UIImageView *imgURL;

@end

@implementation TLMyInfoMainCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // ➡️Cell类型
        self.accessoryType=UITableViewCellAccessoryNone;
        
        self.imgURL.hidden=NO;
        
        _imgURL.image=[UIImage imageNamed:@"ready"];
        
        self.nameLabel.font=Font_Number(16);
        
        self.signLabel.font=Font_Number(16);
        
        self.backgroundColor=WhiteColor;
        
    }
    return self;
}

// nameLabel
- (UILabel *)nameLabel
{
    
    if (!_nameLabel) {
        _nameLabel=[self getLabelWithText:@"昵称" font:Font_Number(16) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(kmargin);
            make.size.mas_equalTo(CGSizeMake(APPW/2,kmargin*2));
        }];
    }
    return _nameLabel;
}


// signLabel
- (UILabel *)signLabel
{
    if (!_signLabel) {
        _signLabel=[self getLabelWithText:@"个性签名" font:Font_Number(16) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_signLabel];
        [_signLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kmargin);
            make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(kmargin);
        }];
        
    }
    return _signLabel;
}

// imgURL
-(UIImageView *)imgURL
{
    if (!_imgURL) {
        _imgURL=[[UIImageView alloc]init];
        [self.contentView addSubview:_imgURL];
        
         // 圆角和边框
        ViewBorderRadius(_imgURL,kmargin*3,kmargin/kmargin,ClearColor);
        
        [_imgURL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-kmargin);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(kmargin*6,kmargin*6));
        }];
    }
    return _imgURL;
}

@end
