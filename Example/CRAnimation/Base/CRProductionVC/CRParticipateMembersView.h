//
//  CRParticipateMembersView.h
//  CRAnimation
//
//  Created by Bear on 17/2/15.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRBaseViewController.h"

@interface CRParticipateMembersView : UIView

+ (CRParticipateMembersView *)commonHeadersViewWithWidth:(CGFloat)width inVC:(__weak CRBaseViewController *)inVC;

- (void)setMemberInfoModelArray:(NSArray<CRMemberInfoModel *> *)memberInfoModelArray;

@end
