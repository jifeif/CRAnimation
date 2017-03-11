//
//  CRRollerCoasterLayerModel.m
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
//  Github  :https://github.com/631106979
//  HomePage:https://imwcl.com
//  CSDN    :http://blog.csdn.net/wang631106979
//
//  Created by 王崇磊 on 16/9/14.
//  Copyright © 2016年 王崇磊. All rights reserved.
//

#import "CRRollerCoasterLayerModel.h"

@implementation CRRollerCoasterLayerModel

#pragma mark - Override
- (void)fillDemoInfo
{
    self.demoVCName     = @"_TtC19CRAnimation_Example22CRRollerCoasterLayerVC";
    self.demoGifName    = @"RollerCoasterLayer.gif";
    self.demoType       = kCRDemoTypeStorage;
    self.CRID           = @"S00010";
    self.demoName       = @"RollerCoasterLayer";
    self.demoSummary    = @"过山车动画";
    self.codeLanguage   = kCRLanguageTypeSwift;
    
    self.originGitHubAddress            = @"https://github.com/631106979/RollerCoasterAnimation";
    self.homePage                       = @"https://imwcl.com";
}

- (CRMemberInfoModel *)authorInfo
{
    CRMemberInfoModel *authorInfo = [CRMemberInfoModel new];
    authorInfo.realName = @"";
    authorInfo.nickName = @"WCL";
    authorInfo.mail     = @"wangchonhlei93@icloud.com";
    authorInfo.qq       = @"631106979";
    authorInfo.homePage = @"http://imwcl.com";
    authorInfo.professionType = kProfessionTypeiOSDeveloper;
    
    return authorInfo;
}
@end
