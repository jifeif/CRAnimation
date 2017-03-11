//
//  CRProductionBaseVC.h
//  CRAnimation
//
//  Created by Bear on 17/2/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseViewController.h"
@class CRDemoInfoModel;

@interface CRProductionBaseVC : CRBaseViewController

@property (strong, nonatomic) UIColor       *backBtnColor;
@property (strong, nonatomic) UIView        *contentView;

- (void)setDemoInfoModel:(CRDemoInfoModel *)demoInfoModel;
- (void)addTopBarWithTitle:(NSString *)title;
- (void)popSelf;

@end
