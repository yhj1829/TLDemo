//
//  UIFont+Extension.m
//  QBPatientDemo
//
//  Created by 阳光 on 16/5/12.
//  Copyright © 2016年 Yanghuijuan. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)

+ (UIFont *)fontWithDevice:(CGFloat)fontSize {
    if (QBAPPW > 375) {
        fontSize = fontSize + 3;
    }else if (QBAPPW == 375){
        fontSize = fontSize + 1.5;
    }else if (QBAPPW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

/**
 *  专门为客户性别，年龄电话写的
 */
+ (UIFont *)fontWithCustomer:(CGFloat)fontSize {
    if (QBAPPW > 375) {
        fontSize = fontSize + 2;
    }else if (QBAPPW== 375){
        fontSize = fontSize + 1.5;
    }else if (QBAPPW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

+ (UIFont *)navItemFontWithDevice:(CGFloat)fontSize {
    if (QBAPPW > 375) {
        fontSize = fontSize + 2;
    }else if (QBAPPW == 375){
        fontSize = fontSize + 1;
    }else if (QBAPPW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

+ (UIFont *)fontWithTwoLine:(CGFloat)fontSize {
    if (QBAPPW > 375) {
        fontSize = fontSize + 2;
    }else if (QBAPPW == 375){
        fontSize = fontSize + 1;
    }else if (QBAPPW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

+ (UIFont *)insuranceCellFont:(CGFloat)fontSize {
    if (QBAPPW > 375) {
        fontSize = fontSize + 3.5;
    }else if (QBAPPW == 375){
        fontSize = fontSize + 2;
    }else if (QBAPPW == 320){
        fontSize = fontSize;
    }
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}

@end
