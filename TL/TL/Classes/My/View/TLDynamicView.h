//
//  TLDynamicView.h
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLDynamicView : UIView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)UITableView *tableView;

-(instancetype)initWithFrame:(CGRect)frame;

@end