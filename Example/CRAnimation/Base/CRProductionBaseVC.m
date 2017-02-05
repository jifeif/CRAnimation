//
//  CRProductionBaseVC.m
//  CRAnimation
//
//  Created by Bear on 17/2/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRProductionBaseVC.h"

@interface CRProductionBaseVC ()
{
    UIButton    *_backBtn;
    UIView      *_topBarView;
}

@end

@implementation CRProductionBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _backBtnColor = [UIColor whiteColor];
}

- (void)createUI
{
    [super createUI];
    
    [self addTopBar];
}

- (void)addTopBar
{
    if (!_topBarView) {
        _topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, STATUS_HEIGHT, WIDTH, 40)];
        [self.view addSubview:_topBarView];
    }
    
    if (!_backBtn) {
        
        UIImage *backImage = [[UIImage imageNamed:@"back_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:backImage forState:UIControlStateNormal];
        [_backBtn setTintColor:_backBtnColor];
        [_backBtn sizeToFit];
        [_backBtn addTarget:self action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
        [_topBarView addSubview:_backBtn];
        [_backBtn BearSetRelativeLayoutWithDirection:kDIR_LEFT destinationView:nil parentRelation:YES distance:15 center:YES];
    }
}

- (void)popSelf
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setBackBtnColor:(UIColor *)backBtnColor
{
    _backBtnColor = backBtnColor;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(7, (44-69/3.0)/2.0, 48/3.0, 69/3.0)];
    [imageView setImage:[[UIImage imageNamed:@"share_iconShare"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    imageView.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
