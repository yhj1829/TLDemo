//
//  TLNavigationController.m
//  TLProject
//
//  Created by 阳光 on 16/11/12.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLNavigationController.h"
#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"

@interface TLNavigationController ()

@end

@implementation TLNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.interactivePopGestureRecognizer.enabled=NO;
}



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        // viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *navigationSpace =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        navigationSpace.width = -5;
        
        //设置导航栏返回按钮
        UIBarButtonItem *backButton=[UIBarButtonItem itemWithImageName:@"back" highImageName:@"back" target:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItems=@[navigationSpace,backButton];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:NO];
}


@end
