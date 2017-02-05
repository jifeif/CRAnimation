//
//  CRTabBarRootShowVC.m
//  CRAnimation
//
//  Created by Bear on 17/2/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRTabBarRootShowVC.h"

@interface CRTabBarRootShowVC ()

@end

@implementation CRTabBarRootShowVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
