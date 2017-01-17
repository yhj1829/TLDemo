//
//  TLChatMainVC.m
//  TL
//
//  Created by 阳光 on 16/12/29.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLChatMainVC.h"

@interface TLChatMainVC ()<RCIMUserInfoDataSource>

@end

@implementation TLChatMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 设置背景颜色
//    self.conversationMessageCollectionView.backgroundColor=[UIColor orangeColor];

//    self.conversationMessageCollectionView.backgroundColor=[UIColor clearColor];

    // 设置背景图
//    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"ready"]];

     [[RCIM sharedRCIM]setUserInfoDataSource:self];

}


/*!
 获取用户信息

 @param userId      用户ID
 @param completion  获取用户信息完成之后需要执行的Block [userInfo:该用户ID对应的用户信息]

 @discussion SDK通过此方法获取用户信息并显示，请在completion中返回该用户ID对应的用户信息。
 在您设置了用户信息提供者之后，SDK在需要显示用户信息的时候，会调用此方法，向您请求用户信息用于显示。
 */
- (void)getUserInfoWithUserId:(NSString *)userId
                   completion:(void (^)(RCUserInfo *userInfo))completion
{

    if ([userId isEqualToString:@"test2"]) {
        RCUserInfo *userInfo=[RCUserInfo new];
        userInfo.userId=userId;
        userInfo.name=@"测试嘛";
        userInfo.portraitUri=@"http://img1.3lian.com/2015/w7/98/d/22.jpg";
        return completion(userInfo);
    }
    else  if ([userId isEqualToString:@"test1"])
    {
        RCUserInfo *userInfo=[RCUserInfo new];
        userInfo.userId=userId;
        userInfo.name=@"你是谁?";
        userInfo.portraitUri=@"http://pic10.nipic.com/20101103/5063545_000227976000_2.jpg";
        return completion(userInfo);
    }
    return completion(nil);
}


/*!
 即将显示消息Cell的回调

 @param cell        消息Cell
 @param indexPath   该Cell对应的消息Cell数据模型在数据源中的索引值

 @discussion 您可以在此回调中修改Cell的显示和某些属性。
 */
- (void)willDisplayMessageCell:(RCMessageBaseCell *)cell
                   atIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isMemberOfClass:[RCTextMessageCell class]])
    {
        RCTextMessageCell *textMessageCell=(RCTextMessageCell *)cell;
        UILabel *textMsgLabel=(UILabel *)textMessageCell.textLabel;
        textMsgLabel.textColor=[UIColor greenColor];  // 修改字体颜色
    }
}


@end
