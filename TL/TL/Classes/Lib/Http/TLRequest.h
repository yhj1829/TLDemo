//
//  TLRequest.h
//  TL
//
//  Created by 阳光 on 17/1/17.
//  Copyright © 2017年 阳光. All rights reserved.
//

#import <Foundation/Foundation.h>

// 成功回调
typedef void(^SuccessResult)(id responseObj);

// 失败回调
typedef void(^FailureResult)(NSError *error);

@interface TLRequest : NSObject

+(instancetype)shareInstance;

// POST
+(void)PostCallBack:(NSString *)url parameter:(NSDictionary *)paramDic success:(SuccessResult)success failure:(FailureResult)failure;

@end
