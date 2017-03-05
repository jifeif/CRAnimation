//
//  CRGetAuthorInfoRequest.m
//  CRAnimation
//
//  Created by Bear on 17/3/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRGetAuthorInfoRequest.h"

@implementation CRGetAuthorInfoRequest

+ (void)getAuthorInfoWithUserId:(NSNumber *)userId
                        success:(void (^) ())success
                        failure:(void (^) (NSString *errorMsg))failure
{
    NSString *suffixUrlStr = [NSString stringWithFormat:@"%@/%@", CR_AUTHOR_INFO_URL, userId];
    [[CRBaseRequestManager sharedManager] getReuestWithSuffixURLStr:suffixUrlStr
                                                           paraDict:nil
                                                            success:^(CRResponseBaseModel *responseBaseModel) {
                                                                
//                                                                [CRDemoInfoModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
//                                                                    return @{
//                                                                             @"demoVCName" : @"vcName",
//                                                                             @"CRID" : @"crid",
//                                                                             @"demoType" : @"type",
//                                                                             @"gifAddress" : @"showUrl",
//                                                                             @"demoName" : @"name",
//                                                                             @"demoSummary" : @"shortDesc",
//                                                                             @"originGitHubAddress" : @"originGithubAddress",
//                                                                             @"homePage" : @"otherAddress"
//                                                                             };
//                                                                }];
//                                                                [CRDemoInfoModel mj_setupObjectClassInArray:^NSDictionary *{
//                                                                    return @{
//                                                                             @"developAuthors" : @"CRProductsMemberBriefInfoModel",
//                                                                             @"designAuthors" : @"CRProductsMemberBriefInfoModel",
//                                                                             };
//                                                                }];
//                                                                [CRHomeProductsModel mj_setupObjectClassInArray:^NSDictionary *{
//                                                                    return @{
//                                                                             @"list" : @"CRDemoInfoModel"
//                                                                             };
//                                                                }];
//                                                                
//                                                                CRHomeProductsModel *homeProductModel = [CRHomeProductsModel mj_objectWithKeyValues:responseBaseModel.data];
//                                                                if (success) {
//                                                                    success(homeProductModel);
//                                                                }
                                                                
                                                            } failure:^(NSString *errorMsg) {
                                                                if (failure) {
                                                                    failure(errorMsg);
                                                                }
                                                            }];
}

@end
