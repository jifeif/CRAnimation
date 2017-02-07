//
//  CRProductionShowDetailManager.m
//  CRAnimation
//
//  Created by Bear on 17/2/7.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRProductionShowDetailManager.h"
#import "CRProductionDetailView.h"

#warning Test
#import "CRCardAnimationViewDemoInfoModel.h"

@interface CRProductionShowDetailManager ()

@property (strong, nonatomic) CRBaseViewController    *inVC;
@property (strong, nonatomic) UIView                  *maskBgView;
@property (strong, nonatomic) CRProductionDetailView  *detailView;

@end

@implementation CRProductionShowDetailManager

+ (CRProductionShowDetailManager *)commonManagerInVC:(__weak CRBaseViewController *)inVC
{
    CRProductionShowDetailManager *manager = [[CRProductionShowDetailManager alloc] initInVC:inVC];
    return manager;
}

- (instancetype)initInVC:(__weak CRBaseViewController *)inVC
{
    self = [super init];
    
    if (self) {
        _inVC = inVC;
        [self createMaskBgView];
        [self createDetailView];
    }
    
    return self;
}

- (void)createMaskBgView
{
    if (!_maskBgView) {
        _maskBgView = [[UIView alloc] initWithFrame:_inVC.view.bounds];
        _maskBgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }
}

- (void)createDetailView
{
    if (!_detailView) {
        
        CRCardAnimationViewDemoInfoModel *tempModel = [CRCardAnimationViewDemoInfoModel new];
        _detailView = [CRProductionDetailView commonDetailViewWithInfoModel:tempModel];
        _detailView.backgroundColor = [UIColor orangeColor];
    }
}

- (void)showDetailView
{
    __weak typeof(self) weakSelf = self;
    
    [_maskBgView removeFromSuperview];
    _maskBgView.alpha = 0;
    [_inVC.view addSubview:_maskBgView];
    
    [_detailView removeFromSuperview];
    [_maskBgView addSubview:_detailView];
    [_detailView setX:_maskBgView.width];
    
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.maskBgView.alpha = 1;
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 animations:^{
            [weakSelf.detailView setMaxX:_maskBgView.width];
        }];
    }];
}


@end
