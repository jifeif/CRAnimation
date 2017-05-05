//
//  CRDemoInfoModel.m
//  CRAnimation
//
//  Created by Bear on 16/10/7.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import "CRDemoInfoModel.h"

@implementation CRDemoInfoModel

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self fillDemoInfo];
    }
    
    return self;
}

- (void)fillDemoInfo
{
    self.demoVCName     = @"";
    self.demoGifName    = @"";
    self.demoType       = kCRDemoTypeStorage;
    self.CRID           = @"S0001";
    self.demoName       = @"";
    self.demoSummary    = @"";
    self.codeLanguage   = kCRLanguageTypeSwift;
    
    self.originGitHubAddress            = @"";
    self.homePage                       = @"";

    
}

- (CRMemberInfoModel *)authorInfo
{
    CRMemberInfoModel *authorInfo = [CRMemberInfoModel new];
    authorInfo.realName = @"";
    authorInfo.nickName = @"";
    authorInfo.mail     = @"";
    authorInfo.qq       = @"";
    authorInfo.homePage = @"";
    authorInfo.professionType = kProfessionTypeiOSDeveloper;
    
    return authorInfo;
}

+ (CGSize)caculateImageSize:(NSString *)imageSizeStr
{
    CGSize imageSize = CGSizeZero;
    imageSizeStr = [imageSizeStr stringByReplacingOccurrencesOfString:@"(" withString:@""];
    imageSizeStr = [imageSizeStr stringByReplacingOccurrencesOfString:@")" withString:@""];
    NSArray *sizeParaArray = [imageSizeStr componentsSeparatedByString:@","];
    if ([sizeParaArray count] == 2) {
        imageSize = CGSizeMake([sizeParaArray[0] floatValue], [sizeParaArray[1] floatValue]);
    }
    
    return imageSize;
}

@end
