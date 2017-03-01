//
//  CRProductionShowDetailManager.h
//  CRAnimation
//
//  Created by Bear on 17/2/7.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CRDemoInfoModel, CRBaseViewController;

@interface CRProductionShowDetailManager : NSObject

+ (CRProductionShowDetailManager *)commonManager;

- (void)setParaWithInVC:(__weak CRBaseViewController *)inVC
       AndDemoInfoModel:(CRDemoInfoModel *)demoInfoModel;
- (void)loadUI;

- (void)showDetailView;
- (void)fadeDetailView;

@end
