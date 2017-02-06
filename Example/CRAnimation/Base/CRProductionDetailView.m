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
    }
    
    return self;
}



@end
