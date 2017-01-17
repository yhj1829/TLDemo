//
//  TLMyFansDetailVC.m
//  TL
//
//  Created by 阳光 on 16/12/15.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLMyFansDetailVC.h"

#import "TLMyFansListCell.h"
#import "TLMyFansDetailInfoVC.h"

static NSString *TLMyFansListCellIdentifier=@"TLMyFansListCellIdentifier";
@interface TLMyFansDetailVC ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)UITableView *myMainTableView;

@property(nonatomic,strong)UIView *lineView;

@property(nonatomic,assign)NSInteger currentIndex;

@property(nonatomic,strong)UIScrollView *rootScrollView;

@end

@implementation TLMyFansDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title=@"粉丝资料";

    self.view.backgroundColor=MAIN_BACK_COLOR;

    [self initTopView];

    [self initTableView];

//    [self initScrollView];

}

-(void)initScrollView
{
    _rootScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,64,APPW,APPH-64)];
    _rootScrollView.backgroundColor=ClearColor;
    _rootScrollView.showsHorizontalScrollIndicator=NO;
    _rootScrollView.showsVerticalScrollIndicator=NO;
    _rootScrollView.pagingEnabled=YES;
    _rootScrollView.delegate=self;
    _rootScrollView.contentSize=CGSizeMake(APPW*3,APPH-64);
    [self.view addSubview:_rootScrollView];

    [self initTableView];
}

-(void)initTopView
{
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0,200,APPW,40)];
    headView.backgroundColor=MAIN_BACK_COLOR;
    [self.view addSubview:headView];

    NSArray *array=@[@"她的动态",@"她的关注",@"个人资料"];
    for (int i=0;i<3;i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(APPW/3*i,5,APPW/3,30);
        [button setTitle:array[i] forState:0];
        [button setTitleColor:Color666666 forState:0];
        [button setTitleColor:Main_Color forState:UIControlStateSelected];
        button.titleLabel.font =Font_Number(12);
        [button addTarget:self action:@selector(categoryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=10+i;
        if (i==0)
        {
            button.selected=YES;
        }
        [headView addSubview:button];

        if (i!=0)
        {
            UILabel *midLabel=[[UILabel alloc]initWithFrame:CGRectMake(APPW/3*i-0.5,10,1,20)];
            midLabel.backgroundColor=Color666666;
            [headView addSubview:midLabel];
        }
    }

    _lineView=[[UIView alloc]initWithFrame:CGRectMake(20,34.5,APPW/3-40,1)];
    _lineView.backgroundColor=Main_Color;
    [headView addSubview:_lineView];
}  

-(void)initTableView
{
    // _myMainTableView
    _myMainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,240,APPW,APPH-49) style:UITableViewStylePlain];
    _myMainTableView.delegate=self;
    _myMainTableView.dataSource=self;
    _myMainTableView.hidden=NO;
    _myMainTableView.backgroundColor=MAIN_BACK_COLOR;
    _myMainTableView.showsVerticalScrollIndicator=NO;
    _myMainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myMainTableView];
    [_myMainTableView registerClass:[TLMyFansListCell class] forCellReuseIdentifier:TLMyFansListCellIdentifier];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMyFansListCell *cell=[tableView dequeueReusableCellWithIdentifier:TLMyFansListCellIdentifier];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType=UITableViewCellAccessoryNone;
    return cell;
}

-(void)categoryBtnClick:(UIButton *)sender
{
    NSInteger tag=sender.tag;
    _currentIndex=tag-10;

    _rootScrollView.contentOffset=CGPointMake(APPW*_currentIndex,0);

    for (int i=10;i<13;i++)
    {
        UIButton *button=(UIButton *)[self.view viewWithTag:i];
        if (i==tag)
        {
            button.selected=YES;
        }
        else
        {
            button.selected=NO;
        }
    }

    if (sender.tag == 10)
    {
        _lineView.frame=CGRectMake(20,34.5,APPW/3-40,1);

//        [self getTalkListData];
    }
    else if (sender.tag == 11)
    {
        _lineView.frame=CGRectMake(APPW/3+20,34.5,APPW/3-40,1);

//        [self getPublicLictData];
    }
    else
    {
        _lineView.frame=CGRectMake(APPW/3*2+20,34.5,APPW/3-40,1);
//        [self getMotherListData];
    }
}


//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headView=[UIView new];
//
//    NSArray *array=@[@"她的动态",@"她的关注",@"个人资料"];
//    for (int i=0;i<3;i++) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame=CGRectMake(APPW/3*i,5,APPW/3,30);
//        [button setTitle:array[i] forState:0];
//        [button setTitleColor:Color666666 forState:0];
//        [button setTitleColor:Main_Color forState:UIControlStateSelected];
//        button.titleLabel.font =Font_Number(12);
//        [button addTarget:self action:@selector(categoryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        button.tag=10+i;
//        if (i==0)
//        {
//            button.selected=YES;
//        }
//        [headView addSubview:button];
//
//        if (i!=0)
//        {
//            UILabel *midLabel=[[UILabel alloc]initWithFrame:CGRectMake(APPW/3*i-0.5,10,1,20)];
//            midLabel.backgroundColor=Color666666;
//            [headView addSubview:midLabel];
//        }
//    }
//
//    _lineView=[[UIView alloc]initWithFrame:CGRectMake(20,34.5,APPW/3-40,1)];
//    _lineView.backgroundColor=Main_Color;
//    [headView addSubview:_lineView];
//    return headView;
//}

//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return kmargin*4;
//}

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

    //    [self.navigationController pushViewController:[TLMyFansDetailInfoVC new] animated:NO];

    // 获取_myMainTableView 当前选中的cell
    //    UITableViewCell *cell=[_myMainTableView cellForRowAtIndexPath:indexPath];
    
}

@end
