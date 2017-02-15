//
//  CRHomeNaviBarView.h
//  CRAnimation
//
//  Created by Bear on 17/2/15.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRCustomNaviBarView.h"

@interface CRHomeNaviBarView : CRCustomNaviBarView

+ (CRHomeNaviBarView *)commonNaviBarViewWithTitle:(NSString *)title inVC:(__weak CRBaseViewController *)inVC;

@end
