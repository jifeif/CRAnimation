//
//  CRBaseRequestManager.h
//  CRAnimation
//
//  Created by Bear on 17/2/26.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CRBaseRequestManager;

@interface CRBaseRequestManager : NSObject

+ (CRBaseRequestManager *)sharedManager;

- (void)postReuestWithURLStr:(NSString *)urlStr
                    paraDict:(NSDictionary *)paraDict
                     success:(void (^) ())success
                     failure:(void (^) ())failure;

@end
