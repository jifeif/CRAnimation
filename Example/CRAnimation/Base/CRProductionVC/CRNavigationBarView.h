//
//  CRNavigationBarView.h
//  CRAnimation
//
//  Created by Bear on 17/3/15.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRNavigationBarView : UIView

@property (strong, nonatomic) UIButton *backBtn;
@property (strong, nonatomic) UILabel *productionTitleLabel;

- (void)setNaviBarWithTitle:(NSString *)title;

@end
