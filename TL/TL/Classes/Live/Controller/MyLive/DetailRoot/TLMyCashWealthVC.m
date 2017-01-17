//
//  TLMyCashWealthVC.m
//  TL
//
//  Created by 阳光 on 16/12/6.
//  Copyright © 2016年 阳光. All rights reserved.
//  财富提现界面

#import "TLMyCashWealthVC.h"
#import "TLMyCashWealthFirstCell.h"
#import "TLMyCashWealthSecondCell.h"

static NSString *TLMyCashWealthFirstCellIdentifier=@"TLMyCashWealthFirstCellIdentifier";
static NSString *TLMyCashWealthSecondCellIdentifier=@"TLMyCashWealthSecondCellIdentifier";
@interface TLMyCashWealthVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *myCashWealthTableView;

@end

@implementation TLMyCashWealthVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=MAIN_BACK_COLOR;
    
    [self initTableView];
    
}

-(void)initTableView
{
    // _myCashWealthTableView
    _myCashWealthTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,1,APPW,APPH-49) style:UITableViewStylePlain];
    _myCashWealthTableView.delegate=self;
    _myCashWealthTableView.dataSource=self;
    _myCashWealthTableView.hidden=NO;
    _myCashWealthTableView.backgroundColor=MAIN_BACK_COLOR;
    _myCashWealthTableView.showsVerticalScrollIndicator=NO;
    _myCashWealthTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myCashWealthTableView];
    [_myCashWealthTableView registerClass:[TLMyCashWealthFirstCell class] forCellReuseIdentifier:TLMyCashWealthFirstCellIdentifier];
    [_myCashWealthTableView registerClass:[TLMyCashWealthSecondCell class] forCellReuseIdentifier:TLMyCashWealthSecondCellIdentifier];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }
    else
    {
        return 3;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        TLMyCashWealthFirstCell *cell=[tableView dequeueReusableCellWithIdentifier:TLMyCashWealthFirstCellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryNone;
        return cell;
    }
    else
    {
        NSArray *arr=@[@"提现到支付宝",@"提现到微信",@"提现到银行卡"];
        TLMyCashWealthSecondCell *cell=[tableView dequeueReusableCellWithIdentifier:TLMyCashWealthSecondCellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryNone;
        cell.nameLabel.text=arr[indexPath.row];
        return cell;
    }
    
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
    if (section==1)
    {
        UIView *footView=[UIView new];
        // 确定
        UIButton *submitBtn=[UIButton new];
        [footView addSubview:submitBtn];
        ViewBorderRadius(submitBtn,kmargin/2,2,ClearColor);
        submitBtn.backgroundColor=Main_Color;
        submitBtn.titleLabel.font=Font_Number(14);
        [submitBtn setTitle:@"确定" forState:UIControlStateNormal];
        [submitBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
        [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(APPW-kmargin*4,40));
            make.left.top.mas_equalTo(kmargin*2);
        }];
        [submitBtn addTarget:self action:@selector(submitBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        return footView;
    }
    else
    {
        return nil;
    }
}


-(void)submitBtnEvent
{
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==1)
    {
        return kmargin*4;
    }
    else
    {
        return 0.0000;
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
        return kmargin*4;
    }
}


@end
