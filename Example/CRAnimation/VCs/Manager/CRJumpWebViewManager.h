//
//  CRJumpWebViewManager.h
//  CRAnimation
//
//  Created by Bear on 17/3/14.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CRBaseViewController;

@interface CRJumpWebViewManager : NSObject

+ (void)jumpToUrlStr:(NSString *)urlStr inVC:(__weak CRBaseViewController*)inVC;

@end
