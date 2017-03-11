//
//  CRJumpManager.m
//  CRAnimation
//
//  Created by Bear on 17/2/18.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRJumpManager.h"
#import "CRBaseViewController.h"
#import "CRDemoInfoModel.h"
#import "CRProductionBaseVC.h"
#import "CRDesignProductionBaseVC.h"

@interface CRJumpManager ()
{
    CRBaseViewController *_inVC;
}

@end

@implementation CRJumpManager

+ (CRJumpManager *)commonManagerInVC:(__weak CRBaseViewController *)inVC
{
    CRJumpManager *manager = [[CRJumpManager alloc] initInVC:inVC];
    return manager;
}

- (instancetype)initInVC:(__weak CRBaseViewController *)inVC
{
    self = [super init];
    
    if (self) {
        _inVC = inVC;
    }
    
    return self;
}

- (void)jumpToProductDetailVCWithDemoInfoModel:(CRDemoInfoModel *)demoInfoModel
{
    //  设计师显示界面
    if (demoInfoModel.demoType == kCRDemoTypeDesigner) {
        CRDesignProductionBaseVC *destinationVC = [CRDesignProductionBaseVC new];
        [destinationVC setDemoInfoModel:demoInfoModel];
        [_inVC.navigationController pushViewController:destinationVC animated:YES];
    }
    //  开发者显示界面
    else{
        id idVC = [[NSClassFromString(demoInfoModel.demoVCName) alloc] init];
        if ([idVC isKindOfClass:[CRProductionBaseVC class]]) {
            CRProductionBaseVC *destinationVC = (CRProductionBaseVC *)idVC;
            [destinationVC setDemoInfoModel:demoInfoModel];
            [_inVC.navigationController pushViewController:destinationVC animated:YES];
        }
    }
}

@end
