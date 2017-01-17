//
//  TLMyFansDetailInfoVC.m
//  TL
//
//  Created by 阳光 on 16/11/20.
//  Copyright © 2016年 阳光. All rights reserved.
//

#import "TLMyFansDetailInfoVC.h"
#import "TLMyFansDetailInfoDynamicVC.h"
#import "TLMyFansDetailInfoCareVC.h"
#import "SelectView.h"

#import "TLDynamicView.h"
#import "TLCareView.h"
#import "TLInfoView.h"

@interface TLMyFansDetailInfoVC ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *rootScrollView;

@property(nonatomic,assign)CGFloat yOffset;

@property(nonatomic,strong)SelectView *dynamicItem;

@property(nonatomic,strong)SelectView *careItem;

@property(nonatomic,strong)SelectView *infoItem;

@property(nonatomic,strong)TLDynamicView *dynamicView;

@property(nonatomic,strong)TLCareView *careView;

@property(nonatomic,strong)TLInfoView *infoView;

@property(nonatomic,strong)UIView *bottomLine;

@property(nonatomic,strong)UIView *movingLine;

@property(nonatomic,strong)UIView *selectView;

@property(nonatomic,assign)NSInteger index;

@property(nonatomic,assign)CGFloat tableViewH;

@property(nonatomic,assign)CGFloat lastOffset;

@property(nonatomic,strong)UIView *headView;

@end

@implementation TLMyFansDetailInfoVC

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self initData];

    
    
    [self initRootScrollView];
    
   [self createRootScrollView];
    
    [self initHeadView];
    
//    [self initSelectView];
    
}

-(void)initSelectView
{
    _selectView=[[UIView alloc] initWithFrame:CGRectMake(0,200,APPW,45)];
    _selectView.backgroundColor=WhiteColor;
    
    CGFloat selectViewItemWidth=APPW/3;
    CGFloat selectViewItemHeight=30;
    CGSize selectViewItemSize=CGSizeMake(selectViewItemWidth,selectViewItemHeight);
    
    // 她的动态
    _dynamicItem=[[SelectView alloc]initName:@"她的动态" size:selectViewItemSize];
    [_dynamicItem addTarget:self action:@selector(selectEvent:) forControlEvents:UIControlEventTouchUpInside];
    _dynamicItem.tag=0;
    _dynamicItem.nameLabel.textColor=Main_Color;
    [_dynamicItem setOrigin:CGPointMake(0,kmargin/2)];
    [_selectView addSubview:_dynamicItem];
    
    // 她的关注
    _careItem=[[SelectView alloc]initName:@"她的关注" size:selectViewItemSize];
    [_careItem addTarget:self action:@selector(selectEvent:) forControlEvents:UIControlEventTouchUpInside];
    _careItem.tag=1;
    [_careItem setOrigin:CGPointMake(selectViewItemWidth,kmargin/2)];
    [_selectView addSubview:_careItem];
    
    // 个人资料
    _infoItem=[[SelectView alloc]initName:@"个人资料" size:selectViewItemSize];
    [_infoItem addTarget:self action:@selector(selectEvent:) forControlEvents:UIControlEventTouchUpInside];
    _infoItem.tag=2;
    [_infoItem setOrigin:CGPointMake(2*selectViewItemWidth,kmargin/2)];
    [_selectView addSubview:_infoItem];
    
    //划线
    _bottomLine=[TLTool setLineWithWidth:APPW andHeight:1 andColor:MAIN_BACK_COLOR];
    [_bottomLine setOrigin:CGPointMake(0,CGRectGetHeight(_selectView.frame)-1)];
    [_selectView addSubview:_bottomLine];
    
    //创建移动下划线
    _movingLine=[TLTool setLineWithWidth:(APPW/3-kmargin*2) andHeight:1 andColor:Main_Color];
    _movingLine.center=CGPointMake(_dynamicItem.centerX,0);
    [_bottomLine addSubview:_movingLine];
    
    [_headView addSubview:_selectView];
    
}

- (void)selectEvent:(SelectView *)sender
{
    _index = sender.tag;
    [self moveLine:_index];
    
    if ([_dynamicItem isEqual:sender]) {
        
        [self changeItemTintColor:(SelectView *)sender];
        [_rootScrollView setContentOffset:CGPointMake(0,0) animated:NO];
        _dynamicItem.nameLabel.textColor=Main_Color;
        _careItem.selected = NO;
        _infoItem.selected = NO;
        
    }else if ([_careItem isEqual:sender]){
        
        [self changeItemTintColor:(SelectView *)sender];
        [_rootScrollView setContentOffset:CGPointMake(APPW,0) animated:NO];
        _careItem.nameLabel.textColor=Main_Color;
        _dynamicItem.selected = NO;
        _infoItem.selected = NO;
        
    }else if ([_infoItem isEqual:sender]){
        
        [self changeItemTintColor:(SelectView *)sender];
        [_rootScrollView setContentOffset:CGPointMake(APPW*2,0) animated:NO];
        _infoItem.nameLabel.textColor=Main_Color;
        _dynamicItem.selected = NO;
        _careItem.selected = NO;
    }
}


