//
//  CRNavigationBarView.m
//  CRAnimation
//
//  Created by Bear on 17/3/15.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRNavigationBarView.h"

@interface CRNavigationBarView ()
{
    
}

@end

@implementation CRNavigationBarView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.frame = CGRectMake(0, STATUS_HEIGHT, WIDTH, 40);
        [self setNaviBarWithTitle:nil];
    }
    
    return self;
}

- (void)setNaviBarWithTitle:(NSString *)title
{
    [self createTitleLabelWithTitle:title];
    [self createBackBtn];
    
    [self relayTopBarContentsUI];
}

- (void)createTitleLabelWithTitle:(NSString *)title
{
    if (!title) {
        title = @"";
    }
    if (!_productionTitleLabel) {
        _productionTitleLabel = [UILabel new];
        _productionTitleLabel.textColor = [UIColor whiteColor];
        _productionTitleLabel.font = FontSize_6(18);
        _productionTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_productionTitleLabel];
    }
    _productionTitleLabel.text = title;
}

- (void)createBackBtn
{
    if (!_backBtn) {
        
        UIImage *backImage = [[UIImage imageNamed:@"nav_btn_close"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:backImage forState:UIControlStateNormal];
        [_backBtn sizeToFit];
        [self addSubview:_backBtn];
    }
}


#pragma mark - relayUI

- (void)relayTopBarContentsUI
{
    [_backBtn BearSetRelativeLayoutWithDirection:kDIR_LEFT destinationView:nil parentRelation:YES distance:CR_OFF_STARTX center:YES];
    
    [_productionTitleLabel sizeToFit];
    [_productionTitleLabel setWidth:self.width - 2 * _backBtn.maxX - 20];
    [_productionTitleLabel BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}


@end
