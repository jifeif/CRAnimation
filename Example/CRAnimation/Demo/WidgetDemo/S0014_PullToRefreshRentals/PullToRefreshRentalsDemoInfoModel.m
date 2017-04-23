//
//  PullToRefreshRentalsDemoInfoModel.m
//  CRAnimation
//
//  Created by Bear on 17/4/22.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "PullToRefreshRentalsDemoInfoModel.h"

@implementation PullToRefreshRentalsDemoInfoModel

- (void)fillDemoInfo
{
    self.demoVCName     = @"PullToRefreshRentalsDemoVC";
    self.demoGifName    = @"S0014_PullToRefreshRentals.gif";
    self.demoType       = kCRDemoTypeStorage;
    self.CRID           = @"S0014";
    self.demoName       = @"PullToRefreshRentals";
    self.demoSummary    = @"下拉刷新动画";
    self.codeLanguage   = kCRLanguageTypeObjectiveC;
    
    self.originGitHubAddress            = @"https://github.com/Yalantis/Pull-to-Refresh.Rentals-iOS";
    self.homePage                       = @"https://github.com/Yalantis/Pull-to-Refresh.Rentals-iOS";
}

- (CRMemberInfoModel *)authorInfo
{
    CRMemberInfoModel *authorInfo = [CRMemberInfoModel new];
    authorInfo.realName = @"";
    authorInfo.nickName = @"Yalantis";
    authorInfo.mail     = @"";
    authorInfo.qq       = @"";
    authorInfo.homePage = @"https://github.com/Yalantis";
    authorInfo.professionType = kProfessionTypeTeam;
    
    return authorInfo;
}

@end
