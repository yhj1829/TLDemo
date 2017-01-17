//
//  TLMyAnchorDynamicCell.m
//  TL
//
//  Created by 阳光 on 16/12/22.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLMyAnchorDynamicCell.h"

@interface TLMyAnchorDynamicCell ()

// 直播标题
@property(nonatomic,strong)UILabel *titleLabel;

// 直播时时长
@property(nonatomic,strong)UILabel *durationLabel;

// 在线人数
@property(nonatomic,strong)UILabel *numberLabel;

// 时间
@property(nonatomic,strong)UILabel *timeLabel;

// 收到的礼物数量
@property(nonatomic,strong)UILabel *giftNumberLabel;

// 回放
@property(nonatomic,strong)UIButton *playBackBtn;

// 删除
@property(nonatomic,strong)UIButton *deleteBtn;

@property(nonatomic,strong)UIView *lineView;

@end

@implementation TLMyAnchorDynamicCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // ➡️Cell类型
        self.accessoryType=UITableViewCellAccessoryNone;

        self.titleLabel.font=Font_Number(14);

        self.durationLabel.font=Font_Number(12);

        self.numberLabel.font=Font_Number(12);

        self.timeLabel.font=Font_Number(12);

        self.giftNumberLabel.font=Font_Number(12);

        self.playBackBtn.hidden=NO;

        self.deleteBtn.hidden=NO;

        self.lineView.hidden=NO;

        self.backgroundColor=WhiteColor;

    }
    return self;
}

// titleLabel
- (UILabel *)titleLabel
{

    if (!_titleLabel) {
        _titleLabel=[self getLabelWithText:@"直播标题: 科幻德ugfhsiojc" font:Font_Number(14) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(kmargin);
        }];
    }
    return _titleLabel;
}

// timeLabel
- (UILabel *)timeLabel
{

    if (!_timeLabel) {
        _timeLabel=[self getLabelWithText:@"3 天前" font:Font_Number(12) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentRight lineBreakMode:NSLineBreakByTruncatingTail numberOfLines:1];
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-kmargin);
            make.centerY.mas_equalTo(self.titleLabel.mas_centerY);
        }];
    }
    return _timeLabel;
}

// durationLabel
- (UILabel *)durationLabel
{
    if (!_durationLabel) {
        _durationLabel=[self getLabelWithText:@"直播时长: 45分钟" font:Font_Number(12) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_durationLabel];
        [_durationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kmargin);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(kmargin);
        }];

    }
    return _durationLabel;
}

// giftNumberLabel
- (UILabel *)giftNumberLabel
{

    if (!_giftNumberLabel) {
        _giftNumberLabel=[self getLabelWithText:@"收到的礼物: 12000币" font:Font_Number(12) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentRight lineBreakMode:NSLineBreakByTruncatingTail numberOfLines:1];
        [self.contentView addSubview:_giftNumberLabel];
        [_giftNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-kmargin);
            make.centerY.mas_equalTo(self.durationLabel.mas_centerY);
        }];
    }
    return _giftNumberLabel;
}

// numberLabel
- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel=[self getLabelWithText:@"在线人数: 4.3万人" font:Font_Number(12) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_numberLabel];
        [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kmargin);
            make.top.mas_equalTo(self.durationLabel.mas_bottom).offset(kmargin);
        }];

    }
    return _numberLabel;
}

// deleteBtn
-(UIButton *)deleteBtn
{
    if (!_deleteBtn) {
        _deleteBtn=[UIButton new];
        [_deleteBtn setTitle:@"删除" forState:0];
        _deleteBtn.titleLabel.font=Font_Number(13);
        [_deleteBtn setTitleColor:WhiteColor forState:0];
        ViewBorderRadius(_deleteBtn,kmargin/2,1,ClearColor);
        [self.contentView addSubview:_deleteBtn];
        _deleteBtn.backgroundColor=ColorFF5D71;
        [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.numberLabel.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(70,25));
            make.right.mas_equalTo(-kmargin/2);
        }];
        [_deleteBtn addTarget:self action:@selector(deleteBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteBtn;
}

// playBackBtn
-(UIButton *)playBackBtn
{
    if (!_playBackBtn) {
        _playBackBtn=[UIButton new];
        [_playBackBtn setTitle:@"回放" forState:0];
        [_playBackBtn setTitleColor:WhiteColor forState:0];
        _playBackBtn.titleLabel.font=Font_Number(13);
        ViewBorderRadius(_playBackBtn,kmargin/2,1,ClearColor);
        [self.contentView addSubview:_playBackBtn];
        _playBackBtn.backgroundColor=Main_Color;
        [_playBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.numberLabel.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(70,25));
            make.right.mas_equalTo(-70-kmargin);
        }];
        [_playBackBtn addTarget:self action:@selector(playBackBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBackBtn;
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

-(void)deleteBtnEvent:(UIButton *)sender
{


}


-(void)playBackBtnEvent:(UIButton *)sender
{


}

@end
