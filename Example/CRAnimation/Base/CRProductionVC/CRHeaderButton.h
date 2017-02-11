//
//  CRHeaderButton.h
//  CRAnimation
//
//  Created by Bear on 17/2/9.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRMemberInfoModel.h"

@interface CRHeaderButton : UIButton

@property (strong, nonatomic) CRMemberInfoModel *memberInfoModel;

- (instancetype)initWithCRMemberInfoModel:(CRMemberInfoModel *)model;

@end
