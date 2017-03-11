//
//  CRJHUDDemoInfoModel.m
//  CRAnimation
//
//  Created by Bear on 17/3/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRJHUDDemoInfoModel.h"

@implementation CRJHUDDemoInfoModel

- (void)fillDemoInfo
{
    self.demoVCName     = @"CRJHUDDemoVC";
    self.demoGifName    = @"JHUD.gif";
    self.demoType       = kCRDemoTypeStorage;
    self.CRID           = @"S0008";
    self.demoName       = @"JHUD";
    self.demoSummary    = @"JHUD 是一个用于在加载数据时全屏显示的HUD";
    self.detailDesc     = @"JHUD 是一个用于在加载数据时全屏显示的HUD，实现类似美团外卖加载数据时的效果，只是美团的骆驼帧图没有找到，便在 http://preloaders.net 找了个小齿轮当做CustomAnimations 来写了。";
    self.codeLanguage   = kCRLanguageTypeObjectiveC;
    
    self.originGitHubAddress    = @"https://github.com/Jinxiansen/JHUD";
    self.homePage               = @"http://www.jianshu.com/p/fc07f027680c";
    
    
}

- (CRMemberInfoModel *)authorInfo
{
    CRMemberInfoModel *authorInfo = [CRMemberInfoModel new];
    authorInfo.realName = @"";
    authorInfo.nickName = @"晋先森";
    authorInfo.mail     = @"463424863@qq.com";
    authorInfo.qq       = @"463424863";
    authorInfo.homePage = @"https://github.com/Jinxiansen";
    authorInfo.professionType = kProfessionTypeiOSDeveloper;
    
    return authorInfo;
}

@end
