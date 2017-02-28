//
//  CRCommon.m
//  CRAnimation
//
//  Created by Bear on 17/2/28.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRCommon.h"

@implementation CRCommon

//  判断字符串是否存在
+ (BOOL)validateStr:(id)str
{
    if (str && [str isKindOfClass:[NSString class]] && [str length] > 0) {
        return YES;
    }
    
    return NO;
}

@end
