//
//  TLRequest.m
//  TL
//
//  Created by 阳光 on 17/1/17.
//  Copyright © 2017年 阳光. All rights reserved.
//

#import "TLRequest.h"

@implementation TLRequest

+(instancetype)shareInstance
{
    static TLRequest *request=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request=[[TLRequest alloc]init];
    });
    return request;
}


// POST
+(void)PostCallBack:(NSString *)url parameter:(NSDictionary *)paramDic success:(SuccessResult)success failure:(FailureResult)failure
{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"application/json", nil];
    NSLog(@"geturl666 :%@",url);
    NSLog(@"paramDic666 :%@",paramDic);

    [manager POST:url parameters:paramDic progress:^(NSProgress * _Nonnull uploadProgress)
     {


     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

         NSLog(@"responseObject666 :%@",responseObject);

//         if ([responseObject[@"status"]  isEqualToString:@"403"])
//         {
//
//             [[[Request alloc] init] gotoAlertMessageBy:@"您的帐号在其他设备登录"];
//             [[[Request alloc] init] gotoLoginAction];
//             return;
//
//         }
//         else if ([responseObject[@"status"]  isEqualToString:@"404"])
//         {
//
//             [[[Request alloc] init] gotoAlertMessageBy:responseObject[@"message"]];
//             return;
//         }

         success(responseObject);

     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

         NSLog(@"sdjhdshhds33--%@",error);
//
//         if (error!=nil)
//         {
//             [[[Request alloc] init] gotoAlertMessageBy:@"服务器开小差了"];
//             failure(error);
//         }
     }];
    
}


@end
