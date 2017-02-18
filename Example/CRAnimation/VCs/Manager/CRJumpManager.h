//
//  CRJumpManager.h
//  CRAnimation
//
//  Created by Bear on 17/2/18.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CRBaseViewController, CRDemoInfoModel, CRJumpManager;

@interface CRJumpManager : NSObject

+ (CRJumpManager *)commonManagerInVC:(__weak CRBaseViewController *)inVC;
- (void)jumpToProductDetailVCWithDemoInfoModel:(CRDemoInfoModel *)demoInfoModel;

@end
