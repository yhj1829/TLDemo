//
//  TLLiveBaseCollectionViewCell.m
//  TL
//
//  Created by 阳光 on 16/11/22.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLLiveBaseCollectionViewCell.h"

@interface TLLiveBaseCollectionViewCell ()

@property(nonatomic,strong)UILabel *titleLabel;

// 直播头像
@property(nonatomic,strong)UIImageView *liverURL;

// 主播昵称
@property(nonatomic,strong)UILabel *nameLabel;

// 观看人数
@property(nonatomic,strong)UILabel *numberLabel;

@end


@implementation TLLiveBaseCollectionViewCell

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.titleLabel.font=Font_Number(13);
        
        self.nameLabel.font=Font_Number(13);
        
        self.numberLabel.font=Font_Number(13);
        
        self.liverURL.hidden=NO;
        
        _liverURL.image=[UIImage imageNamed:@"2"];
        
        self.backgroundColor=WhiteColor;
    }
    return self;
}

// titleLabel
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel=[self getLabelWithText:@"阳光直播中" font:Font_Number(13) textColor:Color333333 textAlignment:NSTextAlignmentCenter lineBreakMode:NSLineBreakByTruncatingTail numberOfLines:1];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kmargin/2);
            make.left.mas_equalTo(APPW/8);
            make.height.mas_equalTo(kmargin*2);
        }];
    }
    return _titleLabel;
}

// liverURL
-(UIImageView *)liverURL
{
    if (!_liverURL) {
        _liverURL=[[UIImageView alloc]init];
        [self.contentView addSubview:_liverURL];
        
        // 圆角和边框
        ViewBorderRadius(_liverURL,kmargin,kmargin/kmargin,ClearColor);
        
        [_liverURL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-kmargin/2);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(kmargin/2);
            make.left.mas_equalTo(kmargin/2);
            make.bottom.mas_equalTo(-kmargin/2);
        }];
    }
    return _liverURL;
}

// nameLabel
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel=[self getLabelWithText:@"阳光" font:Font_Number(13) textColor:Color333333 textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByTruncatingTail numberOfLines:1];
        [self.liverURL addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(kmargin/2);
            make.height.mas_equalTo(kmargin*2);
        }];
    }
    return _nameLabel;
}

// numberLabel
- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel=[self getLabelWithText:@"31万正看" font:Font_Number(13) textColor:Color333333 textAlignment:NSTextAlignmentRight lineBreakMode:NSLineBreakByTruncatingTail numberOfLines:1];
        [self.liverURL addSubview:_numberLabel];
        [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kmargin/2);
            make.right.mas_equalTo(-kmargin/2);
        }];
    }
    return _numberLabel;
}

@end
