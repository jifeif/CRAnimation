//
//  CRRefreshInfoModel.m
//  CRAnimation
//
// **************************************************
// *                                  _____         *
// *         __  _  __     ___        \   /         *
// *         \ \/ \/ /    / __\       /  /          *
// *          \  _  /    | (__       /  /           *
// *           \/ \/      \___/     /  /__          *
// *                               /_____/          *
// *                                                *
// **************************************************
//  Github  :https://github.com/imwcl
//  HomePage:https://imwcl.com
//  CSDN    :http://blog.csdn.net/wang631106979
//
//  Created by 王崇磊 on 16/9/14.
//  Copyright © 2016年 王崇磊. All rights reserved.
//

#import "CRRefreshDemoInfoModel.h"
#import "CRAnimation_Example-Swift.h"


@implementation CRRefreshDemoInfoModel


- (void)fillDemoInfo
{
    self.demoVCName     = @"_TtC19CRAnimation_Example11CRRefreshVC";
    self.demoGifName    = @"S0018_CRRefresh.gif";
    self.demoType       = kCRDemoTypeStorage;
    self.CRID           = @"S0018";
    self.demoName       = @"CRRefresh";
    self.demoSummary    = @"炫酷的上拉刷新动效";
    self.codeLanguage   = kCRLanguageTypeSwift;
    
    self.originGitHubAddress            = @"https://github.com/CRAnimation/CRRefresh";
    self.homePage                       = @"https://github.com/CRAnimation/CRRefresh";
    
    
}

- (CRMemberInfoModel *)authorInfo
{
    CRMemberInfoModel *authorInfo = [CRMemberInfoModel new];
    authorInfo.realName = @"";
    authorInfo.nickName = @"WCL";
    authorInfo.mail     = @"wangchonhlei93@icloud.com";
    authorInfo.qq       = @"631106979";
    authorInfo.homePage = @"https://imwcl.com";
    authorInfo.professionType = kProfessionTypeiOSDeveloper;
    
    return authorInfo;
}

@end
