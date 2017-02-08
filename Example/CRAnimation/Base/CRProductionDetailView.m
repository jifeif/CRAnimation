//
//  CRProductionDetailView.m
//  CRAnimation
//
//  Created by Bear on 17/2/6.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRProductionDetailView.h"

@interface CRProductionDetailView ()
{
    CRDemoInfoModel         *_infoModel;
    UIScrollView            *_mainScrollView;
    UIView                  *_topView;
    UIView                  *_bodyView;
}

@end

@implementation CRProductionDetailView

+ (CRProductionDetailView *)commonDetailViewWithInfoModel:(CRDemoInfoModel *)infoModel
{
    CRProductionDetailView *detailView = [[CRProductionDetailView alloc] initWithFrame:CGRectMake(0, 0, XX_6N(544), HEIGHT)
                                                                             infoModel:infoModel];
    return detailView;
}

- (instancetype)initWithFrame:(CGRect)frame
                    infoModel:(CRDemoInfoModel *)infoModel
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _infoModel = infoModel;
        [self createUI];
    }
    
    return self;
}

- (void)createUI
{
    self.backgroundColor = [UIColor clearColor];
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _mainScrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:_mainScrollView];
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _mainScrollView.width, YY_6N(236))];
    _topView.backgroundColor = [color_323341 colorWithAlphaComponent:0.95];
    [_mainScrollView addSubview:_topView];
}


@end
