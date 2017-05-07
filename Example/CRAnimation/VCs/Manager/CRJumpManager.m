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
#import <BearSkill/BearAlertView.h>
#import "CRAppDelegate.h"

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
            CRProductionBaseVC *destinationVC = (CRProductionBaseVC *)[storyBoard instantiateInitialViewController];
            if (!destinationVC) {
                return;
            }
            [destinationVC setDemoInfoModel:demoInfoModel];
            [_inVC.navigationController pushViewController:destinationVC animated:YES];
            
        }
        //  正常VC
        else{
            id idVC = [[NSClassFromString(demoInfoModel.demoVCName) alloc] init];
            if ([idVC isKindOfClass:[CRProductionBaseVC class]]) {
                CRProductionBaseVC *destinationVC = (CRProductionBaseVC *)idVC;
                [destinationVC setDemoInfoModel:demoInfoModel];
                [_inVC.navigationController pushViewController:destinationVC animated:YES];
            }else{
                [self needUpdateAppAlertView];
            }
        }
    }
}

- (void)needUpdateAppAlertView
{
    __block BearAlertView *bearAlert = [[BearAlertView alloc] init];
    
    bearAlert.normalAlertContentView.titleLabel.text = @"最高机密";
    bearAlert.normalAlertContentView.titleLabel.textColor = color_ffffff;
    bearAlert.normalAlertContentView.contentLabel.text = @"（＞﹏＜） Sorry～\n当前版本不支持体验该动效，请更新至最新版本！";
    bearAlert.normalAlertContentView.contentLabel.textAlignment = NSTextAlignmentCenter;
    bearAlert.normalAlertContentView.contentLabel.textColor = color_ffffff;
    bearAlert.normalAlertContentView.backgroundColor = color_Master;
    
    [bearAlert.normalAlertBtnsView setNormal_CancelBtnTitle:@"等几年再更新" ConfirmBtnTitle:@"朕立马去更新！"];
    [bearAlert.normalAlertBtnsView.confirmBtn setTitleColor:color_ffffff forState:UIControlStateNormal];
    [bearAlert.normalAlertBtnsView.cancelBtn setTitleColor:color_ffffff forState:UIControlStateNormal];
    bearAlert.normalAlertBtnsView.backgroundColor = color_Master;
    
    [bearAlert alertView_ConfirmClickBlock:^{
        NSString *appStoreAddress = @"https://itunes.apple.com/cn/app/cr%E5%8A%A8%E6%95%88-%E4%BA%A7%E5%93%81ui%E5%8A%A8%E7%94%BB%E7%89%B9%E6%95%88%E6%8A%80%E6%9C%AF%E9%83%BD%E5%9C%A8%E8%BF%99/id1217923882?mt=8";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appStoreAddress]];
    } CancelClickBlock:^{
        NSLog(@"--cancel");
    }];
    bearAlert.animationClose_FinishBlock = ^(){
        NSLog(@"--closeAniamtion finish");
        bearAlert = nil;
    };
    
    CRAppDelegate *myDelegate = (CRAppDelegate *)[[UIApplication sharedApplication] delegate];
    [myDelegate.window addSubview:bearAlert];
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
