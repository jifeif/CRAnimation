//
//  CRProductionBaseVC.h
//  CRAnimation
//
//  Created by Bear on 17/2/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseViewController.h"

@interface CRProductionBaseVC : CRBaseViewController

@property (strong, nonatomic) UIColor       *backBtnColor;

- (void)addTopBar;
- (void)popSelf;

@end
