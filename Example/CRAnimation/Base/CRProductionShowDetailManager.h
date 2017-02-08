//
//  CRProductionShowDetailManager.h
//  CRAnimation
//
//  Created by Bear on 17/2/7.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRBaseViewController.h"

@interface CRProductionShowDetailManager : NSObject

+ (CRProductionShowDetailManager *)commonManagerInVC:(__weak CRBaseViewController *)inVC;

- (void)showDetailView;
- (void)fadeDetailView;

@end
