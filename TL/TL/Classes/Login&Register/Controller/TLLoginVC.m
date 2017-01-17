//
//  TLLoginVC.m
//  TL
//
//  Created by 阳光 on 16/12/18.
//  Copyright © 2016年 阳光. All rights reserved.
//  登录主界面

#import "TLLoginVC.h"
#import "TLRegisterVC.h"
#import "TLForgetPasswordVC.h"

@interface TLLoginVC ()<UITextFieldDelegate>

@end

@implementation TLLoginVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title=@"登录";

    [self initData];
}


-(void)initData
{
    UIImageView *bgImage=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,APPW,APPH)];
    bgImage.image=[UIImage imageNamed:@"bg.jpg"];
    [self.view addSubview:bgImage];


    // 头像
    UIButton *headBtn=[[UIButton alloc]initWithFrame:CGRectMake((APPW-kmargin*10)/2,kmargin*5+64,kmargin*10,kmargin*10)];
    [bgImage addSubview:headBtn];
    [headBtn setBackgroundImage:[[UIImage imageNamed:@"head"] resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0) resizingMode:UIImageResizingModeStretch] forState:0];
    ViewBorderRadius(headBtn,kmargin*9/2,1,ClearColor);
    [headBtn addTarget:self action:@selector(modifyHeadBtnClick) forControlEvents:UIControlEventTouchUpInside];

    NSArray *placeholderArr=@[@"请输入手机号",@"请输入密码"];
    for (NSInteger i=0;i<2;i++)
    {
        UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake(kmargin*2,CGRectGetMaxY(headBtn.frame)+kmargin*5+(kmargin*7)*(i%2),(APPW-kmargin*4),40)];
        textField.placeholder=placeholderArr[i];
        [self.view addSubview:textField];
        textField.tag=i+10000;
        textField.delegate=self;
        ViewBorderRadius(textField,kmargin,1,ClearColor);
        textField.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:.3];
        textField.borderStyle=UITextBorderStyleRoundedRect;
        NSMutableAttributedString *placeholder=[[NSMutableAttributedString alloc]initWithString:placeholderArr[i]];
        [placeholder addAttributes:@{
                                    NSFontAttributeName:Font_Number(12),
                                    NSForegroundColorAttributeName:WhiteColor
                                    }range:NSMakeRange(0,[placeholderArr[i] length])];
        textField.attributedPlaceholder=placeholder;
        textField.leftView=[[UIView alloc]initWithFrame:CGRectMake(0,0,kmargin,0)];
        textField.leftViewMode=UITextFieldViewModeAlways;
    }

    // 登录
    UIImageView *loginImage=[[UIImageView alloc]initWithFrame:CGRectMake((APPW-kmargin*9)/2,APPH-kmargin*15,kmargin*9,kmargin*9)];
    loginImage.image=[UIImage imageNamed:@"login"];
    [self.view addSubview:loginImage];
    loginImage.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loginImageEvent)];
    [loginImage addGestureRecognizer:tap];


    NSArray *titleArr=@[@"注册账号",@"找回密码"];
    for (NSInteger i=0;i<2;i++)
    {
        UILabel *registerAndForgetPdLabel=[UILabel new];
        registerAndForgetPdLabel.frame=CGRectMake((APPW*2/3)*(i%2),CGRectGetMaxY(loginImage.frame)-kmargin*3,APPW/3,kmargin*3);
        registerAndForgetPdLabel.textAlignment=NSTextAlignmentCenter;
        NSMutableAttributedString *placeholder=[[NSMutableAttributedString alloc]initWithString:titleArr[i]];
        [placeholder addAttributes:@{
                                     NSFontAttributeName:Font_Number(12),
                                     NSForegroundColorAttributeName:WhiteColor,
                                     NSUnderlineColorAttributeName:WhiteColor,
                                     NSUnderlineStyleAttributeName:@1
                                     }range:NSMakeRange(0,[titleArr[i] length])];
        registerAndForgetPdLabel.attributedText=placeholder;
        [self.view addSubview:registerAndForgetPdLabel];
        registerAndForgetPdLabel.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(registerAndForgetPdLabelEvent:)];
        [registerAndForgetPdLabel addGestureRecognizer:tap];
        registerAndForgetPdLabel.tag=i+20000;
    }
}


-(void)registerAndForgetPdLabelEvent:(UITapGestureRecognizer *)tap
{
    if (tap.view.tag==20000)
    {
        // 注册界面跳转
        TLRegisterVC *registerVC=[TLRegisterVC new];
        registerVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:registerVC animated:NO];
    }
    else
    {
        // 忘记密码界面跳转
        TLForgetPasswordVC *forgetPasswordVC=[TLForgetPasswordVC new];
        forgetPasswordVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:[TLForgetPasswordVC new] animated:NO];
    }
}


-(void)modifyHeadBtnClick
{

}

-(void)loginImageEvent
{
    // 手机号码校验
    if ([[[self.view viewWithTag:10000]text] isPhone]==NO)
    {
       [self.view makeToast:@"请输入正确的手机号" duration:.1 position:CSToastPositionCenter];
    }
    // 密码校验
    else if ([[[self.view viewWithTag:10001]text]length]>0&&[[[self.view viewWithTag:10001]text]length]<6)
    {
        [self.view makeToast:@"请输入6位密码" duration:.1 position:CSToastPositionCenter];
    }
    else
    {

    }
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [[self.view viewWithTag:10000] resignFirstResponder];
    [[self.view viewWithTag:10001] resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

@end
