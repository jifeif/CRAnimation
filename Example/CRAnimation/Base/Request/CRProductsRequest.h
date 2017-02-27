//
//  CRProductsRequest.h
//  CRAnimation
//
//  Created by Bear on 17/2/26.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseRequestManager.h"
#import "CRHomeProductsModel.h"

@interface CRProductsRequest : CRBaseRequestManager

+ (void)reuestProductsWithParaDict:(NSDictionary *)paraDict
                           success:(void (^) (CRHomeProductsModel *homeProductModel))success
                           failure:(void (^) (NSString *errorMsg))failure;

@end
