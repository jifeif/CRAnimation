//
//  RQShineLabelDemoInfoModel.m
//  CRAnimation
//
//  Created by Bear on 17/4/24.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "RQShineLabelDemoInfoModel.h"

@implementation RQShineLabelDemoInfoModel

- (void)fillDemoInfo
{
    self.demoVCName     = @"RQShineLabelDemoVC";
    self.demoGifName    = @"S0015_RQShineLabel_20170424.gif";
    self.demoType       = kCRDemoTypeStorage;
    self.CRID           = @"S0015";
    self.demoName       = @"RQShineLabel";
    self.demoSummary    = @"文字过渡动画";
    self.codeLanguage   = kCRLanguageTypeObjectiveC;
    
    self.originGitHubAddress            = @"https://github.com/zipme/RQShineLabel";
    self.homePage                       = @"https://github.com/zipme/RQShineLabel";
}

- (CRMemberInfoModel *)authorInfo
{
    CRMemberInfoModel *authorInfo = [CRMemberInfoModel new];
    authorInfo.realName = @"";
    authorInfo.nickName = @"zipme";
    authorInfo.mail     = @"";
    authorInfo.qq       = @"";
    authorInfo.homePage = @"https://github.com/zipme";
    authorInfo.professionType = kProfessionTypeTeam;
    
    return authorInfo;
}

@end
