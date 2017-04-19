//
//  CRImageGradientDemoInfoModel.m
//  CRAnimation
//
//  Created by Bear on 16/10/12.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import "CRImageGradientDemoInfoModel.h"

@implementation CRImageGradientDemoInfoModel

- (void)fillDemoInfo
{
    self.demoVCName     = @"CRImageGradientDemoVC";
    self.demoGifName    = @"S0002_CRGradientAnimation_20170322.gif";
    self.demoType       = kCRDemoTypeStorage;
    self.CRID           = @"S0002";
    self.demoName       = @"CRImageGradientView";
    self.demoSummary    = @"ImageView过渡切换动效";
    self.codeLanguage   = kCRLanguageTypeObjectiveC;
    
    self.originGitHubAddress            = @"https://github.com/BearRan/CRAnimation";
    self.homePage                       = @"https://github.com/BearRan/CRAnimation";

    
}

- (CRMemberInfoModel *)authorInfo
{
    CRMemberInfoModel *authorInfo = [CRMemberInfoModel new];
    authorInfo.realName = @"";
    authorInfo.nickName = @"Bear";
    authorInfo.mail     = @"648070256@qq.com";
    authorInfo.qq       = @"648070256";
    authorInfo.professionType = kProfessionTypeiOSDeveloper;
    
    return authorInfo;
}

@end
