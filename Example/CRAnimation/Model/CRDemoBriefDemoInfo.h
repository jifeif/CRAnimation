//
//  CRDemoBriefDemoInfo.h
//  CRAnimation
//
//  Created by Bear on 17/2/14.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRDemoBriefDemoInfo : NSObject

//  Require
//  demoVC名称（用于push到指定名称的VC）
@property (strong, nonatomic) NSString      *demoVCName;

//  Require
//  demoGif名称
//  Ex:demoGifName = @"GifPlay.gif"
@property (strong, nonatomic) NSString      *demoGifName;

//  Require
//  动效类型
//  kCRDemoTypeStorage:         动效仓库
//  kCRDemoTypeCombination:     组合动效
//@property (assign, nonatomic) CRDemoType    demoType;

//  Require
//  ID编号
//  S0001:动效仓库
//  C0001:组合动效
@property (strong, nonatomic) NSString      *CRID;

//  Require
//  动效名称
@property (strong, nonatomic) NSString      *demoName;

//  Require
//  动效简介
@property (strong, nonatomic) NSString      *demoSummary;

//  Require
//  语言
//  OC/Swift
//@property (assign, nonatomic) CRLanguage    codeLanguage;

//  Optional
//  作者源gitHub地址
@property (strong, nonatomic) NSString      *originGitHubAddress;

//  Optional
//  主页／该demo其他相关介绍文章地址，如csdn，简书，blog地址
@property (strong, nonatomic) NSString      *homePage;

//  Require
//  作者信息
//@property (strong, nonatomic) CRMemberInfoModel      *authorInfo;

//  Optional
//  UI设计师信息
//@property (strong, nonatomic) CRMemberInfoModel      *UIDesignerInfo;


- (void)fillDemoInfo;

//  New add in 2017/02/11, 预留用来对接接口

//  Require
//  Gif地址
@property (strong, nonatomic) NSString      *gifAddress;

@end
