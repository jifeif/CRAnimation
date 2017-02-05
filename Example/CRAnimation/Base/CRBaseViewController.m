//
//  CRBaseViewController.m
//  CRAnimation
//
//  Created by Bear on 16/10/9.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import "CRBaseViewController.h"


@interface CRBaseViewController ()
{

}

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

- (void)createUI
{
        
}


@end
