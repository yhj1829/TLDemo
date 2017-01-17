//
//  UIDevice+XCDevice.h
//  XCKitDemo
//
//  Created by 刘小椿 on 16/12/2.
//  Copyright © 2016年 刘小椿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (XCDevice)

/**
 连接网络

 @return 是否连接
 */
+ (BOOL)connectedToNetwork;

/**
 连接WiFi

 @return 是否连接
 */
+ (BOOL)connectedToWiFi;

/**
 强制屏幕旋转

 @param orientation 方向
 */
+ (void)setOrientation:(UIInterfaceOrientation)orientation;

/**
 获取本地IP地址

 @return IP
 */
+ (NSString *)localIPAddress;

/**
 电话支持

 @return 是否支持
 */
+ (BOOL)callPhoneSupported;

@end
