//
//  CRJumpWebViewManager.m
//  CRAnimation
//
//  Created by Bear on 17/3/14.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRJumpWebViewManager.h"
#import "CRBaseWebVC.h"
#import "CRBaseViewController.h"

@implementation CRJumpWebViewManager

+ (void)jumpToUrlStr:(NSString *)urlStr inVC:(__weak CRBaseViewController*)inVC
{
    if (!urlStr || [urlStr length] == 0) {
        return;
    }
    
    NSURL *url = [NSURL URLWithString:urlStr];
    CRBaseWebVC *webVC = [[CRBaseWebVC alloc] initWithUrl:url];
    [inVC.navigationController pushViewController:webVC animated:YES];
}

@end
