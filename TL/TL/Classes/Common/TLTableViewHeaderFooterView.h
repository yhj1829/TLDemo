//
//  TLTableViewHeaderFooterView.h
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLSectionGroupModel.h"

@protocol TLTableViewHeaderFooterViewDelegate <NSObject>

// 点击头视图事件
-(void)didSelectTableViewHeaderFooterView;

@end

@interface TLTableViewHeaderFooterView : UITableViewHeaderFooterView

@property(nonatomic,assign)id<TLTableViewHeaderFooterViewDelegate>delegate;

@property(nonatomic,strong)TLSectionGroupModel *sectionGroupModel;

/** 初始化方法*/
+(instancetype)headerView:(UITableView *)tableView;

@property(nonatomic,strong)UILabel *numberLabel;

//@property(nonatomic,strong)UIButton *arrowBtn;

@end