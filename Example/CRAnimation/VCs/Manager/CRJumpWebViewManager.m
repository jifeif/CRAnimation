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
#import <SafariServices/SafariServices.h>

@interface CRJumpWebViewManager () <SFSafariViewControllerDelegate>

@end

@implementation CRJumpWebViewManager

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (void)jumpToUrlStr:(NSString *)urlStr inVC:(__weak CRBaseViewController*)inVC
{
    if (!urlStr || [urlStr length] == 0) {
        return;
    }
    
    NSURL *url = [NSURL URLWithString:urlStr];
    if (over_iOS9) {
        SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:url];
        svc.delegate = self;
        [inVC.navigationController presentViewController:svc animated:YES completion:nil];
    }else{
        CRBaseWebVC *webVC = [[CRBaseWebVC alloc] initWithUrl:url];
        [inVC.navigationController pushViewController:webVC animated:YES];
    }
}

#pragma mark - SFSafariViewControllerDelegate
- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
