//
//  TLMyCashWealthFirstCell.m
//  TL
//
//  Created by 阳光 on 16/12/6.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLMyCashWealthFirstCell.h"

@interface TLMyCashWealthFirstCell ()

// 当前财富
@property(nonatomic,strong)UILabel *currentCashLabel;

// 提现
@property(nonatomic,strong)UILabel *cashWealthLabel;

@end

@implementation TLMyCashWealthFirstCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // ➡️Cell类型
        self.accessoryType=UITableViewCellAccessoryNone;
        
        self.currentCashLabel.font=Font_Number(14);
        
        self.cashWealthLabel.font=Font_Number(14);
        
        self.backgroundColor=WhiteColor;
        
    }
    return self;
}

// currentCashLabel
- (UILabel *)currentCashLabel
{
    
    if (!_currentCashLabel) {
        _currentCashLabel=[self getLabelWithText:@"当前财富:1000M币" font:Font_Number(14) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_currentCashLabel];
        [_currentCashLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(kmargin);
            make.size.mas_equalTo(CGSizeMake(APPW-kmargin*2,kmargin*2));
        }];
    }
    return _currentCashLabel;
}


// cashWealthLabel
- (UILabel *)cashWealthLabel
{
    if (!_cashWealthLabel) {
        _cashWealthLabel=[self getLabelWithText:@"提现:100M币" font:Font_Number(14) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_cashWealthLabel];
        [_cashWealthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kmargin);
            make.top.mas_equalTo(self.currentCashLabel.mas_bottom).offset(kmargin);
        }];
        
    }
    return _cashWealthLabel;
}

@end
