//
//  TLContactMainHomeVC.m
//  TL
//
//  Created by 阳光 on 16/11/21.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLContactMainHomeVC.h"
#import "TLContactMainVC.h"
#import "TLContactTalkMainVC.h"
#import "TLAddNewContactMainVC.h"
#import "TLContactGroupMainVC.h"

#import "LGLSearchBar.h"

@interface TLContactMainHomeVC ()

@end

@implementation TLContactMainHomeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initData];
    
    // 初始化样式
    [self initView];
    
    // 添加子控制器
    [self addChildVC];

    [self searchView];

    //添加左右滑动手势pan
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];

}

-(void)searchView
{
    LGLSearchBar * searchBar=[[LGLSearchBar alloc] initWithFrame:CGRectMake(0,64,APPW,40) searchBarStyle:LGLSearchBarStyleDefault];
    [searchBar searchBarTextSearchTextBlock:^(NSString *searchText) {
        NSLog(@"searchText --- %@",searchText);
    }];
    [self.view addSubview:searchBar];
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


-(void)addEvent
{
    TLAddNewContactMainVC *addNewContactMainVC=[TLAddNewContactMainVC new];
    addNewContactMainVC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:addNewContactMainVC animated:NO];
}

-(void)initData
{
    //设置导航栏返回按钮
    UIBarButtonItem *addButton=[UIBarButtonItem itemWithImageName:@"add" highImageName:@"add" target:self action:@selector(addEvent)];
    self.navigationItem.leftBarButtonItems=@[addButton];
    
}

// 初始化样式
-(void)initView
{
    // 设置标题栏样式
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth)
     {
         *titleScrollViewColor=[UIColor whiteColor];
         *norColor=[UIColor darkGrayColor];
         *selColor=Main_Color;
         *titleWidth=APPW/3;
     }];
    
    // 设置下标
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor, BOOL *isUnderLineEqualTitleWidth) {
        *isUnderLineDelayScroll=YES;
        *underLineColor=Main_Color;
    }];
}

// 添加子控制器
-(void)addChildVC
{
    // 联系人组(6)
    TLContactMainVC *contactMainVC=[TLContactMainVC new];
    contactMainVC.title=@"联系人组(6)";
    [self addChildViewController:contactMainVC];
    
    // 群组
    TLContactGroupMainVC *contactGroupMainVC=[TLContactGroupMainVC new];
    contactGroupMainVC.title=@"群组(8)";
    [self addChildViewController:contactGroupMainVC];
    
    // 讨论组
    TLContactTalkMainVC *contactTalkMainVC=[TLContactTalkMainVC new];
    contactTalkMainVC.title=@"讨论组(6)";
    [self addChildViewController:contactTalkMainVC];
}

@end
