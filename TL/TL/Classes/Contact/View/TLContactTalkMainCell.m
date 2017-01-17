//
//  TLContactTalkMainCell.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLContactTalkMainCell.h"

@interface TLContactTalkMainCell ()

// 头像
@property(nonatomic,strong)UIImageView *imgURL;

// 昵称
@property(nonatomic,strong)UILabel *nameLabel;

// 时间
@property(nonatomic,strong)UILabel *timeLabel;

@property(nonatomic,strong)UIView *lineView;

@end

@implementation TLContactTalkMainCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // ➡️Cell类型
        self.accessoryType=UITableViewCellAccessoryNone;
        
        self.imgURL.hidden=NO;
        
        _imgURL.image=[UIImage imageNamed:@"ready"];
        
        self.nameLabel.font=Font_Number(14);
        
        self.timeLabel.font=Font_Number(12);
        
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
            make.left.mas_equalTo(kmargin);
            make.top.mas_equalTo(kmargin/2);
            make.size.mas_equalTo(CGSizeMake(kmargin*4,kmargin*4));
        }];
    }
    return _imgURL;
}

// nameLabel
- (UILabel *)nameLabel
{
    
    if (!_nameLabel) {
        _nameLabel=[self getLabelWithText:@"天马讨论组(20)" font:Font_Number(14) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgURL.mas_right).offset(kmargin);
            make.top.mas_equalTo(self.imgURL.mas_top);
        }];
    }
    return _nameLabel;
}


// timeLabel
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel=[self getLabelWithText:@"11月20日 15:40" font:Font_Number(12) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgURL.mas_right).offset(kmargin);
            make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(kmargin/5);
        }];
        
    }
    return _timeLabel;
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
