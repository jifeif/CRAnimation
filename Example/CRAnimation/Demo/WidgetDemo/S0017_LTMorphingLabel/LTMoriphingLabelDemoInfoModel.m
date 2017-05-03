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
    self.demoGifName    = @"S0017_LTMoriphingLabel_20170503.gif";
    self.demoType       = kCRDemoTypeStorage;
    self.CRID           = @"S0017";
    self.demoName       = @"LTMorphingLabel";
    self.demoSummary    = @"炫酷的文字切换效果";
    self.codeLanguage   = kCRLanguageTypeSwift;
    
    self.originGitHubAddress            = @"https://github.com/lexrus/LTMorphingLabel";
    self.homePage                       = @"https://github.com/lexrus/LTMorphingLabel";
}

- (CRMemberInfoModel *)authorInfo
{
    CRMemberInfoModel *authorInfo = [CRMemberInfoModel new];
    authorInfo.realName = @"";
    authorInfo.nickName = @"LexTang";
    authorInfo.mail     = @"lexrus@gmail.com";
    authorInfo.qq       = @"";
    authorInfo.homePage = @"http://lexrus.com/";
    authorInfo.professionType = kProfessionTypeiOSDeveloper;
    
    return authorInfo;
}

@end
