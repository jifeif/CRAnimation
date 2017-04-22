//
//  FoldingTabBarDemoInfoModel.m
//  CRAnimation
//
//  Created by Bear on 17/4/21.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "FoldingTabBarDemoInfoModel.h"


@implementation FoldingTabBarDemoInfoModel
- (void)fillDemoInfo
{
    self.demoVCName     = @"FoldingTabBarDemoVC";
    self.demoGifName    = @"S0013_FoldingTabBar.gif";
    self.demoType       = kCRDemoTypeStorage;
    self.CRID           = @"S0013";
    self.demoName       = @"FoldingTabBar";
    self.demoSummary    = @"折叠TabBar";
    self.codeLanguage   = kCRLanguageTypeObjectiveC;
    
    self.originGitHubAddress            = @"https://github.com/Yalantis/FoldingTabBar.iOS";
    self.homePage                       = @"https://yalantis.com/blog/how_we_created_tab_bar_animation_for_ios/";
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
