//
//  CRJumpManager.m
//  CRAnimation
//
//  Created by Bear on 17/2/18.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRJumpManager.h"
#import "CRBaseViewController.h"
#import "CRDemoInfoModel.h"
#import "CRProductionBaseVC.h"
#import "CRDesignProductionBaseVC.h"

@interface CRJumpManager ()
{
    CRBaseViewController *_inVC;
}

@end

@implementation CRJumpManager

+ (CRJumpManager *)commonManagerInVC:(__weak CRBaseViewController *)inVC
{
    CRJumpManager *manager = [[CRJumpManager alloc] initInVC:inVC];
    return manager;
}

- (instancetype)initInVC:(__weak CRBaseViewController *)inVC
{
    self = [super init];
    
    if (self) {
        _inVC = inVC;
    }
    
    return self;
}

- (void)jumpToProductDetailVCWithDemoInfoModel:(CRDemoInfoModel *)demoInfoModel
{
    //  设计师显示界面
    if (demoInfoModel.demoType == kCRDemoTypeDesigner) {
        CRDesignProductionBaseVC *destinationVC = [CRDesignProductionBaseVC new];
        [destinationVC setDemoInfoModel:demoInfoModel];
        [_inVC.navigationController pushViewController:destinationVC animated:YES];
    }
    //  开发者显示界面
    else{
        NSString *SBPrefix = @"StoryBoard?";
        NSString *SBNameKey = @"SBName";
        NSString *schemeStr = demoInfoModel.demoVCName;
        
        //  SB解析VC
        if ([schemeStr hasPrefix:SBPrefix]) {
            schemeStr = [schemeStr stringByReplacingOccurrencesOfString:SBPrefix withString:@""];
            NSDictionary *schemePara = [self convertParaStrToDict_paraStr:schemeStr];
            NSString *SBName = [schemePara objectForKey:SBNameKey];
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:SBName bundle:nil];
            if (!storyBoard) {
                return;
            }
            UIViewController *vc = [storyBoard instantiateInitialViewController];
            if (!vc) {
                return;
            }
            [_inVC.navigationController pushViewController:vc animated:YES];
            
        }
        //  正常VC
        else{
            id idVC = [[NSClassFromString(demoInfoModel.demoVCName) alloc] init];
            if ([idVC isKindOfClass:[CRProductionBaseVC class]]) {
                CRProductionBaseVC *destinationVC = (CRProductionBaseVC *)idVC;
                [destinationVC setDemoInfoModel:demoInfoModel];
                [_inVC.navigationController pushViewController:destinationVC animated:YES];
            }
        }
    }
}

#pragma mark - Analysis
/** 字符串解析成字典
 *
 *  参考解析数据
 *  para_1=1&para_2=2
 */
- (NSDictionary *)convertParaStrToDict_paraStr:(NSString *)paraStr
{
    NSMutableDictionary *paraDict = [[NSMutableDictionary alloc] init];
    
    NSArray *parasArray = [paraStr componentsSeparatedByString:@"&"];
    for (int i = 0; i < [parasArray count]; i++) {
        
        NSString    *paraDetailStr      = parasArray[i];
        NSArray     *paraKeyValueArray  = [paraDetailStr componentsSeparatedByString:@"="];
        
        if ([paraKeyValueArray count] >= 2) {
            NSString *paraKey = paraKeyValueArray[0];
            NSString *paraValue = [[paraKeyValueArray subarrayWithRange:NSMakeRange(1, paraKeyValueArray.count - 1)] componentsJoinedByString:@"="];
            [paraDict setObject:paraValue forKey:paraKey];
        }
    }
    
    return paraDict;
}

@end
