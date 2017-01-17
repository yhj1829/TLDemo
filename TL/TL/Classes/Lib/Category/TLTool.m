//
//  TLTool.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLTool.h"

@implementation TLTool

+(UIView *)setLineWithWidth:(CGFloat)width andHeight:(CGFloat)height andColor:(UIColor *)color
{
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,0,width,height)];
    line.backgroundColor=color;
    return line;
}

extern UIView *setViewHeight_Add(UIView *view,CGFloat height)
{
    CGRect rect=view.frame;
    rect.size.height+=height;
    view.frame=rect;
    return view;
}

extern UIView *setViewCoord_Y(UIView *view,CGFloat y)
{
    CGRect rect=view.frame;
    rect.origin.y=y;
    view.frame=rect;
    return view;
}

extern UIView *Tool_lineView(CGPoint center)
{
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, APPW, .5)];
    lineView.backgroundColor=Color333333;
    lineView.center=center;
    return lineView;
}

@end
