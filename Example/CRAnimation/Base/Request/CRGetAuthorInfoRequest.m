//
//  CRGetAuthorInfoRequest.m
//  CRAnimation
//
//  Created by Bear on 17/3/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRGetAuthorInfoRequest.h"
#import "CRCommonExtendsManager.h"
#import <MJExtension/MJExtension.h>

@implementation CRGetAuthorInfoRequest

+ (void)getAuthorInfoWithUserId:(NSNumber *)userId
                        success:(void (^) (CRMemberInfoModel *memeberInfoModel))success
                        failure:(void (^) (NSString *errorMsg))failure
{
    NSString *suffixUrlStr = [NSString stringWithFormat:@"%@/%@", CR_AUTHOR_INFO_URL, userId];
    [[CRBaseRequestManager sharedManager] postReuestWithSuffixURLStr:suffixUrlStr
                                                           paraDict:nil
                                                            success:^(CRResponseBaseModel *responseBaseModel) {
                                                                
                                                                [CRMemberInfoModel mj_setupObjectClassInArray:^NSDictionary *{
                                                                    return @{
                                                                             @"animationList" : @"CRDemoInfoModel",
                                                                             };
                                                                }];
                                                                [CRCommonExtendsManager productsExtendsSetting];

                                                                CRMemberInfoModel *memberInfoModel = [CRMemberInfoModel mj_objectWithKeyValues:responseBaseModel.data];
                                                                
                                                                if (success) {
                                                                    success(memberInfoModel);
                                                                }
                                                                
                                                            } failure:^(NSString *errorMsg) {
                                                                if (failure) {
                                                                    failure(errorMsg);
                                                                }
                                                            }];
}

@end
