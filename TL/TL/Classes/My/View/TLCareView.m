//
//  TLCareView.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLCareView.h"

static NSString *UITableViewCellIdentifier=@"UITableViewCellIdentifier";

@implementation TLCareView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator=NO;
        self.tableView=tableView;
        _tableView.delegate=self;
        _tableView.frame=CGRectMake(0,0,APPW,frame.size.height-49);
        [self addSubview:_tableView];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellIdentifier];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:UITableViewCellIdentifier];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

@end
