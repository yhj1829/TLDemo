//
//  TLContactGroupMainVC.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLContactGroupMainVC.h"
#import "TLSectionGroupModel.h"
#import "TLBaseTableViewCell.h"
#import "TLTableViewHeaderFooterView.h"

#import "LGLSearchBar.h"

static NSString *TLBaseTableViewCellIdentifier=@"TLBaseTableViewCellIdentifier";

@interface TLContactGroupMainVC ()<UITableViewDataSource,UITableViewDelegate,TLTableViewHeaderFooterViewDelegate>

@property(nonatomic,strong)UITableView *contactGroupMainTableView;

@property(nonatomic,strong)NSArray *contactGroupMainHeadArr;

@property(nonatomic,strong)NSMutableArray *contactGroupMainArr;


@end

@implementation TLContactGroupMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=MAIN_BACK_COLOR;
    
    
    [self initData];
    
    [self initTableView];
//    //添加左右滑动手势pan
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
//    [self.view addGestureRecognizer:pan];
//
//    [self searchView];
}

//#pragma mark Pan手势
//- (void) handlePan:(UIPanGestureRecognizer*)recongizer{
//    NSLog(@"UIPanGestureRecognizer");
//
//    NSUInteger index = [self.tabBarController selectedIndex];
//
//    CGPoint point = [recongizer translationInView:self.view];
//    NSLog(@"%f,%f",point.x,point.y);
//
//    if (recongizer.view.center.x + point.x >  [UIScreen mainScreen].bounds.size.width/2) {
//        recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, recongizer.view.center.y);
//    } else {
//        recongizer.view.center = CGPointMake(recongizer.view.center.x + point.x, recongizer.view.center.y);
//    }
//    [recongizer setTranslation:CGPointMake(0, 0) inView:self.view];
//
//    if (recongizer.state == UIGestureRecognizerStateEnded) {
//        if (recongizer.view.center.x <= [UIScreen mainScreen].bounds.size.width && recongizer.view.center.x > 0 ) {
//            [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
//            }completion:^(BOOL finished) {
//
//            }];
//        } else if (recongizer.view.center.x <= 0 ){
//            [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                recongizer.view.center = CGPointMake(-[UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
//            }completion:^(BOOL finished) {
//                [self.tabBarController setSelectedIndex:index+1];
//                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
//            }];
//        } else {
//            
//        }
//    }
//}




-(void)initData
{
    self.title=@"群组";
    
    _contactGroupMainArr=[NSMutableArray array];
    
//    _contactGroupMainHeadArr=@[@"我创建的群(6)",@"我管理的群(2)",@"我加入的群(10)"];
    
    NSArray *array=@[@"我创建的群(6)",@"我管理的群(2)",@"我加入的群(10)"];
    
    for (NSInteger i=0;i<array.count;i++)
    {
        TLSectionGroupModel *sectionGroupModel=[TLSectionGroupModel new];
        sectionGroupModel.name=array[i];
        [self.contactGroupMainArr addObject:sectionGroupModel];
    }

}

-(void)initTableView
{
    // _contactGroupMainTableView
    _contactGroupMainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,.5,APPW,APPH-49) style:UITableViewStylePlain];
    _contactGroupMainTableView.delegate=self;
    _contactGroupMainTableView.dataSource=self;
    _contactGroupMainTableView.hidden=NO;
    _contactGroupMainTableView.backgroundColor=MAIN_BACK_COLOR;
    _contactGroupMainTableView.showsVerticalScrollIndicator=NO;
    _contactGroupMainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_contactGroupMainTableView];
    _contactGroupMainTableView.tableFooterView=[UIView new];
    [_contactGroupMainTableView registerClass:[TLBaseTableViewCell class] forCellReuseIdentifier:TLBaseTableViewCellIdentifier];
}

-(void)didSelectTableViewHeaderFooterView
{
    [_contactGroupMainTableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.contactGroupMainArr.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TLSectionGroupModel *sectionGroupModel=self.contactGroupMainArr[section];
    return sectionGroupModel.isOpen?3:0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLBaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:TLBaseTableViewCellIdentifier];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType=UITableViewCellAccessoryNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kmargin*5;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TLTableViewHeaderFooterView *tableViewHeaderFooterView=[TLTableViewHeaderFooterView headerView:tableView];
    tableViewHeaderFooterView.numberLabel.hidden=YES;
    tableViewHeaderFooterView.delegate=self;
    tableViewHeaderFooterView.sectionGroupModel=self.contactGroupMainArr[section];
    tableViewHeaderFooterView.contentView.backgroundColor=WhiteColor;
    return tableViewHeaderFooterView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    // 获取_contactGroupMainTableView 当前选中的cell
    //    UITableViewCell *cell=[_contactGroupMainTableView cellForRowAtIndexPath:indexPath];
    
}

@end
