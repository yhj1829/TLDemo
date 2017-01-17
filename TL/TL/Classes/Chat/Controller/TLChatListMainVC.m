//
//  TLChatListMainVC.m
//  TL
//
//  Created by 阳光 on 16/12/29.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLChatListMainVC.h"
#import "TLChatMainVC.h"

@interface TLChatListMainVC ()<RCIMUserInfoDataSource>

@end

@implementation TLChatListMainVC

-(id)init
{
    self=[super init];
    if (self) {
        // 单聊  群组  讨论组
        [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),@(ConversationType_GROUP),@(ConversationType_DISCUSSION)]];

        [self setCollectionConversationType:@[@(ConversationType_PRIVATE)]];
    }
    return self;
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
 即将显示Cell的回调

 @param cell        即将显示的Cell
 @param indexPath   该Cell对应的会话Cell数据模型在数据源中的索引值

 @discussion 您可以在此回调中修改Cell的一些显示属性。
 */
- (void)willDisplayConversationTableCell:(RCConversationBaseCell *)cell
                             atIndexPath:(NSIndexPath *)indexPath
{
    RCConversationModel *model=self.conversationListDataSource[indexPath.row];
    if (model.conversationType==ConversationType_PRIVATE) {
        RCConversationCell *conversationCell=(RCConversationCell *)cell;
        // 修改昵称的字体颜色
        conversationCell.conversationTitle.textColor=[UIColor blueColor];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 会话列表cell的背景颜色
    self.cellBackgroundColor=[UIColor greenColor];

     [[RCIM sharedRCIM]setUserInfoDataSource:self];
}


#pragma mark 点击事件的回调
/*!
 点击会话列表中Cell的回调

 @param conversationModelType   当前点击的会话的Model类型
 @param model                   当前点击的会话的Model
 @param indexPath               当前会话在列表数据源中的索引值

 @discussion 您需要重写此点击事件，跳转到指定会话的聊天界面。
 如果点击聚合Cell进入具体的子会话列表，在跳转时，需要将isEnteredToCollectionViewController设置为YES。
 */
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath
{
    // 聚合显示时
    if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_COLLECTION)
    {
        TLChatListMainVC *chatListMainVC=[TLChatListMainVC new];
        NSArray *arr=[NSArray arrayWithObject:[NSNumber numberWithInt:model.conversationType]];
        [chatListMainVC setDisplayConversationTypes:arr];
        [chatListMainVC setCollectionConversationType:nil];
        chatListMainVC.isEnteredToCollectionViewController=YES;
        [self.navigationController pushViewController:chatListMainVC animated:NO];
    }
    // 单聊时
    else if(model.conversationType==ConversationType_PRIVATE)
    {
        // 聊天界面
        TLChatMainVC *chatMainVC=[TLChatMainVC new];
        chatMainVC.conversationType=model.conversationType;
        chatMainVC.targetId=model.targetId;
        chatMainVC.title=@"测试";
        [self.navigationController pushViewController:chatMainVC animated:NO];
    }
}


@end
