//
//  Header.h
//  TL
//
//  Created by 阳光 on 16/11/12.
//  Copyright © 2016年 阳光. All rights reserved.
//

#ifndef Header_h
#define Header_h


#import <YZDisplayViewController.h>
#import <Masonry.h>
#import <RongIMKit/RongIMKit.h>
#import <RongIMLib/RongIMLib.h>
#import <UIView+Toast.h>
#import <XCKit/NSString+XCString.h>
#import <AFNetworking.h>
#import <IQKeyboardManager.h>


#import "UIView+Extention.h"
#import "ColorHeader.h"
#import "TLTool.h"
#import "TLBaseMainVC.h"
#import "UIImage+ClipARC.h"
#import "TLBaseMainVC.h"
#import "Common.h"
#import "TLRequest.h"
#import "TLInterfaceRequest.h"


#define BaseUrl  @"http://180.76.164.72:8110/group-vc-service-gateway/"

#define URL(url)   [NSString stringWithFormat:@"%@%@",BaseUrl,(url)]


#endif /* Header_h */
