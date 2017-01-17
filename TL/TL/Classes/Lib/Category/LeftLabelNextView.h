//
//  LeftLabelNextView.h
//  TL
//
//  Created by 阳光 on 16/11/16.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftLabelNextView : UIView

-(instancetype)initWithTitle:(NSString *)title hasNext:(BOOL)next;

@property(nonatomic,strong)NSString *leftTitle;

@property(nonatomic,strong)UILabel *leftTitleLabel;

@property(nonatomic,strong)UIImageView *imageIcon;

@end
