//
//  CRConstants.h
//  CRAnimation
//
//  Created by Bear on 17/2/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRMemberInfoModel.h"

@interface CRConstants : NSObject

+ (NSString *)convertProfessionType:(ProfessionType )professionType;

+ (void)normalBlock:(void (^)())normalBlock
    contributeBlock:(void (^)())contributeBlock;

@end
