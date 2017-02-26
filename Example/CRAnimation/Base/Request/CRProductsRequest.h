//
//  CRProductsRequest.h
//  CRAnimation
//
//  Created by Bear on 17/2/26.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseRequestManager.h"

@interface CRProductsRequest : CRBaseRequestManager

+ (void)reuestProductsWithParaDict:(NSDictionary *)paraDict
                           success:(void (^) ())success
                           failure:(void (^) ())failure;

@end
