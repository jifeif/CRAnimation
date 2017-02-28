//
//  CRProductsRequest.h
//  CRAnimation
//
//  Created by Bear on 17/2/26.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseRequestManager.h"
#import "CRHomeProductsModel.h"

typedef enum {
    kCRHomeProductType_CodeAnimation        = 1,
    kCRHomeProductType_CodeWidgetAnimation  = 2,
    kCRHomeProductType_DesignerAnimation    = 3,
}CRHomeProductType;

@interface CRProductsRequest : CRBaseRequestManager

+ (void)reuestProductsWithAnmationType:(CRHomeProductType)anmationType
                               success:(void (^) (CRHomeProductsModel *homeProductModel))success
                               failure:(void (^) (NSString *errorMsg))failure;

@end
