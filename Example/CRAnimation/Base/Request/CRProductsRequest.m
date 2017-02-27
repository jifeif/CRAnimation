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
                           success:(void (^) (CRResponseBaseModel *responseBaseModel))success
                           failure:(void (^) (NSString *errorMsg))failure
{
    [[CRBaseRequestManager sharedManager] getReuestWithSuffixURLStr:CR_HOME_PRODUCTS_URL
                                                           paraDict:paraDict
                                                            success:^(CRResponseBaseModel *responseBaseModel) {
                                                                responseBaseModel;
                                                                nil;
                                                            } failure:^(NSString *errorMsg) {
                                                                nil;
                                                            }];
}

@end
