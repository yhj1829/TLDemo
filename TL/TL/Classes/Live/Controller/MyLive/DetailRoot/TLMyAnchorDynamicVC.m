//
//  TLMyAnchorDynamicVC.m
//  TL
//
//  Created by 阳光 on 16/12/15.
//  Copyright © 2016年 阳光. All rights reserved.
//  我的直播动态界面

#import "TLMyAnchorDynamicVC.h"

#import "TLMyFansListCell.h"
#import "TLMyFansDetailInfoVC.h"

#import "TLMyAnchorDynamicCell.h"

static NSString *TLMyAnchorDynamicCellIdentifier=@"TLMyAnchorDynamicCellIdentifier";
@interface TLMyAnchorDynamicVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *myMainTableView;

@end

@implementation TLMyAnchorDynamicVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=MAIN_BACK_COLOR;

    [self initTableView];

}


-(void)initTableView
{
    // _myMainTableView
    _myMainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0,APPW,APPH) style:UITableViewStylePlain];
    _myMainTableView.delegate=self;
    _myMainTableView.dataSource=self;
    _myMainTableView.hidden=NO;
    _myMainTableView.backgroundColor=MAIN_BACK_COLOR;
    _myMainTableView.showsVerticalScrollIndicator=NO;
    _myMainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myMainTableView];
    [_myMainTableView registerClass:[TLMyAnchorDynamicCell class] forCellReuseIdentifier:TLMyAnchorDynamicCellIdentifier];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMyAnchorDynamicCell *cell=[tableView dequeueReusableCellWithIdentifier:TLMyAnchorDynamicCellIdentifier];
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
    return kmargin*10.5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

}

@end
