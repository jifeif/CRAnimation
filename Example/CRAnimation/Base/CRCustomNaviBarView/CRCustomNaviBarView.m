//
//  CRCustomNaviBarView.m
//  CRAnimation
//
//  Created by Bear on 17/2/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRCustomNaviBarView.h"

@interface CRCustomNaviBarView ()
{
    UILabel     *_titleLabel;
    NSString    *_titleStr;
    UIButton    *_backBtn;
    CRBaseViewController    *_inVC;
}

@end

@implementation CRCustomNaviBarView

+ (CRCustomNaviBarView *)commonNaviBarViewWithTitle:(NSString *)title inVC:(__weak CRBaseViewController *)inVC
{
    CRCustomNaviBarView *naviBarView = [[CRCustomNaviBarView alloc] initWithFrame:CGRectMake(0, STATUS_HEIGHT, WIDTH, NAV_44) title:title inVC:inVC];
    return naviBarView;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title inVC:(__weak CRBaseViewController *)inVC
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _titleStr = title;
        _inVC = inVC;
        [self createUI];
        
        self.showBackBtn = YES;
    }
    
    return self;
}

- (void)createUI
{
    _titleLabel = [UILabel new];
    _titleLabel.text = _titleStr;
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:_titleLabel];
    
    CGFloat backBtn_width = self.height;
    _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, backBtn_width, backBtn_width)];
    [_backBtn setImage:[UIImage imageNamed:@"nav_btn_return"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(backBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_backBtn];
    [_backBtn BearSetRelativeLayoutWithDirection:kDIR_LEFT destinationView:nil parentRelation:YES distance:10 center:YES];
}

- (void)relayUI
{
    [_titleLabel sizeToFit];
    [_titleLabel BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self relayUI];
}


#pragma mark - btnEvent

- (void)backBtnEvent
{
    if (!_inVC) {
        return;
    }
    
    [_inVC.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Rewrite

- (void)setShowBackBtn:(BOOL)showBackBtn
{
    _showBackBtn = showBackBtn;
    
    _backBtn.hidden = !_showBackBtn;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
