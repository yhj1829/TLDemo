//
//  TLPublicLiveMainVC.m
//  TL
//
//  Created by 阳光 on 16/12/15.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLPublicLiveMainVC.h"
#import "TLProtocolVC.h"

@interface TLPublicLiveMainVC ()

@end

@implementation TLPublicLiveMainVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title=@"发布直播";

    [self setRootView];

}

-(void)liveBtnClick
{
    NSLog(@"开始直播");
}

-(void)cameraBtnClick
{
   NSLog(@"前置摄像头打开");
}

-(void)setRootView
{
    UITextField *textTF=[[UITextField alloc]initWithFrame:CGRectMake(kmargin*2,APPH/4,APPW-kmargin*4,30)];
    textTF.textAlignment=NSTextAlignmentCenter;
    textTF.placeholder=@"好的标题能吸引更多用户哦";
    ViewBorderRadius(textTF,1,1,MAIN_BACK_COLOR);
    textTF.font=Font_Number(12);
    [self.view addSubview:textTF];


    UIButton *liveBtn=[[UIButton alloc]initWithFrame:CGRectMake(kmargin*8,CGRectGetMaxY(textTF.frame)+kmargin*3,APPW-kmargin*16,30)];
    [liveBtn setTitle:@"开始直播" forState:0];
    liveBtn.titleLabel.font=Font_Number(14);
    [liveBtn setTitleColor:Main_Color forState:0];
    liveBtn.backgroundColor=[UIColor orangeColor];
    [liveBtn addTarget:self action:@selector(liveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:liveBtn];

    UIButton *cameraBtn=[[UIButton alloc]initWithFrame:CGRectMake((APPW-30)/2,APPH/2+30/2,30,30)];
    [cameraBtn setImage:[UIImage imageNamed:@"ready"] forState:0];
    [cameraBtn addTarget:self action:@selector(cameraBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cameraBtn];


    UILabel *proLabel=[self.view getLabelWithText:@"开始直播即代表你同意<<么么直播协议>>" font:Font_Number(12) textColor:Main_Color textAlignment:NSTextAlignmentCenter lineBreakMode:NSLineBreakByTruncatingTail numberOfLines:1];
    [self.view addSubview:proLabel];
    proLabel.userInteractionEnabled=YES;
    proLabel.frame=CGRectMake(0,APPH-kmargin*4,APPW,20);

    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [proLabel addGestureRecognizer:tap];
}

-(void)tapClick
{
    [self.navigationController pushViewController:[TLProtocolVC new] animated:NO];
}

@end
