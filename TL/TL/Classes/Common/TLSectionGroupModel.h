//
//  TLSectionGroupModel.h
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLSectionGroupModel : NSObject

// 分组名称
@property(nonatomic,copy)NSString *name;

// 分组数组
@property(nonatomic,strong)NSArray *sectionArr;

// 点击展开或者关闭状态
@property(nonatomic,assign)BOOL isOpen;

@end
