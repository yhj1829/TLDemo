//
//  TLTabBarController.m
//  TLProject
//
//  Created by 阳光 on 16/11/12.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLTabBarController.h"

#import "TLMessageMainVC.h"
#import "TLNearMainVC.h"
#import "TLMyMainVC.h"
#import "TLNavigationController.h"
#import "TLContactMainHomeVC.h"


@interface TLTabBarController ()

@end

@implementation TLTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupChildControllers];

}

- (void)setupChildControllers
{
    // 消息
    [self setupChildNavigationControllerWithClass:[TLNavigationController class] tabBarImageName:@"message" rootViewControllerClass:[TLMessageMainVC class] rootViewControllerTitle:@"消息"];
    
    // 联系人
    [self setupChildNavigationControllerWithClass:[TLNavigationController class] tabBarImageName:@"group" rootViewControllerClass:[TLContactMainHomeVC class] rootViewControllerTitle:@"联系人"];
    
    //  动态
    [self setupChildNavigationControllerWithClass:[TLNavigationController class] tabBarImageName:@"near" rootViewControllerClass:[TLNearMainVC class] rootViewControllerTitle:@"动态"];
    
    //  我的
    [self setupChildNavigationControllerWithClass:[TLNavigationController class] tabBarImageName:@"my" rootViewControllerClass:[TLMyMainVC class] rootViewControllerTitle:@"我的"];
}


-(void)setupChildNavigationControllerWithClass:(Class)class tabBarImageName:(NSString *)name  rootViewControllerClass:(Class)rootViewControllerClass rootViewControllerTitle:(NSString *)title
{
    UIViewController *rootVC=[[rootViewControllerClass alloc] init];
    rootVC.title=title;
    
    TLNavigationController *navVc=[[class alloc] initWithRootViewController:rootVC];
    
    // 未选择时图片显示
    navVc.tabBarItem.image=[[UIImage imageNamed:name]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 选中图片显示
    navVc.tabBarItem.selectedImage =[[UIImage imageNamed:[NSString stringWithFormat:@"%@_select",name]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 选中文字颜色设置
    [navVc.tabBarItem setTitleTextAttributes:
     @{ NSForegroundColorAttributeName:RGBACOLOR(56,165,241,1)}
                                    forState:UIControlStateSelected];
    [navVc.tabBarItem setTitleTextAttributes:
     @{ NSForegroundColorAttributeName:RGBACOLOR(132,132,132,1)}
                                    forState:0];
    [self addChildViewController:navVc];
    
}


@end
