//
//  CRDemoInfoModel.h
//  CRAnimation
//
//  Created by Bear on 16/10/7.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRMemberInfoModel.h"
#import "CRProductsMemberBriefInfoModel.h"

typedef enum {
    kCRDemoTypeStorage,       //  动效仓库
    kCRDemoTypeCombination,   //  组合动效
} CRDemoType;

typedef enum {
    kCRLanguageTypeObjectiveC,  //  Objective-C
    kCRLanguageTypeSwift,       //  Swift
} CRLanguage;

@interface CRDemoInfoModel : NSObject

//  Require
//  demoVC名称（用于push到指定名称的VC）
@property (strong, nonatomic) NSString      *demoVCName;//

//  Require
//  demoGif名称
//  Ex:demoGifName = @"GifPlay.gif"
@property (strong, nonatomic) NSString      *demoGifName;

//  Require
//  动效类型
//  kCRDemoTypeStorage:         动效仓库
//  kCRDemoTypeCombination:     组合动效
@property (assign, nonatomic) CRDemoType    demoType;//

//  Require
//  ID编号
//  S0001:动效仓库
//  C0001:组合动效
@property (strong, nonatomic) NSString      *CRID;//

//  Require
//  动效名称
@property (strong, nonatomic) NSString      *demoName;//

//  Require
//  动效简介
@property (strong, nonatomic) NSString      *demoSummary;//

//  Require
//  动效详情
@property (strong, nonatomic) NSString      *detailDesc;//

//  Require
//  语言(字符串类型)
@property (assign, nonatomic) NSString      *language;//

//  Require
//  语言
//  OC/Swift
@property (assign, nonatomic) CRLanguage    codeLanguage;

//  Optional
//  作者源gitHub地址
@property (strong, nonatomic) NSString      *originGitHubAddress;//

//  Optional
//  主页／该demo其他相关介绍文章地址，如csdn，简书，blog地址
@property (strong, nonatomic) NSString      *homePage;//

//  Optional
//  出处地址
@property (strong, nonatomic) NSString      *referenceAddress;//

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
@property (strong, nonatomic) NSString      *gifAddress;//

//  数据库用id
@property (strong, nonatomic) NSNumber  *animationId;//

@property (strong, nonatomic) NSArray <CRProductsMemberBriefInfoModel *> *developAuthors;
@property (strong, nonatomic) NSArray <CRProductsMemberBriefInfoModel *> *designAuthors;

@end
