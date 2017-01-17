//
//  TLMyLiveMainVC.m
//  TL
//
//  Created by 阳光 on 16/12/15.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLMyLiveMainVC.h"

#import "TLMyDetailVC.h"
#import "LeftLabelNextView.h"
#import "TLMyInfoMainVC.h"
#import "TLMyInfoMainCell.h"
#import "TLBaseCell.h"

#import "TLMyFansDurationListVC.h"
#import "TLMyFansGiftListVC.h"
#import "TLMyFansListVC.h"
#import "TLMyCashWealthVC.h"
#import "TLMyConcernAnchorVC.h"
#import "TLMyAnchorDynamicVC.h"

static NSString *tableViewCellIdentifier=@"UITableViewCellIdentifier";
static NSString *TLMyInfoMainCellIdentifier=@"TLMyInfoMainCellIdentifier";
static NSString *TLBaseCellIdentifier=@"TLBaseCellIdentifier";

@interface TLMyLiveMainVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *myMainTableView;

@end

@implementation TLMyLiveMainVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title=@"我的主页";

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
    _myMainTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_myMainTableView];
    [_myMainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellIdentifier];
    [_myMainTableView registerClass:[TLMyInfoMainCell class] forCellReuseIdentifier:TLMyInfoMainCellIdentifier];
    [_myMainTableView registerClass:[TLBaseCell class] forCellReuseIdentifier:TLBaseCellIdentifier];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 9;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        TLMyInfoMainCell *cell=[tableView dequeueReusableCellWithIdentifier:TLMyInfoMainCellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else if (indexPath.section==3)
    {
        TLBaseCell *cell=[tableView dequeueReusableCellWithIdentifier:TLBaseCellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.leftTitleLabel.text=@"我的等级";
        cell.rightTitleLabel.text=@"8";
        return cell;
    }
    else if (indexPath.section==4)
    {
        TLBaseCell *cell=[tableView dequeueReusableCellWithIdentifier:TLBaseCellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.leftTitleLabel.text=@"我的钱包";
        cell.rightTitleLabel.text=@"10喵币";
        return cell;
    }
    else
    {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

        if (indexPath.section==1)
        {
            cell.textLabel.text=@"我的mm粉丝";
        }
        else if (indexPath.section==2)
        {
            cell.textLabel.text=@"我关注的主播";
        }
        else if (indexPath.section==5)
        {
            cell.textLabel.text=@"粉丝送礼榜";
        }
        else if (indexPath.section==6)
        {
            cell.textLabel.text=@"粉丝时长榜";
        }
        else if (indexPath.section==7)
        {
            cell.textLabel.text=@"我的直播动态";
        }
        else if (indexPath.section==8)
        {
            cell.textLabel.text=@"M币提现";
        }
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return kmargin*7;
    }
    else
    {
        return kmargin*5;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    // 获取_myMainTableView 当前选中的cell
    UITableViewCell *cell=[_myMainTableView cellForRowAtIndexPath:indexPath];

    if (indexPath.section==0)
    {
        // 跳转到我的信息修改界面
        TLMyInfoMainVC *myInfoMainVC=[TLMyInfoMainVC new];
        myInfoMainVC.title=cell.textLabel.text;
        myInfoMainVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:myInfoMainVC animated:NO];
    }
    else if (indexPath.section==1)
    {
        // 跳转到我的mm粉丝界面
        TLMyFansListVC *myFansListVC=[TLMyFansListVC new];
        myFansListVC.title=cell.textLabel.text;
        myFansListVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:myFansListVC animated:NO];
    }
    else if (indexPath.section==2)
    {
        // 跳转到我关注的主播界面
        TLMyConcernAnchorVC *myConcernAnchorVC=[TLMyConcernAnchorVC new];
        myConcernAnchorVC.title=cell.textLabel.text;
        myConcernAnchorVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:myConcernAnchorVC animated:NO];
    }
    else if (indexPath.section==5)
    {
        // 跳转到我的粉丝送礼榜界面
        TLMyFansGiftListVC *myFansGiftListVC=[TLMyFansGiftListVC new];
        myFansGiftListVC.title=cell.textLabel.text;
        myFansGiftListVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:myFansGiftListVC animated:NO];
    }
    else if (indexPath.section==6)
    {
        // 跳转到我的粉丝时长榜界面
        TLMyFansDurationListVC *myFansDurationListVC=[TLMyFansDurationListVC new];
        myFansDurationListVC.title=cell.textLabel.text;
        myFansDurationListVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:myFansDurationListVC animated:NO];
    }
    else if (indexPath.section==7)
    {
        // 跳转到我的直播动态界面
        TLMyAnchorDynamicVC *myAnchorDynamicVC=[TLMyAnchorDynamicVC new];
        myAnchorDynamicVC.title=cell.textLabel.text;
        myAnchorDynamicVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:myAnchorDynamicVC animated:NO];
    }
    else if (indexPath.section==8)
    {
        // 跳转到财富提现界面
        TLMyCashWealthVC *myCashWealthVC=[TLMyCashWealthVC new];
        myCashWealthVC.title=cell.textLabel.text;
        myCashWealthVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:myCashWealthVC animated:NO];
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        UIView *headView=[UIView new];
        return headView;
    }
    else
    {
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return kmargin;
    }
    else
    {
        return 0.000;
    }
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

@end
