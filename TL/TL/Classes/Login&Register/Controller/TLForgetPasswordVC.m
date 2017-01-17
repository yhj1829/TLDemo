//
//  TLForgetPasswordVC.m
//  TL
//
//  Created by 阳光 on 16/12/18.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLForgetPasswordVC.h"
#import "LabelTextFieldView.h"
#import "TLResetPasswordVC.h"

@interface TLForgetPasswordVC ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)UIView *mainView;

// 身份证号
@property(nonatomic,strong)LabelTextFieldView *IDView;

// 手机号
@property(nonatomic,strong)LabelTextFieldView *phoneView;

// 验证码
@property(nonatomic,strong)LabelTextFieldView *codeView;

@end

@implementation TLForgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title=@"找回密码";

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

-(void)modifyHeadBtnClick
{

}

-(UIView *)setMainView
{
    UIView *mainView=[[UIView alloc]initWithFrame:CGRectMake(0,0,APPW,0)];
    mainView.backgroundColor=WhiteColor;

    _IDView=[[LabelTextFieldView alloc]initWithTitle:@"身份证号" placeholder:@"请输入身份证号"];
    _IDView.frame=CGRectMake(kmargin*2,mainView.frame.size.height+kmargin*2,APPW-kmargin*4,kmargin*4);
    ViewBorderRadius(_IDView,kmargin/2,1,MAIN_BACK_COLOR);
    [mainView addSubview:_IDView];
    setViewHeight_Add(mainView,kmargin*6);

    _phoneView=[[LabelTextFieldView alloc]initWithTitle:@"手机号" placeholder:@"请输入手机号"];
    _phoneView.frame=CGRectMake(kmargin*2,mainView.frame.size.height+kmargin,APPW-kmargin*4,kmargin*4);
    ViewBorderRadius(_phoneView,kmargin/2,1,MAIN_BACK_COLOR);
    [mainView addSubview:_phoneView];
    setViewHeight_Add(mainView,kmargin*5);


    _codeView=[[LabelTextFieldView alloc]initWithTitle:@"验证码" placeholder:@"请输入手机验证码"];
    _codeView.frame=CGRectMake(kmargin*2,mainView.frame.size.height+kmargin,APPW-kmargin*4-80,kmargin*4);
    ViewBorderRadius(_codeView,kmargin/2,1,MAIN_BACK_COLOR);
    [mainView addSubview:_codeView];

    UIButton *codeBtn=[[UIButton alloc]initWithFrame:CGRectMake(APPW-70-kmargin*2,mainView.frame.size.height+kmargin,70,kmargin*4)];
    [codeBtn setTitle:@"发送验证码" forState:0];
    [codeBtn setTitleColor:Color333333 forState:0];
    codeBtn.backgroundColor=Main_Color;
    [codeBtn.titleLabel setFont:Font_Number(13)];
    [codeBtn addTarget:self action:@selector(codeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:codeBtn];
    ViewBorderRadius(codeBtn,kmargin/2,1,ClearColor);
    setViewHeight_Add(mainView,kmargin*5);


    UIButton *nextBtn=[[UIButton alloc]initWithFrame:CGRectMake(kmargin*2,mainView.frame.size.height+kmargin*3,APPW-kmargin*4,kmargin*4)];
    [nextBtn setTitle:@"下一步" forState:0];
    [nextBtn setTitleColor:WhiteColor forState:0];
    nextBtn.backgroundColor=Main_Color;
    [nextBtn.titleLabel setFont:Font_Number(13)];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:nextBtn];
    ViewBorderRadius(nextBtn,kmargin/2,1,ClearColor);
    setViewHeight_Add(mainView,kmargin*7);

    return mainView;
}

-(void)codeBtnClick
{
    [self.view endEditing:YES];

    // 手机号码校验
    if ([_phoneView.textField.text isPhone]==NO)
    {
        [self.view makeToast:@"请输入正确的手机号" duration:.1 position:CSToastPositionCenter];
    }
    else
    {

    }
}

-(void)nextBtnClick
{
    [self.view endEditing:YES];

//    if (_IDView.textField.text.length==0)
//    {
//        [self.view makeToast:@"请输入身份证号" duration:.1 position:CSToastPositionCenter];
//    }
//    // 手机号码校验
//    else if ([_phoneView.textField.text isPhone]==NO)
//    {
//        [self.view makeToast:@"请输入正确的手机号" duration:.1 position:CSToastPositionCenter];
//    }
//    // 验证码校验
//    else if (_codeView.textField.text.length>0&&_codeView.textField.text.length<6)
//    {
//        [self.view makeToast:@"请输入6位密码" duration:.1 position:CSToastPositionCenter];
//    }
//    else
    {
        TLResetPasswordVC *resetPasswordVC=[TLResetPasswordVC new];
        resetPasswordVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:resetPasswordVC animated:NO];
    }


}

@end
