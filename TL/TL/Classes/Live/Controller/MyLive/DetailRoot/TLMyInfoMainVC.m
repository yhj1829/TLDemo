//
//  TLMyInfoMainVC.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLMyInfoMainVC.h"

@interface TLMyInfoMainVC ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)UIView *mainView;

@end

@implementation TLMyInfoMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.title=@"个人资料";
    
    [self initScrollView];
    
//    // 提交按钮
//    UIBarButtonItem *okBtn=[UIBarButtonItem itemWithName:@"提交" font:16 target:self action:@selector(OKEvent)];
//    self.navigationItem.rightBarButtonItem=okBtn;
}

-(void)OKEvent
{
    
}

-(void)initScrollView
{
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,APPW,APPH)];
    _scrollView.backgroundColor=WhiteColor;
    _scrollView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_scrollView];
    
    _mainView=[self setMainView];
    setViewCoord_Y(_mainView,0);
    [_scrollView addSubview:_mainView];
    _scrollView.contentSize=CGSizeMake(APPW,CGRectGetMaxY(self.mainView.frame)+kmargin*10);
    
}

-(void)modifyHeadBtn
{
    
}


-(UIView *)setMainView
{
    UIView *mainView=[[UIView alloc]initWithFrame:CGRectMake(0,0,APPW,0)];
    mainView.backgroundColor=WhiteColor;
    
    // 头像
    UIButton *headBtn=[[UIButton alloc]initWithFrame:CGRectMake((APPW-kmargin*6)/2,mainView.frame.size.height+kmargin,kmargin*6,kmargin*6)];
    [mainView addSubview:headBtn];
    [headBtn setBackgroundImage:[[UIImage imageNamed:@"ready"] resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0) resizingMode:UIImageResizingModeStretch] forState:0];
    
    ViewBorderRadius(headBtn,kmargin*3,1,ClearColor);
    [headBtn addTarget:self action:@selector(modifyHeadBtn) forControlEvents:UIControlEventTouchUpInside];
    setViewHeight_Add(mainView,kmargin*6+kmargin);
    
    // 昵称
    UITextField *nickTF=[[UITextField alloc]initWithFrame:CGRectMake(kmargin,mainView.frame.size.height+kmargin*2,APPW-kmargin*2,kmargin*3)];
    nickTF.placeholder=@"请输入昵称";
    nickTF.textAlignment=NSTextAlignmentCenter;
    nickTF.font=Font_Number(13);
    ViewBorderRadius(nickTF,1,1,MAIN_BACK_COLOR);
    [mainView addSubview:nickTF];
     setViewHeight_Add(mainView,kmargin*3+kmargin*3);

    // 个人签名
    NSString *signStr=@"个人签名:\n在专注于文字的项目精神下，简书拥有着出众的阅读体验。同时，我们的编辑团队每日选出最具价值的内容，一一为您推荐。";
    CGSize contentSize=[signStr boundingRectWithSize:CGSizeMake(APPW-kmargin*2,CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:Font_Number(13) }context:nil].size;
    UILabel *signLabel=[mainView getLabelWithText:signStr font:Font_Number(13) textColor:Color666666 textAlignment:NSTextAlignmentLeft lineBreakMode:NSLineBreakByCharWrapping numberOfLines:0];
    signLabel.frame=CGRectMake(kmargin,mainView.frame.size.height+kmargin*2,APPW-kmargin*2,contentSize.height);
    [mainView addSubview:signLabel];
    setViewHeight_Add(mainView,contentSize.height+kmargin*2);

    UIButton *OKBtn=[[UIButton alloc]initWithFrame:CGRectMake(kmargin,mainView.frame.size.height+kmargin*2,APPW-kmargin*2,kmargin*3)];
    [OKBtn setTitle:@"完成" forState:0];
    [OKBtn setTitleColor:WhiteColor forState:0];
    OKBtn.backgroundColor=Main_Color;
    [OKBtn.titleLabel setFont:Font_Number(13)];
    [OKBtn addTarget:self action:@selector(OKBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:OKBtn];
    ViewBorderRadius(OKBtn,kmargin/2,1,ClearColor);
    setViewHeight_Add(mainView,kmargin*3);
    
    
    return mainView;
}

-(void)OKBtnClick
{
    
    
}


@end
