//
//  SelectView.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "SelectView.h"

@implementation SelectView

-(instancetype)initName:(NSString *)name size:(CGSize)size
{
    self=[super init];
    if (self)
    {
        [self setWithName:name size:size];
    }
    return self;
}

-(void)setWithName:(NSString *)name size:(CGSize)size
{
    [self setSize:size];
    
    // 文字
    _nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,0,self.width,self.height)];
    _nameLabel.textColor=[UIColor blackColor];
    _nameLabel.text=name;
    _nameLabel.textAlignment=NSTextAlignmentCenter;
    _nameLabel.font=Font_Number(14);
    [self addSubview:_nameLabel];
}


@end
