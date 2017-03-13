//
//  HZLaunchViewDemoVC.m
//  CRAnimation
//
//  Created by zz go on 2016/10/27.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import <CRAnimation/HZLaunchView.h>
#import "HZLaunchViewDemoVC.h"

@interface HZLaunchViewDemoVC ()

@end

@implementation HZLaunchViewDemoVC

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self createUI];
    [self addTopBarWithTitle:@"HZLaunchView"];
}

-(void)createUI{
    [super createUI];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"img_HZBg"];
    [self.view insertSubview:imageView atIndex:0];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UIColor *twitterBgcolor = [UIColor orangeColor];
    UIImage *twitterImage = [UIImage imageNamed:@"icon_HZRunningMan"];
    
    HZLaunchView *launchView = [[HZLaunchView alloc] initWithIconImage:twitterImage backgroundColor:twitterBgcolor];
    [self.view addSubview:launchView];
    [launchView startAnimationWithDuration:3];
}



@end
