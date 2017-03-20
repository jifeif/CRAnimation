//
//  CRProductionBaseVC.m
//  CRAnimation
//
//  Created by Bear on 17/2/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRProductionBaseVC.h"
#import "CRProductionShowDetailManager.h"
#import "CRDemoInfoModel.h"

@interface CRProductionBaseVC ()
{
    UIButton    *_shareBtn;
    UIButton    *_detailsBtn;
    CRProductionShowDetailManager   *_showDetailManager;
}

@end

@implementation CRProductionBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _backBtnColor = [UIColor whiteColor];
}


#pragma mark - createUI

- (void)createUI
{
    [super createUI];
    [self addTopBarWithTitle:self.demoInfoModel.demoName];
    [self createContentView];
}

- (void)addTopBarWithTitle:(NSString *)title
{
    [self createTopBarViewWithTitle:title];
    //[self createShareBtn];
    [self createDetailsBtn];
    
    [self relayTopBarContentsUI];
}

- (void)createTopBarViewWithTitle:(NSString *)title
{
    if (!_customNaviBarView) {
        _customNaviBarView = [CRNavigationBarView new];
        [_customNaviBarView setNaviBarWithTitle:title];
        [_customNaviBarView.backBtn setTintColor:_backBtnColor];
        [_customNaviBarView.backBtn addTarget:self action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
        _customNaviBarView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_customNaviBarView];
    }
}

- (void)createContentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, _customNaviBarView.maxY, WIDTH, HEIGHT - _customNaviBarView.maxY)];
        [self.view addSubview:_contentView];
    }
}

- (void)createShareBtn
{
    if (!_shareBtn) {
        _shareBtn = [UIButton new];
        [_shareBtn setImage:[UIImage imageNamed:@"nav_btn_share1"] forState:UIControlStateNormal];
        [_shareBtn sizeToFit];
        [_shareBtn addTarget:self action:@selector(shareBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [_customNaviBarView addSubview:_shareBtn];
    }
}

- (void)createDetailsBtn
{
    if (!_detailsBtn) {
        _detailsBtn = [UIButton new];
        [_detailsBtn setImage:[UIImage imageNamed:@"nav_btn_details"] forState:UIControlStateNormal];
        [_detailsBtn sizeToFit];
        [_detailsBtn addTarget:self action:@selector(detailBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [_customNaviBarView addSubview:_detailsBtn];
    }
}


#pragma mark - relayUI

- (void)relayTopBarContentsUI
{
    [_customNaviBarView.backBtn BearSetRelativeLayoutWithDirection:kDIR_LEFT destinationView:nil parentRelation:YES distance:CR_OFF_STARTX center:YES];
    [_detailsBtn BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:nil parentRelation:YES distance:CR_OFF_STARTX center:YES];
    //[_shareBtn BearSetRelativeLayoutWithDirection:kDIR_LEFT destinationView:_detailsBtn parentRelation:NO distance:CR_OFF_ENDX center:YES];
    
    CGFloat titleLabelOffX = _customNaviBarView.width - _shareBtn.x;
    CGFloat titleLabelWidth = _customNaviBarView.width - 2 * titleLabelOffX;
    [_customNaviBarView.productionTitleLabel sizeToFit];
    [_customNaviBarView.productionTitleLabel setWidth:titleLabelWidth];
    [_customNaviBarView.productionTitleLabel BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}


#pragma mark - BtnEvent

- (void)popSelf
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)shareBtnEvent
{
    NSLog(@"--shareBtnEvent");
}

- (void)detailBtnEvent
{
    __weak typeof(self) weakSelf = self;
    
    if (!_showDetailManager && _demoInfoModel) {
        _showDetailManager = [CRProductionShowDetailManager commonManager];
        [_showDetailManager setParaWithInVC:weakSelf AndDemoInfoModel:_demoInfoModel];
        [_showDetailManager loadUI];
    }
    
    [_showDetailManager showDetailView];
}

#pragma mark - Set CRDemoInfoModel
- (void)setDemoInfoModel:(CRDemoInfoModel *)demoInfoModel
{
    _demoInfoModel = demoInfoModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
