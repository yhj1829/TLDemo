//
//  TLLiveRecentMainVC.m
//  TL
//
//  Created by 阳光 on 16/11/22.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLLiveRecentMainVC.h"

#import "TLLiveBaseCollectionViewCell.h"

static NSString *TLLiveBaseCollectionViewCellIdentifier
=@"TLLiveBaseCollectionViewCellIdentifier";

@interface TLLiveRecentMainVC ()< UICollectionViewDataSource,UICollectionViewDelegate , UICollectionViewDelegateFlowLayout >

@end


@implementation TLLiveRecentMainVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initCollectionView];
}


-( void )initCollectionView
{
    
    //先实例化一个层
    UICollectionViewFlowLayout *layout=[UICollectionViewFlowLayout new];
    // 创建一屏的视图大小
    UICollectionView *collectionView=[[ UICollectionView alloc ] initWithFrame:CGRectMake(0,0,APPW,APPH-64-49) collectionViewLayout:layout];
    [collectionView registerClass:[TLLiveBaseCollectionViewCell class ] forCellWithReuseIdentifier:TLLiveBaseCollectionViewCellIdentifier];
    collectionView.backgroundColor=MAIN_BACK_COLOR;
    collectionView.showsVerticalScrollIndicator=NO;
    collectionView.delegate=self;
    collectionView.dataSource=self ;
    [self.view addSubview :collectionView];
    
}

// 定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

// 定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// 每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TLLiveBaseCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:TLLiveBaseCollectionViewCellIdentifier forIndexPath:indexPath];
    //     cell.backgroundColor=Main_Color;
    return cell;
}

#pragma mark --UICollectionViewDelegate
// UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=(UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor=[UIColor colorWithRed:((arc4random()%255)/255) green:((arc4random()%255)/255) blue:((arc4random()%255)/255) alpha:1];
}

// 返回这个UICollectionViewCell是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark --UICollectionViewDelegateFlowLayout
// 定义每个UICollectionView 的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((APPW-kmargin*3)/2,200);
}

// 定义每个UICollectionView 的边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kmargin/2,kmargin,kmargin,kmargin);
}


@end
