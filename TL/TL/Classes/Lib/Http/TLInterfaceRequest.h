//
//  TLInterfaceRequest.h
//  TL
//
//  Created by 阳光 on 17/1/17.
//  Copyright © 2017年 阳光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLInterfaceRequest : NSObject

// 获取验证码
+(void)GetCodeWithDic:(NSDictionary *)dic Success:(void (^)(id))success
                        failure:(void (^)(id))failure;

@end
