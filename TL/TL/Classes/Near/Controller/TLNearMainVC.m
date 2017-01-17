//
//  TLNearMainVC.m
//  TL
//
//  Created by 阳光 on 16/11/12.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLNearMainVC.h"
#import "TLNearDetailVC.h"
#import "TLLiveMainHomeVC.h"


static NSString *tableViewCellIdentifier=@"UITableViewCellIdentifier";
@interface TLNearMainVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *nearMainTableView;

@end

@implementation TLNearMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=MAIN_BACK_COLOR;
    
    [self initTableView];

    //添加左右滑动手势pan
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
}

#pragma mark Pan手势
- (void) handlePan:(UIPanGestureRecognizer*)recongizer{
    NSLog(@"UIPanGestureRecognizer");

    NSUInteger index = [self.tabBarController selectedIndex];

    CGPoint point = [recongizer translationInView:self.view];
    NSLog(@"%f,%f",point.x,point.y);

    if (recongizer.view.center.x + point.x >  [UIScreen mainScreen].bounds.size.width/2) {
        recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, recongizer.view.center.y);
    } else {
        recongizer.view.center = CGPointMake(recongizer.view.center.x + point.x, recongizer.view.center.y);
    }
    [recongizer setTranslation:CGPointMake(0, 0) inView:self.view];

    if (recongizer.state == UIGestureRecognizerStateEnded) {
        if (recongizer.view.center.x <= [UIScreen mainScreen].bounds.size.width && recongizer.view.center.x > 0 ) {
            [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {

            }];
        } else if (recongizer.view.center.x <= 0 ){
            [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                recongizer.view.center = CGPointMake(-[UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }completion:^(BOOL finished) {
                [self.tabBarController setSelectedIndex:index+1];
                recongizer.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2);
            }];
        } else {

        }
    }
}


-(void)initTableView
{
    // _nearMainTableView
    _nearMainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,1,APPW,APPH-49) style:UITableViewStylePlain];
    _nearMainTableView.delegate=self;
    _nearMainTableView.dataSource=self;
    _nearMainTableView.hidden=NO;
    _nearMainTableView.backgroundColor=MAIN_BACK_COLOR;
    _nearMainTableView.showsVerticalScrollIndicator=NO;
    _nearMainTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_nearMainTableView];
    [_nearMainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellIdentifier];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *image1=@[@"learn",@"ready",@"learn",@"ready",@"learn"];
    NSArray *arr1=@[@"游戏",@"日迹",@"看点",@"动漫",@"音乐"];
    
    NSArray *image2=@[@"learn",@"ready",@"learn",@"ready",@"learn"];
    NSArray *arr2=@[@"直播",@"附近的群",@"同城服务",@"运动",@"腾讯课堂"];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text=@"djskksdjdsdsk";
    if (indexPath.section==0) {
        cell.textLabel.text=arr1[indexPath.row];
        cell.imageView.image=[UIImage imageNamed:image1[indexPath.row]];
    }
    else
    {
        cell.textLabel.text=arr2[indexPath.row];
        cell.imageView.image=[UIImage imageNamed:image2[indexPath.row]];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kmargin*5;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if ((indexPath.section==1)&&(indexPath.row==0))
    {

        TLLiveMainHomeVC *liveMainHomeVC=[TLLiveMainHomeVC new];
        liveMainHomeVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:liveMainHomeVC animated:NO];
    }
    else
    {
        // 获取_nearMainTableView 当前选中的cell
        UITableViewCell *cell=[_nearMainTableView cellForRowAtIndexPath:indexPath];
        TLNearDetailVC *nearDetailVC=[TLNearDetailVC new];
        nearDetailVC.title=cell.textLabel.text;
        [self.navigationController pushViewController:nearDetailVC animated:NO];
 
    }
}

// 间隙置边
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
