//
//  TLResetPasswordVC.m
//  TL
//
//  Created by 阳光 on 16/12/18.
//  Copyright © 2016年 阳光. All rights reserved.
//  重置密码界面

#import "TLResetPasswordVC.h"
#import "LabelTextFieldView.h"

@interface TLResetPasswordVC ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)UIView *mainView;

// 新密码
@property(nonatomic,strong)LabelTextFieldView *passwordView;

// 确认新密码
@property(nonatomic,strong)LabelTextFieldView *resetPasswordView;


@end

@implementation TLResetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title=@"设置密码";

    [self initScrollView];

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

-(UIView *)setMainView
{
    UIView *mainView=[[UIView alloc]initWithFrame:CGRectMake(0,0,APPW,0)];
    mainView.backgroundColor=WhiteColor;

    _passwordView=[[LabelTextFieldView alloc]initWithTitle:@"新密码" placeholder:@"请输入新密码"];
    _passwordView.frame=CGRectMake(kmargin*2,mainView.frame.size.height+kmargin*2,APPW-kmargin*4,kmargin*4);
    ViewBorderRadius(_passwordView,kmargin/2,1,MAIN_BACK_COLOR);
    [mainView addSubview:_passwordView];
    setViewHeight_Add(mainView,kmargin*6);

    _resetPasswordView=[[LabelTextFieldView alloc]initWithTitle:@"确认新密码" placeholder:@"请输入确认新密码"];
    _resetPasswordView.frame=CGRectMake(kmargin*2,mainView.frame.size.height+kmargin,APPW-kmargin*4,kmargin*4);
    ViewBorderRadius(_resetPasswordView,kmargin/2,1,MAIN_BACK_COLOR);
    [mainView addSubview:_resetPasswordView];
    setViewHeight_Add(mainView,kmargin*5);

    UIButton *OKBtn=[[UIButton alloc]initWithFrame:CGRectMake(kmargin*2,mainView.frame.size.height+kmargin*3,APPW-kmargin*4,kmargin*4)];
    [OKBtn setTitle:@"完成" forState:0];
    [OKBtn setTitleColor:WhiteColor forState:0];
    OKBtn.backgroundColor=Main_Color;
    [OKBtn.titleLabel setFont:Font_Number(13)];
    [OKBtn addTarget:self action:@selector(OKBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:OKBtn];
    ViewBorderRadius(OKBtn,kmargin/2,1,ClearColor);
    setViewHeight_Add(mainView,kmargin*7);
    
    return mainView;
}

-(void)OKBtnClick
{
    [self.view endEditing:YES];

    // 密码校验
     if (_passwordView.textField.text.length>0&&_passwordView.textField.text.length<6)
    {
        [self.view makeToast:@"请输入6位密码" duration:.1 position:CSToastPositionCenter];
    }
    // 确认密码校验
    else if (![_passwordView.textField.text isEqualToString:_resetPasswordView.textField.text])
    {
        [self.view makeToast:@"密码不一致" duration:.1 position:CSToastPositionCenter];
    }
    else
    {

    }
}

@end
