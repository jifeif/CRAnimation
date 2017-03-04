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
#import "CRHomeNaviBarView.h"
#import "CRMemberDetailVC.h"
#import "CRMemberInfoModel.h"

@interface CRMembersVC () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView             *_mainTableView;
    CRHomeNaviBarView       *_naviBarView;
    NSMutableArray          *_memberInfoModelArray;
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
    __weak typeof(self) weakSelf = self;
    _naviBarView = [CRHomeNaviBarView commonNaviBarViewWithTitle:@"团队成员" inVC:weakSelf];
    [self.view addSubview:_naviBarView];
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
#warning Modify 调整成员详情跳转
//    CRMemberDetailVC *destinationVC = [[CRMemberDetailVC alloc] initWithInfoModel:_memberInfoModelArray[indexPath.row]];
//    [self.navigationController pushViewController:destinationVC animated:YES];
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
    
    [cell setDataWithMemberInfoModel:_memberInfoModelArray[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YY_6N(280);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_memberInfoModelArray count];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
