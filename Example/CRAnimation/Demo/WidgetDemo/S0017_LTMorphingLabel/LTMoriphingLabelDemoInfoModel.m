//
//  LTMoriphingLabelDemoInfoModel.m
//  CRAnimation
//
//  Created by Bear on 17/4/26.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "LTMoriphingLabelDemoInfoModel.h"

@implementation LTMoriphingLabelDemoInfoModel

- (void)fillDemoInfo
{
    self.demoVCName     = @"StoryBoard?SBName=LTMorphingLabelDemo";
    self.demoGifName    = @"S0016_NVActivityIndicatorView_20170425.gif";
    self.demoType       = kCRDemoTypeStorage;
    self.CRID           = @"S0016";
    self.demoName       = @"NVActivityIndicatorView";
    self.demoSummary    = @"各种实用的加载指示器";
    self.codeLanguage   = kCRLanguageTypeSwift;
    
    self.originGitHubAddress            = @"https://github.com/ninjaprox/NVActivityIndicatorView";
    self.homePage                       = @"http://blog.vinhis.me";
}

- (CRMemberInfoModel *)authorInfo
{
    CRMemberInfoModel *authorInfo = [CRMemberInfoModel new];
    authorInfo.realName = @"";
    authorInfo.nickName = @"Vinh Nguyen";
    authorInfo.mail     = @"ninjaprox@gmail.com";
    authorInfo.qq       = @"";
    authorInfo.homePage = @"http://blog.vinhis.me";
    authorInfo.professionType = kProfessionTypeiOSDeveloper;
    
    return authorInfo;
}

@end
