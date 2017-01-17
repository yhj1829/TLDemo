//
//  TLInterfaceRequest.m
//  TL
//
//  Created by 阳光 on 17/1/17.
//  Copyright © 2017年 阳光. All rights reserved.
//

#import "TLInterfaceRequest.h"

// http://180.76.164.72:8110/group-vc-service-gateway/user/getMsg

@implementation TLInterfaceRequest

// 获取验证码
+(void)GetCodeWithDic:(NSDictionary *)dic Success:(void (^)(id))success
              failure:(void (^)(id))failure
{
    [TLRequest PostCallBack:URL(@"user/getMsg") parameter:dic success:^(id responseObj){

        NSLog(@"sdjkjsdjds--%@",responseObj);
        
        if ([responseObj[@"status"] isEqualToString:@"0"])
        {
            success(responseObj);
        }
        else
        {
//            [self getAppDelegateByErrorMessage:responseObj[@"message"]];
        }

    } failure:^(NSError *error)
     {

     }];

}

@end
