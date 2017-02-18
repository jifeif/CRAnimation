//
//  CRProductionDetailView.h
//  CRAnimation
//
//  Created by Bear on 17/2/6.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRDemoInfoModel.h"
@class CRBaseViewController;

@interface CRProductionDetailView : UIView

+ (CRProductionDetailView *)commonDetailViewWithInfoModel:(CRDemoInfoModel *)infoModel
                                                     inVC:(__weak CRBaseViewController *)inVC;

@end
