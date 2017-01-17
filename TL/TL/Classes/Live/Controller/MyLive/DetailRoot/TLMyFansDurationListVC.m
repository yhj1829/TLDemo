//
//  TLMyFansDurationListVC.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//  粉丝时长榜界面

#import "TLMyFansDurationListVC.h"
#import "TLMyFansDurationListCell.h"

static NSString *TLMyFansDurationListCellIdentifier=@"TLMyFansDurationListCellIdentifier";
@interface TLMyFansDurationListVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *myMainTableView;

@end

@implementation TLMyFansDurationListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=MAIN_BACK_COLOR;
    
    [self initTableView];
}

-(void)initTableView
{
    // _myMainTableView
    _myMainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0,APPW,APPH-49) style:UITableViewStylePlain];
    _myMainTableView.delegate=self;
    _myMainTableView.dataSource=self;
    _myMainTableView.hidden=NO;
    _myMainTableView.backgroundColor=MAIN_BACK_COLOR;
    _myMainTableView.showsVerticalScrollIndicator=NO;
    _myMainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myMainTableView];
    [_myMainTableView registerClass:[TLMyFansDurationListCell class] forCellReuseIdentifier:TLMyFansDurationListCellIdentifier];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMyFansDurationListCell *cell=[tableView dequeueReusableCellWithIdentifier:TLMyFansDurationListCellIdentifier];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType=UITableViewCellAccessoryNone;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[UIView new];
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kmargin;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView=[UIView new];
    return footView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kmargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kmargin*7;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    // 获取_myMainTableView 当前选中的cell
    //    UITableViewCell *cell=[_myMainTableView cellForRowAtIndexPath:indexPath];
    
}

@end
