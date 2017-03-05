//
//  CRGetAuthorInfoRequest.h
//  CRAnimation
//
//  Created by Bear on 17/3/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseRequestManager.h"
#import "CRMemberInfoModel.h"

@interface CRGetAuthorInfoRequest : CRBaseRequestManager

+ (void)getAuthorInfoWithUserId:(NSNumber *)userId
                        success:(void (^) (CRMemberInfoModel *memeberInfoModel))success
                        failure:(void (^) (NSString *errorMsg))failure;

@end
