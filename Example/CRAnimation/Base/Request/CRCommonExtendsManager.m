//
//  CRCommonExtendsManager.m
//  CRAnimation
//
//  Created by Bear on 17/3/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRCommonExtendsManager.h"
#import "CRDemoInfoModel.h"
#import "CRDemoInfoModel.h"
#import "CRHomeProductsModel.h"
#import <MJExtension/MJExtension.h>

@implementation CRCommonExtendsManager

+ (void)productsExtendsSetting
{
    [CRDemoInfoModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"demoVCName" : @"vcName",
                 @"CRID" : @"crid",
                 @"demoType" : @"type",
                 @"gifAddress" : @"showUrl",
                 @"demoName" : @"name",
                 @"demoSummary" : @"shortDesc",
                 @"originGitHubAddress" : @"originGithubAddress",
                 @"homePage" : @"otherAddress",
                 @"codeLanguage" : @"language"
                 };
    }];
    [CRDemoInfoModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"developAuthors" : @"CRProductsMemberBriefInfoModel",
                 @"designAuthors" : @"CRProductsMemberBriefInfoModel",
                 };
    }];
    [CRHomeProductsModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"list" : @"CRDemoInfoModel"
                 };
    }];
}

@end
