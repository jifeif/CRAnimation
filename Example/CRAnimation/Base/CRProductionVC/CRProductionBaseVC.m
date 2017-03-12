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
    UIButton    *_backBtn;
    UIButton    *_shareBtn;
    UIButton    *_detailsBtn;
    UILabel     *_productionTitleLabel;
    UIView      *_topBarView;
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
    [self createTopBarView];
    [self createTitleLabelWithTitle:title];
    [self createBackBtn];
    [self createShareBtn];
    [self createDetailsBtn];
    
    [self relayTopBarContentsUI];
}

- (void)createTopBarView
{
    if (!_topBarView) {
        _topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, STATUS_HEIGHT, WIDTH, 40)];
        _topBarView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_topBarView];
    }
}

- (void)createContentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, _topBarView.maxY, WIDTH, HEIGHT - _topBarView.maxY)];
        [self.view addSubview:_contentView];
    }
}

- (void)createTitleLabelWithTitle:(NSString *)title
{
    if (!title) {
        title = @"";
    }
    if (!_productionTitleLabel) {
        _productionTitleLabel = [UILabel new];
        _productionTitleLabel.textColor = [UIColor whiteColor];
        _productionTitleLabel.font = FontSize_6(18);
        _productionTitleLabel.textAlignment = NSTextAlignmentCenter;
        [_topBarView addSubview:_productionTitleLabel];
    }
    _productionTitleLabel.text = title;
}

- (void)createBackBtn
{
    if (!_backBtn) {
        
        UIImage *backImage = [[UIImage imageNamed:@"nav_btn_close"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:backImage forState:UIControlStateNormal];
        [_backBtn setTintColor:_backBtnColor];
        [_backBtn sizeToFit];
        [_backBtn addTarget:self action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
        [_topBarView addSubview:_backBtn];
    }
}

- (void)createShareBtn
{
    if (!_shareBtn) {
        _shareBtn = [UIButton new];
        [_shareBtn setImage:[UIImage imageNamed:@"nav_btn_share1"] forState:UIControlStateNormal];
        [_shareBtn sizeToFit];
        [_shareBtn addTarget:self action:@selector(shareBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [_topBarView addSubview:_shareBtn];
    }
}

- (void)createDetailsBtn
{
    if (!_detailsBtn) {
        _detailsBtn = [UIButton new];
        [_detailsBtn setImage:[UIImage imageNamed:@"nav_btn_details"] forState:UIControlStateNormal];
        [_detailsBtn sizeToFit];
        [_detailsBtn addTarget:self action:@selector(detailBtnEvent) forControlEvents:UIControlEventTouchUpInside];
        [_topBarView addSubview:_detailsBtn];
    }
}


#pragma mark - relayUI

- (void)relayTopBarContentsUI
{
    [_backBtn BearSetRelativeLayoutWithDirection:kDIR_LEFT destinationView:nil parentRelation:YES distance:CR_OFF_STARTX center:YES];
    [_detailsBtn BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:nil parentRelation:YES distance:CR_OFF_STARTX center:YES];
    [_shareBtn BearSetRelativeLayoutWithDirection:kDIR_LEFT destinationView:_detailsBtn parentRelation:NO distance:CR_OFF_ENDX center:YES];
    
    CGFloat titleLabelOffX = _topBarView.width - _shareBtn.x;
    CGFloat titleLabelWidth = _topBarView.width - 2 * titleLabelOffX;
    [_productionTitleLabel sizeToFit];
    [_productionTitleLabel setWidth:titleLabelWidth];
    [_productionTitleLabel BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
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
