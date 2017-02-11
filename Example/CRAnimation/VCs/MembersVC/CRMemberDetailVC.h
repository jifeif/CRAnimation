//
//  CRMemberDetailVC.h
//  CRAnimation
//
//  Created by Bear on 17/2/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseViewController.h"
#import "CRMemberInfoModel.h"

@interface CRMemberDetailVC : CRBaseViewController

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithInfoModel:(CRMemberInfoModel *)model;

@end
