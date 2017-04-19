//
//  HJWWaterWaveDemoInfoModel.m
//  CRAnimation
//
//  Created by Lemon_Mr.H on 2017/3/30.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "HJWWaterWaveDemoInfoModel.h"

@implementation HJWWaterWaveDemoInfoModel

- (void)fillDemoInfo
{
    self.demoVCName     = @"HJWWaterWaveDemoVC";
    self.demoGifName    = @"S0012_HJWWaterWave.gif";
    self.demoType       = kCRDemoTypeStorage;
    self.CRID           = @"S0012";
    self.demoName       = @"HJWWaterWave";
    self.demoSummary    = @"水波纹";
    self.codeLanguage   = kCRLanguageTypeObjectiveC;
    
    self.originGitHubAddress            = @"https://github.com/SmallLion/HJWWaveFloatView";
    self.homePage                       = @"https://github.com/SmallLion/HJWWaveFloatView";
}

- (CRMemberInfoModel *)authorInfo
{
    CRMemberInfoModel *authorInfo = [CRMemberInfoModel new];
    authorInfo.realName = @"";
    authorInfo.nickName = @"Lemon";
    authorInfo.mail     = @"573986558@qq.com";
    authorInfo.qq       = @"573986558";
    authorInfo.homePage = @"http://smalllion.github.io/";
    authorInfo.professionType = kProfessionTypeiOSDeveloper;
    
    return authorInfo;
}
@end
