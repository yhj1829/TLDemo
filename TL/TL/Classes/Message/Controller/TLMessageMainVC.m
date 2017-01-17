//
//  TLMessageMainVC.m
//  TL
//
//  Created by 阳光 on 16/11/12.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLMessageMainVC.h"
#import "TLMessageMainCell.h"

static NSString *tableViewCellIdentifier=@"UITableViewCellIdentifier";
@interface TLMessageMainVC ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *myMainTableView;

@end

@implementation TLMessageMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=MAIN_BACK_COLOR;
    
    [self initTableView];

    //添加左右滑动手势pan
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];

    [self initData];
}

-(void)initData
{
    //设置导航栏返回按钮
    UIBarButtonItem *addButton=[UIBarButtonItem itemWithName:@"登录" font:14 target:self action:@selector(addEvent)];
    //[UIBarButtonItem itemWithImageName:@"add" highImageName:@"add" target:self action:@selector(addEvent)];
    self.navigationItem.rightBarButtonItem=addButton;

}

-(void)addEvent
{
    RCConversationViewController *vc=[[RCConversationViewController alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"test2"];
    vc.title=@"test";
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:NO];
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
    // _myMainTableView
    _myMainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,1,APPW,APPH-49) style:UITableViewStylePlain];
    _myMainTableView.delegate=self;
    _myMainTableView.dataSource=self;
    _myMainTableView.hidden=NO;
    _myMainTableView.backgroundColor=MAIN_BACK_COLOR;
    _myMainTableView.showsVerticalScrollIndicator=NO;
    _myMainTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_myMainTableView];
    [_myMainTableView registerClass:[TLMessageMainCell class] forCellReuseIdentifier:tableViewCellIdentifier];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMessageMainCell *cell=[tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
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
