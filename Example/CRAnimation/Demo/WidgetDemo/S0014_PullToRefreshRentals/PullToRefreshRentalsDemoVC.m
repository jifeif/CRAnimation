//
//  PullToRefreshRentalsDemoVC.m
//  CRAnimation
//
//  Created by Bear on 17/4/22.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "PullToRefreshRentalsDemoVC.h"
#import "YALSunnyRefreshControl.h"
#import "PullToRefreshRentalsCell.h"
#import <BearSkill/BearConstants.h>

@interface PullToRefreshRentalsDemoVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) UITableView *mainTableView;
@property (nonatomic,strong) YALSunnyRefreshControl *sunnyRefreshControl;
@property (nonatomic,strong) NSArray *images;
@property (nonatomic,strong) NSArray *colors;

@end

@implementation PullToRefreshRentalsDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTopBarWithTitle:@"PullToRefreshRentals"];
    [self createUI];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self.sunnyRefreshControl beginRefreshing];
}

#pragma mark - Create UI
- (void)createUI
{
    [super createUI];
    
    _images = @[@"S0014_icn_1",
                @"S0014_icn_2",
                @"S0014_icn_3"];
    
    _colors = @[[UIColor orangeColor],
                UIColorFromHEX(0x552D3D),
                UIColorFromHEX(0xEC4C52),
                ];
    
    _mainTableView = [[UITableView alloc] initWithFrame:self.contentView.bounds];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.contentView addSubview:_mainTableView];
    
    [self setupRefreshControl];
}

#pragma mark - SetUp
- (void)setupRefreshControl
{
    self.sunnyRefreshControl = [YALSunnyRefreshControl new];
    [self.sunnyRefreshControl addTarget:self
                                 action:@selector(sunnyControlDidStartAnimation)
                       forControlEvents:UIControlEventValueChanged];
    [self.sunnyRefreshControl attachToScrollView:self.mainTableView];
}

- (void)sunnyControlDidStartAnimation{
    
    __weak typeof(self) weakSelf = self;
    [BearConstants delayAfter:1.0 dealBlock:^{
        [weakSelf.sunnyRefreshControl endRefreshing];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 168;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    PullToRefreshRentalsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[PullToRefreshRentalsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    int index = indexPath.row % 3;
    cell.imageNameStr = _images[index];
    cell.backgroundColor = _colors[index];
    
    return cell;
}

@end
