//
//  CRGetMemebersListRequest.m
//  CRAnimation
//
//  Created by Bear on 17/3/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRGetMemebersListRequest.h"
#import "CRMemberInfoModel.h"
#import <MJExtension/MJExtension.h>

@implementation CRGetMemebersListRequest

+ (void)getAuthorInfoWithSuccess:(void (^) (NSArray <CRMemberInfoModel *> *membersList))success
                         failure:(void (^) (NSString *errorMsg))failure
{
    [[CRBaseRequestManager sharedManager] postReuestWithSuffixURLStr:CR_MEMBERS_LIST_URL
                                                            paraDict:nil
                                                             success:^(CRResponseBaseModel *responseBaseModel) {
                                                                 
                                                                 NSArray *originMemberListDataArray = [responseBaseModel.originData objectForKey:@"data"];
                                                                 NSArray <CRMemberInfoModel *> *membersList = [NSArray new];
                                                                 if (originMemberListDataArray) {
                                                                     membersList = [CRMemberInfoModel mj_objectArrayWithKeyValuesArray:originMemberListDataArray];
                                                                 }
                                                                 
                                                                 if (success) {
                                                                     success(membersList);
                                                                 }
                                                                 
                                                             } failure:^(NSString *errorMsg) {
                                                                 if (failure) {
                                                                     failure(errorMsg);
                                                                 }
                                                             }];
}

@end
