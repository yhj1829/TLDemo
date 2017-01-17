//
//  UIView+XCBadgeValue.h
//  MVVM-ViewModel-NetWork-Model
//
//  Created by 刘小椿 on 16/11/17.
//  Copyright © 2016年 刘小椿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XCBadgeValue)

/**
 *  @author liuxiaochun
 *  
 *  设置消息数，设置小于或等于0 、@"" 或 不规则字符 为实心圆,  nil 就是隐藏
 */
@property (nonatomic,copy,readwrite) NSString* xc_badgeValue;

@end
