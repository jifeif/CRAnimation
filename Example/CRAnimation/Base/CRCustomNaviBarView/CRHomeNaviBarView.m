//
//  CRHomeNaviBarView.m
//  CRAnimation
//
//  Created by Bear on 17/2/15.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRHomeNaviBarView.h"

@interface CRHomeNaviBarView ()

@end

@implementation CRHomeNaviBarView

+ (CRHomeNaviBarView *)commonNaviBarViewWithTitle:(NSString *)title inVC:(__weak CRBaseViewController *)inVC
{
    CRHomeNaviBarView *naviBarView = [[CRHomeNaviBarView alloc] initWithFrame:CGRectMake(0, STATUS_HEIGHT, WIDTH, NAV_44) title:title inVC:inVC];
    return naviBarView;
}

- (void)createUI
{
    [super createUI];
    
    self.showBackBtn = NO;
    
    CGFloat shareBtn_width = self.height;
    UIButton *shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, shareBtn_width, shareBtn_width)];
    [shareBtn setImage:[UIImage imageNamed:@"Nav_btn_share"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    //[self addSubview:shareBtn];
    //[shareBtn BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:nil parentRelation:YES distance:10 center:YES];
}


#pragma mark - BtnEvent

- (void)shareBtnEvent
{
    NSLog(@"--shareBtnEvent");
}

@end
