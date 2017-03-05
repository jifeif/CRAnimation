//
//  CRGetMemebersListRequest.h
//  CRAnimation
//
//  Created by Bear on 17/3/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseRequestManager.h"

@interface CRGetMemebersListRequest : CRBaseRequestManager

+ (void)getAuthorInfoWithSuccess:(void (^) (NSArray <CRMemberInfoModel *> *membersList))success
                         failure:(void (^) (NSString *errorMsg))failure;

@end
