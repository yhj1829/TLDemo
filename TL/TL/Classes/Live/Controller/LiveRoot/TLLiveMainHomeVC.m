//
//  TLLiveMainHomeVC.m
//  TL
//
//  Created by 阳光 on 16/11/22.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLLiveMainHomeVC.h"

#import "TLLiveHotMainVC.h"
#import "TLLiveNearMainVC.h"
#import "TLLivePopularMainVC.h"
#import "TLLiveRecentMainVC.h"
#import "TLLiveOuterSportMainVC.h"
#import "TLLiveBussinessMainVC.h"

#import "UIImage+ClipARC.h"
#import "TLPublicLiveMainVC.h"
#import "TLMyLiveMainVC.h"

#import "LGLSearchBar.h"

@interface TLLiveMainHomeVC()<UITabBarDelegate>

@property(nonatomic,strong)UITabBar *tabBar;

@end

@implementation TLLiveMainHomeVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // 初始化下面三个tabBar
    [self setBottomView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
     [_tabBar removeFromSuperview];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=MAIN_BACK_COLOR;
    
    self.title=@"喵喵直播";
    
    // 初始化样式
    [self initView];
    
    // 添加子控制器
    [self addChildVC];

    [self searchView];

}


-(void)searchView
{
    LGLSearchBar * searchBar=[[LGLSearchBar alloc] initWithFrame:CGRectMake(0,64,APPW,40) searchBarStyle:LGLSearchBarStyleDefault];
    [searchBar searchBarTextSearchTextBlock:^(NSString *searchText) {
        NSLog(@"searchText --- %@",searchText);
    }];
    [self.view addSubview:searchBar];
}


-(void)setBottomView
{
    UITabBar *bottomTabBar=[UITabBar new];
    bottomTabBar.delegate = self;
    _tabBar=bottomTabBar;
    bottomTabBar.backgroundColor=Main_Color;
    [[UIApplication sharedApplication].keyWindow addSubview:bottomTabBar];
    [bottomTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(APPW,kmargin*5));
    }];

    NSArray *buttomArr=@[@"主页",@"发布直播",@"我的主页"];
    NSInteger index=0;

    NSMutableArray *muArr=[NSMutableArray arrayWithCapacity:buttomArr.count];
    for (NSString *title in buttomArr) {

//        NSString *normalImage =[NSString stringWithFormat:@"%ld",(long)index];
        NSString *normalImage=[NSString stringWithFormat:@"1"];

        UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[[UIImage imageNamed:normalImage]newImageSizeWithNewWith:25] tag:index];

        tabBarItem.selectedImage = [[[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",normalImage]] newImageSizeWithNewWith:25] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        [tabBarItem setTitleTextAttributes:@{
                                             NSForegroundColorAttributeName:Color666666,
                                             }forState:UIControlStateSelected];
        tabBarItem.imageInsets = UIEdgeInsetsMake(0,0,0,0);
        tabBarItem.titlePositionAdjustment=UIOffsetMake(0,0);
        [muArr addObject:tabBarItem];
        index++;
    }
    bottomTabBar.delegate=self;
    bottomTabBar.items=muArr.copy;

}

#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag==0)
    {
        [self.navigationController popViewControllerAnimated:NO];
    }
    else if (item.tag==1)
    {
        TLPublicLiveMainVC *publicLiveMainVC=[TLPublicLiveMainVC new];
        publicLiveMainVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:publicLiveMainVC animated:NO];
    }
    else
    {
        TLMyLiveMainVC *myLiveMainVC=[TLMyLiveMainVC new];
        myLiveMainVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:myLiveMainVC animated:NO];
    }
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
         *titleWidth=APPW/4;
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
    // 热门
    TLLiveHotMainVC *liveHotMainVC=[TLLiveHotMainVC new];
    liveHotMainVC.title=@"热门";
    [self addChildViewController:liveHotMainVC];
    
    // 附近
    TLLiveNearMainVC *liveNearMainVC=[TLLiveNearMainVC new];
    liveNearMainVC.title=@"附近";
    [self addChildViewController:liveNearMainVC];
    
    // 人气
    TLLivePopularMainVC *livePopularMainVC=[TLLivePopularMainVC new];
    livePopularMainVC.title=@"人气";
    [self addChildViewController:livePopularMainVC];
    
    // 最新
    TLLiveRecentMainVC *liveRecentMainVC=[TLLiveRecentMainVC new];
    liveRecentMainVC.title=@"最新";
    [self addChildViewController:liveRecentMainVC];
    
    // 户外运动  户外探险
    TLLiveOuterSportMainVC *liveOuterSportMainVC=[TLLiveOuterSportMainVC new];
    liveOuterSportMainVC.title=@"户外探险";
    [self addChildViewController:liveOuterSportMainVC];
    
    // 商业  体育
    TLLiveBussinessMainVC *liveBussinessMainVC=[TLLiveBussinessMainVC new];
    liveBussinessMainVC.title=@"体育";
    [self addChildViewController:liveBussinessMainVC];
    
}

@end
