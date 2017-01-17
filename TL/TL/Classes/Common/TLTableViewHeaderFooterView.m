//
//  TLTableViewHeaderFooterView.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLTableViewHeaderFooterView.h"

@interface TLTableViewHeaderFooterView()

// 箭头
@property(strong,nonatomic)UIButton *arrowButton;

//@property(nonatomic,strong)UILabel *numberLabel;

@end

@implementation TLTableViewHeaderFooterView

+ (instancetype)headerView:(UITableView *)tableView
{
    static NSString *identifier=@"header";
    TLTableViewHeaderFooterView *headerView=(TLTableViewHeaderFooterView *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!headerView){
        headerView=[[TLTableViewHeaderFooterView alloc] initWithReuseIdentifier:identifier];
    }
    
    return headerView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        // 添加一条底线
        UIView *linesView=[[UIView alloc]initWithFrame:CGRectMake(0,45-1,APPW,1)];
        linesView.backgroundColor=MAIN_BACK_COLOR;
        [self addSubview:linesView];
        
        self.numberLabel.font=Font_Number(12);
      
    }
    return self;
}

#pragma mark - 懒加载
- (UIButton *)arrowButton
{
    if(!_arrowButton)
    {
        _arrowButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.arrowButton];
        [_arrowButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-kmargin);
            make.width.mas_equalTo(APPW);
        }];
        
        //buddy_header_arrow
        [_arrowButton setImage:[UIImage imageNamed:@"headArrow"] forState:0];
        [_arrowButton setTitleColor:[UIColor blackColor] forState:0];
        /** 设置Button按钮内容的内边距*/
        [_arrowButton setContentEdgeInsets:UIEdgeInsetsMake(0,10,0,0)];
        /** 设置Button内容的位置居左*/
        [_arrowButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_arrowButton setTitleEdgeInsets:UIEdgeInsetsMake(0,20,0,0)];
        /** 设置button图片的位置*/
        [_arrowButton setImageEdgeInsets:UIEdgeInsetsMake(0,kmargin,0,0)];
        [_arrowButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        _arrowButton.imageView.clipsToBounds = NO;
        _arrowButton.titleLabel.font=Font_Number(14);
        [_arrowButton setTitle:@"TLTableViewHeaderFooterView" forState:0];
    }
    return _arrowButton;
}

// numberLabel
- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel=[self getLabelWithText:@"2/6" font:Font_Number(12) textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:1];
        [self.contentView addSubview:_numberLabel];
        [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-kmargin);
            make.centerY.mas_equalTo(self.arrowButton.mas_centerY);
        }];
        
    }
    return _numberLabel;
}


#pragma mark - buttonAction
- (void)buttonAction
{
    self.sectionGroupModel.isOpen=!self.sectionGroupModel.isOpen;
    
    /** 如果代理响应了代理方法，就要调用这个方法*/
    if ([self.delegate respondsToSelector:@selector(didSelectTableViewHeaderFooterView)]) {
        [self.delegate didSelectTableViewHeaderFooterView];
    }
    
}

- (void)didMoveToSuperview
{
    /** 根据isOpen属性判断是否旋转？如果为YES，则旋转90°，否则不旋转*/
    self.arrowButton.imageView.transform = self.sectionGroupModel.isOpen ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(0);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    /** 注意这里要设置为bounds 不然会出错*/
    //        self.arrowButton.frame = self.bounds;
    
}

#pragma mark - groupModel
-(void)setSectionGroupModel:(TLSectionGroupModel *)sectionGroupModel
{
    _sectionGroupModel=sectionGroupModel;
    [self.arrowButton setTitle:sectionGroupModel.name forState:0];
}

@end
