//
//  TLTool.h
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLTool : NSObject

+(UIView *)setLineWithWidth:(CGFloat)width andHeight:(CGFloat)height andColor:(UIColor *)color;

/**
 * 增加view的高度,可以使用返回的view,或者使用原来的view,传参使用的是同一个内存变量
 *
 * @param view   原来的view
 * @param height 添加到底部的高度
 *
 * @return
 */
extern UIView *setViewHeight_Add(UIView *view,CGFloat height);

extern UIView *setViewCoord_Y(UIView *view,CGFloat y);

extern UIView *Tool_lineView(CGPoint center);



@end
