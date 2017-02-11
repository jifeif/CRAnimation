//
//  CRMembersVC.m
//  CRAnimation
//
//  Created by Bear on 17/2/9.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRMembersVC.h"
#import "CRMembersTableViewCell.h"

@interface CRMembersVC () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_mainTableView;
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
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    [self.view addSubview:_mainTableView];
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
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
