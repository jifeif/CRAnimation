//
//  CRMembersVC.m
//  CRAnimation
//
//  Created by Bear on 17/2/9.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRMembersVC.h"
#import "CRMembersTableViewCell.h"
#import "CRCardAnimationViewDemoInfoModel.h"

@interface CRMembersVC () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_mainTableView;
    UIView      *_naviBarView;
}

@end

@implementation CRMembersVC

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.ifHideTabBar = [NSNumber numberWithBool:NO];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = color_323341;
    
    [self createNaviBarView];
    [self createTableView];
}

- (void)createNaviBarView
{
    _naviBarView = [[UIView alloc] initWithFrame:CGRectMake(0, STATUS_HEIGHT, WIDTH, NAVIGATIONBAR_HEIGHT)];
    _naviBarView.backgroundColor = color_323341;
    [self.view addSubview:_naviBarView];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"团队成员";
    titleLabel.textColor = [UIColor whiteColor];
    [titleLabel sizeToFit];
    [_naviBarView addSubview:titleLabel];
    [titleLabel BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    CGFloat shareBtn_width = _naviBarView.height;
    UIButton *shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, shareBtn_width, shareBtn_width)];
    [shareBtn setImage:[UIImage imageNamed:@"Nav_btn_share"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [_naviBarView addSubview:shareBtn];
    [shareBtn BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:nil parentRelation:YES distance:10 center:YES];
}

- (void)createTableView
{
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _naviBarView.maxY, WIDTH, HEIGHT - _naviBarView.maxY - TABBAR_HEIGHT)];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.backgroundColor = color_323341;
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_mainTableView];
    
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, YY_6N(50))];
    tableHeaderView.backgroundColor = [UIColor clearColor];
    _mainTableView.tableHeaderView = tableHeaderView;
}


#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}


#pragma mark - dataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    CRMembersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[CRMembersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    CRCardAnimationViewDemoInfoModel *infoModel = [CRCardAnimationViewDemoInfoModel new];
    [cell setDataWithMemberInfoModel:infoModel.authorInfo];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YY_6N(280);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


#pragma mark - BtnEvent

- (void)shareBtnEvent
{
    NSLog(@"--shareBtnEvent");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