-(void)moveLine:(NSInteger)sender
{
    CGFloat lineX;
    if (sender == 0) {
        lineX = _dynamicItem.centerX;
    }else if (sender == 1){
        lineX = _careItem.centerX;
    }else{
        lineX = _infoItem.centerX;
    }
    [UIView animateWithDuration:0.2 animations:^{
        
        _movingLine.center = CGPointMake(lineX,0);
    }];
}

-(void)changeItemTintColor:(SelectView *)sender
{
    if (![_dynamicItem isEqual:sender]) {
        
        _dynamicItem.nameLabel.textColor=Color666666;
        
    }
    if (![_careItem isEqual:sender]){
        
        _careItem.nameLabel.textColor=Color666666;
    }
    if (![_infoItem isEqual:sender]){
        
        _infoItem.nameLabel.textColor=Color666666;
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if ([scrollView isEqual:_rootScrollView]) {
        _index = _rootScrollView.bounds.origin.x/_rootScrollView.bounds.size.width;
        [self moveLine:_index];
        return;
    }
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (scrollView.contentOffset.y >200+45)
    {
        _headView.center=CGPointMake(_headView.center.x,_yOffset-200+kmargin);
//        _backBtn.hidden=YES;
        return;
    }
    CGFloat h= _yOffset-offsetY;
    _headView.center=CGPointMake(_headView.center.x,h);
//    _backBtn.hidden=NO;
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    if ([scrollView isEqual:_rootScrollView]) {
        
        if (_index == 0) {
            [self selectEvent:_dynamicItem];
        }else if (_index == 1){
            [self selectEvent:_careItem];
        }else if (_index == 2){
            [self selectEvent:_infoItem];
        }
        return;
    }
    
    [self setTableViewContentOffsetWithTag:scrollView.tag contentOffset:scrollView.contentOffset.y];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if ([scrollView isEqual:_rootScrollView])
    {
        return;
    }
    [self setTableViewContentOffsetWithTag:scrollView.tag contentOffset:scrollView.contentOffset.y];
}

//设置tableView的偏移量
-(void)setTableViewContentOffsetWithTag:(NSInteger)tag contentOffset:(CGFloat)offset
{
    CGFloat tableViewOffset=offset;
    if(offset>200)
    {
        tableViewOffset=200;
    }
    if (tag==100)
    {
        [_careView.tableView setContentOffset:CGPointMake(0,tableViewOffset) animated:NO];
        [_infoView.tableView setContentOffset:CGPointMake(0,tableViewOffset) animated:NO];
    }
    else if(tag==101)
    {
        
        [_dynamicView.tableView setContentOffset:CGPointMake(0,tableViewOffset) animated:NO];
        [_infoView.tableView setContentOffset:CGPointMake(0,tableViewOffset) animated:NO];
    }
    else
    {
        [_dynamicView.tableView setContentOffset:CGPointMake(0,tableViewOffset) animated:NO];
        [_careView.tableView setContentOffset:CGPointMake(0,tableViewOffset) animated:NO];
    }
}



-(void)setTableHeaderView:(UITableView *)tableView
{
    UIView *tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0,0,APPW,200+45)];
    tableView.showsVerticalScrollIndicator=NO;
    tableView.tableHeaderView=tableHeaderView;
    tableView.backgroundColor=MAIN_BACK_COLOR;
}


-(void)createRootScrollView
{
    // 她的动态
    _dynamicView=[[TLDynamicView alloc]initWithFrame:CGRectMake(0,0,APPW,APPH)];
    _dynamicView.tableView.tag=100;
    _dynamicView.tableView.delegate=self;
    [self setTableHeaderView:_dynamicView.tableView];
    [_rootScrollView addSubview:_dynamicView];
    
    
    // 她的关注
    _careView=[[TLCareView alloc]initWithFrame:CGRectMake(APPW,0,APPW,APPH)];
    _careView.tableView.tag=101;
    _careView.tableView.delegate=self;
    [self setTableHeaderView:_careView.tableView];
    [_rootScrollView addSubview:_careView];
    
    // 个人资料
    _infoView=[[TLInfoView alloc]initWithFrame:CGRectMake(APPW*2,0,APPW, APPH)];
    _infoView.tableView.tag = 102;
    _infoView.tableView.delegate = self;
    [self setTableHeaderView:_infoView.tableView];
    [_rootScrollView addSubview:_infoView];
}

-(void)initHeadView
{
    _headView=[[UIView alloc]initWithFrame:CGRectMake(0,0,APPW,200+45)];
    _headView.backgroundColor=WhiteColor;
    _yOffset=_headView.centerY;
    
    [self initSelectView];
    
    [self.view addSubview:_headView];
    
}

-(void)initRootScrollView
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _rootScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,APPW,APPH)];
    _rootScrollView.delegate=self;
    
    _rootScrollView.contentSize=CGSizeMake(3*APPW,APPH);
    _rootScrollView.scrollEnabled=NO;
    _rootScrollView.alwaysBounceVertical=NO;
    _rootScrollView.bounces=NO;
    _rootScrollView.showsVerticalScrollIndicator=NO;
    _rootScrollView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:_rootScrollView];
}

-(void)initData
{
   self.title=@"粉丝资料";
}

@end
