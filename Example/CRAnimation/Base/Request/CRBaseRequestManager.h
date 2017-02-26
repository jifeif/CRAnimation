//
//  CRBaseRequestManager.h
//  CRAnimation
//
//  Created by Bear on 17/2/26.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRUrls.h"
@class CRBaseRequestManager;

@interface CRBaseRequestManager : NSObject

+ (id)sharedManager;

- (void)getReuestWithSuffixURLStr:(NSString *)urlStr
                         paraDict:(NSDictionary *)paraDict
                          success:(void (^) ())success
                          failure:(void (^) ())failure;

- (void)postReuestWithSuffixURLStr:(NSString *)urlStr
                          paraDict:(NSDictionary *)paraDict
                           success:(void (^) ())success
                           failure:(void (^) ())failure;

@end
