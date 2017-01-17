//
//  TLAddContactMainCell.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLAddContactMainCell.h"

@interface TLAddContactMainCell ()

// 好友申请
@property(nonatomic,strong)UILabel *tipLabel;

// 头像
@property(nonatomic,strong)UIImageView *imgURL;

// 昵称
@property(nonatomic,strong)UILabel *nameLabel;

// 认证信息
@property(nonatomic,strong)UILabel *confirmInfoLabel;

// 来源
@property(nonatomic,strong)UILabel *fromLabel;

// 状态
@property(nonatomic,strong)UILabel *stateLabel;

@property(nonatomic,strong)UIView *lineView;

@end

@implementation TLAddContactMainCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // ➡️Cell类型
        self.accessoryType=UITableViewCellAccessoryNone;
        
        self.imgURL.hidden=NO;
        
        _imgURL.image=[UIImage imageNamed:@"ready"];
        
        self.tipLabel.font=Font_Number(14);
        
        self.nameLabel.font=Font_Number(14);
        
        self.confirmInfoLabel.font=Font_Number(12);
        
        self.fromLabel.font=Font_Number(12);
        
        self.stateLabel.font=Font_Number(12);
        
        self.lineView.hidden=NO;
        
        self.backgroundColor=WhiteColor;
        
    }
    return self;
}

// tipLabel
- (UILabel *)tipLabel
{
    
    if (!_tipLabel) {
        _tipLabel=[self getLabelWithText:@"好友申请" font:Font_Number(14) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_tipLabel];
        [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(kmargin);
        }];
    }
    return _tipLabel;
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
            make.left.mas_equalTo(kmargin);
            make.top.mas_equalTo(self.tipLabel.mas_bottom).offset(kmargin/2);
            make.size.mas_equalTo(CGSizeMake(kmargin*6,kmargin*6));
        }];
    }
    return _imgURL;
}

// nameLabel
- (UILabel *)nameLabel
{
    
    if (!_nameLabel) {
        _nameLabel=[self getLabelWithText:@"阳光" font:Font_Number(14) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgURL.mas_right).offset(kmargin);
            make.top.mas_equalTo(self.imgURL.mas_top);
        }];
    }
    return _nameLabel;
}


// confirmInfoLabel
- (UILabel *)confirmInfoLabel
{
    if (!_confirmInfoLabel) {
        _confirmInfoLabel=[self getLabelWithText:@"请求加为好友" font:Font_Number(12) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_confirmInfoLabel];
        [_confirmInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgURL.mas_right).offset(kmargin);
            make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(kmargin/5);
        }];
        
    }
    return _confirmInfoLabel;
}

// fromLabel
- (UILabel *)fromLabel
{
    if (!_fromLabel) {
        _fromLabel=[self getLabelWithText:@"来源:qq查找" font:Font_Number(12) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_fromLabel];
        [_fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgURL.mas_right).offset(kmargin);
            make.top.mas_equalTo(self.confirmInfoLabel.mas_bottom).offset(kmargin/5);
        }];
        
    }
    return _fromLabel;
}

// stateLabel
- (UILabel *)stateLabel
{
    if (!_stateLabel) {
        _stateLabel=[self getLabelWithText:@"已同意" font:Font_Number(12) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_stateLabel];
        [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-kmargin);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
    }
    return _stateLabel;
}

-(UIView *)lineView
{
    if (!_lineView) {
        _lineView=[UIView new];
        [self.contentView addSubview:_lineView];
        _lineView.backgroundColor=MAIN_BACK_COLOR;
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(APPW,1));
        }];
    }
    return _lineView;
}



@end
