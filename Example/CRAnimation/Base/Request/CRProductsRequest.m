//
//  CRProductsRequest.m
//  CRAnimation
//
//  Created by Bear on 17/2/26.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRProductsRequest.h"
#import "CRCommonExtendsManager.h"
#import <MJExtension/MJExtension.h>

@implementation CRProductsRequest

+ (void)reuestProductsWithAnmationType:(CRHomeProductType)anmationType
                               success:(void (^) (CRHomeProductsModel *homeProductModel))success
                               failure:(void (^) (NSString *errorMsg))failure
{
    
    NSString *suffixUrlStr;
    switch (anmationType) {
        case kCRHomeProductType_CodeAnimation:
            suffixUrlStr = CR_HOME_PRODUCTS_CODE_ANIMATION_URL;
            break;
            
        case kCRHomeProductType_CodeWidgetAnimation:
            suffixUrlStr = CR_HOME_PRODUCTS_CODE_WIDGET_ANIMATION_URL;
            break;
            
        case kCRHomeProductType_DesignerAnimation:
            suffixUrlStr = CR_HOME_PRODUCTS_DESIGN_ANIMATION_URL;
            break;
            
        default:
            break;
    }
    [[CRBaseRequestManager sharedManager] getReuestWithSuffixURLStr:suffixUrlStr
                                                           paraDict:nil
                                                            success:^(CRResponseBaseModel *responseBaseModel) {
                                                                
                                                                [CRCommonExtendsManager productsExtendsSetting];
                                                                CRHomeProductsModel *homeProductModel = [CRHomeProductsModel mj_objectWithKeyValues:responseBaseModel.data];
                                                                if (success) {
                                                                    success(homeProductModel);
                                                                }
                                                                
                                                            } failure:^(NSString *errorMsg) {
                                                                if (failure) {
                                                                    failure(errorMsg);
                                                                }
                                                            }];
}

@end
