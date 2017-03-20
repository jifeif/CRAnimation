//
//  CRBaseViewController.m
//  CRAnimation
//
//  Created by Bear on 16/10/9.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import "CRBaseViewController.h"


@interface CRBaseViewController ()

@property (strong, nonatomic) MBProgressHUD   *stateHud;

@end

@implementation CRBaseViewController

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (BOOL)hidesBottomBarWhenPushed
{
    if (!_ifHideTabBar) {
        _ifHideTabBar = [NSNumber numberWithBool:YES];
    }
    
    return [_ifHideTabBar boolValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = color_Master;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)createUI
{
        
}

#pragma mark - Rewrite

- (MBProgressHUD *)stateHud
{
    if (!_stateHud) {
        _stateHud = [[MBProgressHUD alloc] initWithView:self.view];
        _stateHud.delegate = self;
        _stateHud.label.font = [UIFont systemFontOfSize:13.0f];
        _stateHud.label.textColor = [UIColor whiteColor];
        _stateHud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        [self.view addSubview:_stateHud];
    }
    
    return _stateHud;
}

#pragma mark - MBProgressHUD

- (void)showHud:(NSString *)text
{
    self.stateHud.mode = MBProgressHUDModeIndeterminate;
    [self.view bringSubviewToFront:self.stateHud];
    
    if (text) {
        self.stateHud.label.text = text;
    }
    
    [self.stateHud showAnimated:YES];
}

- (void)textStateHUD:(NSString *)text
{
    for (UIImageView *imageView in self.stateHud.subviews)
    {
        if ([imageView isKindOfClass:[UIImageView class]])
            imageView.hidden = YES;
    }
    self.stateHud.mode = MBProgressHUDModeText;
    [self.view bringSubviewToFront:self.stateHud];
    self.stateHud.detailsLabel.textColor = [UIColor whiteColor];
    self.stateHud.detailsLabel.text = text;
    self.stateHud.detailsLabel.font = [UIFont systemFontOfSize:13.0f];
    [self.stateHud showAnimated:YES];
    [self.stateHud hideAnimated:YES afterDelay:1.5];
}

- (void)hideHUDView
{
    [self.stateHud hideAnimated:YES afterDelay:0];
}

@end
