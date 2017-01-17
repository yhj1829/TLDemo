//
//  TLAddNewContactMainVC.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLAddNewContactMainVC.h"
#import "TLAddContactMainCell.h"

static NSString *TLAddContactMainCellIdentifier=@"TLAddContactMainCellIdentifier";
@interface TLAddNewContactMainVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *myMainTableView;

@end

@implementation TLAddNewContactMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=MAIN_BACK_COLOR;
    
    [self initData];
    
    [self initTableView];
}


-(void)initData
{
    self.title=@"新朋友";
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
    [_myMainTableView registerClass:[TLAddContactMainCell class] forCellReuseIdentifier:TLAddContactMainCellIdentifier];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLAddContactMainCell *cell=[tableView dequeueReusableCellWithIdentifier:TLAddContactMainCellIdentifier];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType=UITableViewCellAccessoryNone;
    return cell;
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
    return kmargin*10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    // 获取_myMainTableView 当前选中的cell
    //    UITableViewCell *cell=[_myMainTableView cellForRowAtIndexPath:indexPath];
    
}

@end
