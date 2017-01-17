//
//  LabelTextFieldView.h
//  TL
//
//  Created by 阳光 on 16/12/18.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelTextFieldView : UIView

-(instancetype)initWithTitle:(NSString *)title  placeholder:(NSString *)placeholder;

@property(nonatomic,strong)NSString *leftTitle;

@property(nonatomic,strong)UILabel *leftTitleLabel;

@property(nonatomic,strong)UITextField *textField;

//@property(nonatomic,strong)UIButton *arrowBtn;

@property(nonatomic,strong)NSString *placeholder;


@end
