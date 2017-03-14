//
//  CRProductionBaseVC.h
//  CRAnimation
//
//  Created by Bear on 17/2/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseViewController.h"
#import "CRNavigationBarView.h"
@class CRDemoInfoModel;

@interface CRProductionBaseVC : CRBaseViewController

@property (strong, nonatomic) UIColor       *backBtnColor;
@property (strong, nonatomic) CRNavigationBarView *customNaviBarView;
@property (strong, nonatomic) UIView        *contentView;
@property (readonly, strong, nonatomic) CRDemoInfoModel *demoInfoModel;

- (void)setDemoInfoModel:(CRDemoInfoModel *)demoInfoModel;
- (void)addTopBarWithTitle:(NSString *)title;
- (void)popSelf;

@end
