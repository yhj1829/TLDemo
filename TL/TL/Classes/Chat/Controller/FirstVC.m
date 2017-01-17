//
//  FirstVC.m
//  TL
//
//  Created by 阳光 on 16/12/29.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "FirstVC.h"

#import "TLChatMainVC.h"
#import "TLChatListMainVC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *redBtn=[[UIButton alloc]initWithFrame:CGRectMake(100,200,150,30)];
    redBtn.backgroundColor=[UIColor redColor];
    [redBtn setTitle:@"会话列表界面" forState:0];
    [redBtn addTarget:self action:@selector(redBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redBtn];

    UIButton *redBtn1=[[UIButton alloc]initWithFrame:CGRectMake(100,400,150,30)];
    redBtn1.backgroundColor=[UIColor redColor];
    [redBtn1 setTitle:@"聊天界面" forState:0];
    [redBtn1 addTarget:self action:@selector(redBtnClick1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redBtn1];

}

-(void)redBtnClick1
{

    // 聊天界面
    TLChatMainVC *chatMainVC=[[TLChatMainVC alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"test2"];
    chatMainVC.title=@"测试";
    [self.navigationController pushViewController:chatMainVC animated:NO];

}


-(void)redBtnClick
{
    // 会话列表界面
    TLChatListMainVC *chatMainVC=[[TLChatListMainVC alloc]init];
    //[[TLChatListMainVC alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"test2"];
    chatMainVC.title=@"测试";
    [self.navigationController pushViewController:chatMainVC animated:NO];

}

@end
