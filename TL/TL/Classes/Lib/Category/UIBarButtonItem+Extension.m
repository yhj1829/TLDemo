//
//  UIBarButtonItem+Extension.m
//  QBPatientDemo
//
//  Created by 阳光 on 16/5/12.
//  Copyright © 2016年 Yanghuijuan. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIFont+Extension.h"


@implementation UIBarButtonItem (Extension)

/**
 *  没有图片调整的按钮
 */
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:target action:(SEL)action {
    UIButton *button = [[UIButton alloc] init];
    //    button.backgroundColor = [UIColor redColor];
    // 设置按钮的背景图片
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (highImageName != nil) {
        [button setBackgroundImage: [UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    }
    // 设置按钮的尺寸为背景图片的尺寸
    button.size = button.currentBackgroundImage.size;
    button.adjustsImageWhenHighlighted = NO;
    //监听按钮的点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

/**
 *  没有文字调整的按钮
 */
+ (UIBarButtonItem *)itemWithName:(NSString *)Name font:(CGFloat)font target:target action:(SEL)action {
    
    UIButton *btn = [[UIButton alloc] init];
    btn.titleLabel.font = [UIFont navItemFontWithDevice:font];
    [btn setTitle:Name forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn setTitleColor:Color666666 forState:0];
    //监听按钮的点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.adjustsImageWhenHighlighted = NO;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (NSArray *)itemsWithName:(NSString *)Name font:(CGFloat)font target:target action:(SEL)action {
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -5;
    
    UIButton *btn = [[UIButton alloc] init];
    btn.titleLabel.font = [UIFont navItemFontWithDevice:font];
    [btn setTitle:Name forState:UIControlStateNormal];
    [btn sizeToFit];
    //监听按钮的点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.adjustsImageWhenHighlighted = NO;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return @[negativeSpacer, item];
}

+ (NSArray *)itemsWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:target action:(SEL)action {
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -5;
    
    UIBarButtonItem *item = [UIBarButtonItem itemWithImageName:imageName highImageName:highImageName target:target action:action];
    return @[negativeSpacer, item];
}
@end
