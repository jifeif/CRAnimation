//
//  CRConstants.m
//  CRAnimation
//
//  Created by Bear on 17/2/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRConstants.h"

@implementation CRConstants

+ (NSString *)convertProfessionType:(ProfessionType )professionType
{
    NSString *professionStr;
    switch (professionType) {
        case kProfessionTypeiOSDeveloper: { professionStr = @"iOS开发者";} break;
        case kProfessionTypeDesigner: { professionStr = @"UI设计师";} break;
        default: break;
    }
    
    return professionStr;
}

+ (void)normalBlock:(void (^)())normalBlock
    contributeBlock:(void (^)())contributeBlock
{
#if CONTRIBUTE_STATUS == 1
    if (contributeBlock) {
        contributeBlock();
    }
#else
    if (normalBlock) {
        normalBlock();
    }
#endif
}


@end
