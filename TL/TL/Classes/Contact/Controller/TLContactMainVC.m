//
//  TLContactMainVC.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLContactMainVC.h"
#import "TLContactMainCell.h"
#import "TLTableViewHeaderFooterView.h"
#import "TLSectionGroupModel.h"
#import "TLContactGroupMainVC.h"
//#import "TLContactTalkMainVC.h"
#import "TLAddNewContactMainVC.h"


static NSString *TLContactMainCellIdentifier=@"TLContactMainCellIdentifier";

@interface TLContactMainVC ()<UITableViewDataSource,UITableViewDelegate,TLTableViewHeaderFooterViewDelegate>

@property(nonatomic,strong)UITableView *contactMainTableView;

@property(nonatomic,strong)NSMutableArray *contactMainArr;

@end

@implementation TLContactMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=MAIN_BACK_COLOR;
    
    [self initData];
    
    [self initTableView];

}


-(void)initData
{
    _contactMainArr=[NSMutableArray array];
    
   NSArray *array=@[@"我的好友",@"朋友",@"家人",@"同学",@"亲戚",@"公司"];
    
    for (NSInteger i=0;i<array.count;i++)
    {
        TLSectionGroupModel *sectionGroupModel=[TLSectionGroupModel new];
        sectionGroupModel.name=array[i];
        [self.contactMainArr addObject:sectionGroupModel];
    }
}



-(void)initTableView
{
    // _contactMainTableView
    _contactMainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,.5,APPW,APPH-49) style:UITableViewStylePlain];
    _contactMainTableView.delegate=self;
    _contactMainTableView.dataSource=self;
    _contactMainTableView.hidden=NO;
    _contactMainTableView.backgroundColor=MAIN_BACK_COLOR;
    _contactMainTableView.showsVerticalScrollIndicator=NO;
    _contactMainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_contactMainTableView];
    _contactMainTableView.tableFooterView=[UIView new];
    [_contactMainTableView registerClass:[TLContactMainCell class] forCellReuseIdentifier:TLContactMainCellIdentifier];
}

-(void)didSelectTableViewHeaderFooterView
{
    [_contactMainTableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.contactMainArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TLSectionGroupModel *sectionGroupModel=self.contactMainArr[section];
    return sectionGroupModel.isOpen?3:0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLContactMainCell *cell=[tableView dequeueReusableCellWithIdentifier:TLContactMainCellIdentifier];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType=UITableViewCellAccessoryNone;
    return cell;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TLTableViewHeaderFooterView *tableViewHeaderFooterView=[TLTableViewHeaderFooterView headerView:tableView];
    tableViewHeaderFooterView.delegate=self;
    tableViewHeaderFooterView.sectionGroupModel=self.contactMainArr[section];
    tableViewHeaderFooterView.contentView.backgroundColor=WhiteColor;
    return tableViewHeaderFooterView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kmargin*5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    // 获取_contactMainTableView 当前选中的cell
    //    UITableViewCell *cell=[_contactMainTableView cellForRowAtIndexPath:indexPath];
    
}

@end
