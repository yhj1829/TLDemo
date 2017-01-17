//
//  TLRegisterVC.m
//  TL
//
//  Created by 阳光 on 16/12/18.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLRegisterVC.h"
#import "LabelTextFieldView.h"

@interface TLRegisterVC ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)UIView *mainView;

// 昵称
@property(nonatomic,strong)LabelTextFieldView *nickView;

// 手机号
@property(nonatomic,strong)LabelTextFieldView *phoneView;

// 密码
@property(nonatomic,strong)LabelTextFieldView *passwordView;

// 确认密码
@property(nonatomic,strong)LabelTextFieldView *resetPasswordView;

// 验证码
@property(nonatomic,strong)LabelTextFieldView *codeView;

@end

@implementation TLRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title=@"注册";

//    [self initScrollView];

    [self initData];

}

-(void)initData
{
    UIImageView *bgImage=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,APPW,APPH)];
    bgImage.image=[UIImage imageNamed:@"bg.jpg"];
    [self.view addSubview:bgImage];

    NSArray *placeholderArr=@[@"请输入手机号",@"请填写验证码",@"请设置密码",@"再次确认密码"];
    for (NSInteger i=0;i<4;i++)
    {
        UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake(kmargin*2,64+kmargin*5+(kmargin*7)*(i%4),(APPW-kmargin*4),40)];
        if (i==1)
        {
            textField.width=(APPW-kmargin*4)*1/2;
            UIButton *codeBtn=[[UIButton alloc]initWithFrame:CGRectMake(APPW-kmargin*2-textField.width+kmargin,textField.frame.origin.y,textField.width-kmargin,kmargin*4)];
            [codeBtn setTitle:@"发送验证码" forState:0];
            [codeBtn setTitleColor:[UIColor blueColor] forState:0];
            codeBtn.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:.3];
            ViewBorderRadius(codeBtn,kmargin,1,ClearColor);
            [codeBtn.titleLabel setFont:Font_Number(12)];
            [codeBtn addTarget:self action:@selector(codeBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:codeBtn];
        }
        textField.userInteractionEnabled=YES;
        textField.placeholder=placeholderArr[i];
        [self.view addSubview:textField];
        textField.tag=i+10000;
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




    // 注册
    UIImageView *registerImage=[[UIImageView alloc]initWithFrame:CGRectMake((APPW-kmargin*9)/2,APPH-kmargin*15,kmargin*9,kmargin*9)];
    registerImage.image=[UIImage imageNamed:@"register"];
    [self.view addSubview:registerImage];
    registerImage.userInteractionEnabled=YES;
    ViewBorderRadius(registerImage,kmargin*9/2,1,ClearColor);
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(registerImageEvent)];
    [registerImage addGestureRecognizer:tap];
}


// 注册
-(void)registerImageEvent
{


}

// 获取验证码
-(void)codeBtnClick
{

    NSLog(@"sdjkjjdjd");

//    [self.view endEditing:YES];

//    // 手机号码校验
//    if ([_phoneView.textField.text isPhone]==NO)
//    {
//        [self.view makeToast:@"请输入正确的手机号" duration:.1 position:CSToastPositionCenter];
//    }
//    else

    UITextField *textFiled=[self.view viewWithTag:10000];
    {
        NSDictionary *dic=@{
                             @"phoneNumber":textFiled
                            };
        [TLInterfaceRequest GetCodeWithDic:dic Success:^(id res) {

            NSLog(@"ii---%@",res);

        } failure:^(NSError *error)
        {

        }];
    }
}

-(void)registerBtnClick
{
    [self.view endEditing:YES];

    if (_nickView.textField.text.length==0)
    {
        [self.view makeToast:@"请输入昵称" duration:.1 position:CSToastPositionCenter];
    }
    // 手机号码校验
    else if ([_phoneView.textField.text isPhone]==NO)
    {
        [self.view makeToast:@"请输入正确的手机号" duration:.1 position:CSToastPositionCenter];
    }
    // 密码校验
    else if (_passwordView.textField.text.length>0&&_passwordView.textField.text.length<6)
    {
        [self.view makeToast:@"请输入6位密码" duration:.1 position:CSToastPositionCenter];
    }
    // 确认密码校验
    else if (![_passwordView.textField.text isEqualToString:_resetPasswordView.textField.text])
    {
        [self.view makeToast:@"密码不一致" duration:.1 position:CSToastPositionCenter];
    }
    else if (_codeView.textField.text.length>0&&_codeView.textField.text.length<6)
    {
         [self.view makeToast:@"请输入6位密码" duration:.1 position:CSToastPositionCenter];
    }
    else
    {

    }
}

@end
