//
//  CRJHUDDemoVC.m
//  CRAnimation
//
//  Created by Bear on 17/3/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRJHUDDemoVC.h"
#import "DetailViewController.h"

@interface CRJHUDDemoVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray  *datas;

@end

@implementation CRJHUDDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    [self addTopBarWithTitle:@"JHUD"];
}

- (void)createUI
{
    [super createUI];
    
    self.datas = @[@"circleAnimation",
                   @"circleJoinAnimation",
                   @"dotAnimation",
                   @"customAnimation",
                   @"gifAnimations",
                   @"failure",
                   @"failure2",
                   @"classMethod",
                   ];
    self.tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.contentView addSubview:self.tableView];
    
    [self.tableView reloadData];
}

#pragma mark  --  <UITableViewDelegate,UITableViewDataSource>

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"JHUD";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _datas[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    DetailViewController * detailVC = [DetailViewController new];
    detailVC.selName = _datas[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
