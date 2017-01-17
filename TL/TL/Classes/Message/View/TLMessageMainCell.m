//
//  TLMessageMainCell.m
//  TL
//
//  Created by 阳光 on 16/11/12.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLMessageMainCell.h"

@interface TLMessageMainCell ()

@property(nonatomic,strong)UIImageView *imgURL;

@property(nonatomic,strong)UILabel *nameLabel;

@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UILabel *placeLabel;

@property(nonatomic,strong)UILabel *timeLabel;

@property(nonatomic,strong)UIView *midLine;

@end

@implementation TLMessageMainCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // ➡️Cell类型
        self.accessoryType=UITableViewCellAccessoryNone;
        
        self.imgURL.hidden=NO;
        
        _imgURL.image=[UIImage imageNamed:@"ready"];
        
        self.nameLabel.font=Font_Number(16);
        
        self.titleLabel.font=Font_Number(12);
        
        self.placeLabel.font=Font_Number(12);
        
        self.timeLabel.font=Font_Number(12);
    
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
        ViewBorderRadius(_imgURL,kmargin*4,kmargin/kmargin,ClearColor);
        
        [_imgURL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kmargin);
            make.top.mas_equalTo(kmargin);
            make.size.mas_equalTo(CGSizeMake(kmargin*8,kmargin*8));
        }];
    }
    return _imgURL;
}

// nameLabel
- (UILabel *)nameLabel
{
    
    if (!_nameLabel) {
        _nameLabel=[self getLabelWithText:@"信息" font:Font_Number(16) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgURL.mas_right).offset(kmargin);
            make.top.mas_equalTo(self.imgURL.mas_top).offset(kmargin);
        }];
    }
    return _nameLabel;
}


// placeLabel
- (UILabel *)placeLabel
{
    if (!_placeLabel) {
        _placeLabel=[self getLabelWithText:@"信息动态" font:Font_Number(16) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_placeLabel];
        [_placeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgURL.mas_right).offset(kmargin);
          make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(kmargin);
        }];
        
    }
    return _placeLabel;
}

// timeLabel
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel=[self getLabelWithText:@"23:45" font:Font_Number(16) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameLabel.mas_right).offset(kmargin);
            make.centerY.mas_equalTo(self.nameLabel.mas_centerY);
            make.right.mas_equalTo(-kmargin);
        }];
    }
    return _timeLabel;
}

@end
