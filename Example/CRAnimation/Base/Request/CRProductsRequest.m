//
//  CRProductsRequest.m
//  CRAnimation
//
//  Created by Bear on 17/2/26.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRProductsRequest.h"

@implementation CRProductsRequest

+ (void)reuestProductsWithParaDict:(NSDictionary *)paraDict
                           success:(void (^) ())success
                           failure:(void (^) ())failure
{
    [[CRBaseRequestManager sharedManager] getReuestWithURLStr:CR_HOME_PRODUCTS_URL
                     paraDict:paraDict
                      success:^{
                          nil;
                      }
                      failure:^{
                          nil;
                      }];
}

@end
