//
//  AppDelegate.m
//  TL
//
//  Created by 阳光 on 16/11/12.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "AppDelegate.h"
#import "TLTabBarController.h"
#import "TLNavigationController.h"

#import "TLChatMainVC.h"
#import "TLChatListMainVC.h"

#import "FirstVC.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)addKeyboard
{
    // 控制点击背景是否收起键盘
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside=YES;

    // 控制键盘上的工具条文字颜色是否用户自定义
    [IQKeyboardManager sharedManager].shouldToolbarUsesTextFieldTintColor= YES;

    // 控制是否显示键盘上的工具条
     [IQKeyboardManager sharedManager].enableAutoToolbar=YES;
}


-(void)setNavigationBar
{
    [[UINavigationBar appearance]setBarTintColor:NavBgColor];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:WhiteColor,
         NSFontAttributeName:Font_Number(18)}];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController=[TLTabBarController new];
    _window.backgroundColor=WhiteColor;

    [self addKeyboard];

    [self setNavigationBar];

    [self addIM];

    return YES;
}

-(void)addIM
{
    [[RCIM sharedRCIM]initWithAppKey:RM_AppKey];
    [[RCIM sharedRCIM] connectWithToken:RM_AppToken success:^(NSString *userId) {

        dispatch_async(dispatch_get_main_queue(), ^{

            //            TLChatMainVC *chatMainVC=[[TLChatMainVC alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"test2"];
            //            chatMainVC.title=@"测试";
            //            self.window.rootViewController=chatMainVC;

            //            RCConversationViewController *vc=[[RCConversationViewController alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"test2"];
            //            vc.title=@"test";
            //            self.window.rootViewController =vc;
            
        });
        
    } error:^(RCConnectErrorCode status) {
        
    } tokenIncorrect:^{
        
    }];
}

@end
