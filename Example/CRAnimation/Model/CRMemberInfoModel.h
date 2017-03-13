//
//  CRmemberInfoModel.h
//  CRAnimation
//
//  Created by Bear on 16/10/23.
//  Copyright © 2016年 BearRan. All rights reserved.
//

typedef enum {
    kProfessionTypeiOSDeveloper = 1,    //开发者
    kProfessionTypeDesigner = 2,        //UI设计师
}ProfessionType;

#import <Foundation/Foundation.h>
#import "CRDemoInfoModel.h"

@interface CRMemberInfoModel : NSObject

@property (strong, nonatomic) NSNumber  *authorId;//

//  Optional
//  真实姓名
@property (strong, nonatomic) NSString  *realName;//

//  Require
//  昵称
@property (strong, nonatomic) NSString  *nickName;//

//  Require
//  邮箱
@property (strong, nonatomic) NSString  *mail;//

//  Optional
//  qq
@property (strong, nonatomic) NSString  *qq;//

//  Optional
//  个人主页
@property (strong, nonatomic) NSString  *homePage;//

//  Require
//  职业
//  kProfessionTypeiOSDeveloper    开发者
//  kProfessionTypeDesigner        UI设计师
@property (assign, nonatomic) ProfessionType  professionType;//


//  New add in 2017/02/11, 预留用来对接接口

//  Optional
//  头像地址
@property (strong, nonatomic) NSString  *headImageAddress;//

//  Optional
//  作品数量
@property (strong, nonatomic) NSNumber  *productionAmount;//

//  Optional
//  人气
@property (strong, nonatomic) NSNumber  *hotDegree;//

//  Optional
//  作品列表
@property (strong, nonatomic) NSArray  <CRDemoInfoModel *> *animationList;//

//  Optional
//  标签
@property (strong, nonatomic) NSString  *tag;//

@end
