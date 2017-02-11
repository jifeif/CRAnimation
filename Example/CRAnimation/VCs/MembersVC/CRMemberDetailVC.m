//
//  CRMemberDetailVC.m
//  CRAnimation
//
//  Created by Bear on 17/2/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRMemberDetailVC.h"
#import "CRCustomNaviBarView.h"
#import "CRMemberDetailHeadView.h"

@interface CRMemberDetailVC ()
{
    CRCustomNaviBarView     *_naviBarView;
    CRMemberDetailHeadView  *_detailHeadView;
    CRMemberInfoModel       *_memberInfoModel;
}

@end

@implementation CRMemberDetailVC

- (instancetype)initWithInfoModel:(CRMemberInfoModel *)model
{
    self = [super init];
    
    if (self) {
        _memberInfoModel = model;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = color_323341;
    
    __weak typeof(self) weakSelf = self;
    _naviBarView = [CRCustomNaviBarView commonNaviBarViewWithTitle:@"个人详情" inVC:weakSelf];
    [self.view addSubview:_naviBarView];
    
    _detailHeadView = [CRMemberDetailHeadView commonHeadView];
    [_detailHeadView setDataWithMemberInfoModel:_memberInfoModel];
    [self.view addSubview:_detailHeadView];
    [self.view bringSubviewToFront:_naviBarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
