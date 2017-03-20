//
//  CRCustomNaviBarView.h
//  CRAnimation
//
//  Created by Bear on 17/2/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRBaseViewController.h"

@interface CRCustomNaviBarView : UIView

@property (assign, nonatomic) BOOL  showBackBtn;

+ (CRCustomNaviBarView *)commonNaviBarViewWithTitle:(NSString *)title inVC:(__weak UIViewController *)inVC;
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title inVC:(__weak UIViewController *)inVC;

- (void)createUI;
- (UIViewController *)getInVC;

@end
