//
//  CRProductionShowDetailManager.m
//  CRAnimation
//
//  Created by Bear on 17/2/7.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRProductionShowDetailManager.h"
#import "CRProductionDetailView.h"
#import "CRDemoInfoModel.h"
#import "CRBaseViewController.h"

typedef enum {
    kProductionDetailViewStatus_Idle,
    kProductionDetailViewStatus_AlreadyShow,
    kProductionDetailViewStatus_AlreadyFade,
}ProductionDetailViewStatus;

@interface CRProductionShowDetailManager ()

@property (strong, nonatomic) CRBaseViewController          *inVC;
@property (strong, nonatomic) CRDemoInfoModel               *demoInfoModel;
@property (strong, nonatomic) UIView                        *maskBgView;
@property (strong, nonatomic) UIView                        *detailContentView;
@property (strong, nonatomic) CRProductionDetailView        *detailView;
@property (strong, nonatomic) UIButton                      *closeBtn;
@property (assign, nonatomic) ProductionDetailViewStatus    viewStatus;

@end

@implementation CRProductionShowDetailManager

+ (CRProductionShowDetailManager *)commonManager
{
    CRProductionShowDetailManager *manager = [[CRProductionShowDetailManager alloc] init];
    return manager;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _viewStatus = kProductionDetailViewStatus_Idle;
    }
    
    return self;
}

- (void)loadUI
{
    [self createMaskBgView];
    [self createDetailView];
}

- (void)createMaskBgView
{
    if (!_maskBgView && _inVC) {
        _maskBgView = [[UIView alloc] initWithFrame:_inVC.view.bounds];
        _maskBgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }
}

- (void)createDetailView
{
    if (!_detailContentView) {
        _detailContentView = [[UIView alloc] initWithFrame:_maskBgView.bounds];
        [_maskBgView addSubview:_detailContentView];
    }
    
    if (!_detailView && _demoInfoModel) {
        _detailView = [CRProductionDetailView commonDetailViewWithInfoModel:_demoInfoModel inVC:_inVC];
        [_detailContentView addSubview:_detailView];
        [_detailView setMaxX:_detailContentView.width];
    }
    
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, YY_6N(56), 40, 40)];
        [_closeBtn setImage:[UIImage imageNamed:@"animation_btn_withdraw"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(fadeDetailView) forControlEvents:UIControlEventTouchUpInside];
        [_detailContentView addSubview:_closeBtn];
        [_closeBtn setMaxX:_detailView.x - XX_6N(24)];
    }
}

- (void)showDetailView
{
    __weak typeof(self) weakSelf = self;
    
    BOOL enableShow = (_viewStatus == kProductionDetailViewStatus_Idle) || (_viewStatus == kProductionDetailViewStatus_AlreadyFade);
    if (!enableShow) {
        return;
    }
    
    _maskBgView.alpha = 0;
    [_inVC.view addSubview:_maskBgView];
    
    [_detailContentView setX:_maskBgView.width];
    
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.maskBgView.alpha = 1;
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 animations:^{
            [weakSelf.detailContentView setX:0];
        }completion:^(BOOL finished) {
            weakSelf.viewStatus = kProductionDetailViewStatus_AlreadyShow;
        }];
    }];
}

- (void)fadeDetailView
{
    __weak typeof(self) weakSelf = self;
    
    BOOL enableShow = (_viewStatus == kProductionDetailViewStatus_AlreadyShow);
    if (!enableShow) {
        return;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        [weakSelf.detailContentView setX:_maskBgView.width];
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.maskBgView.alpha = 0;
        }completion:^(BOOL finished) {
            [_maskBgView removeFromSuperview];
            weakSelf.viewStatus = kProductionDetailViewStatus_AlreadyFade;
        }];
    }];
}

#pragma mark - Set Data
- (void)setParaWithInVC:(__weak CRBaseViewController *)inVC
       AndDemoInfoModel:(CRDemoInfoModel *)demoInfoModel
{
    _inVC = inVC;
    _demoInfoModel = demoInfoModel;
}

@end
