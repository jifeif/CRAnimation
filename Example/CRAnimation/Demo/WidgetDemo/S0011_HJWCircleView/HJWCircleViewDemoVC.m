//
//  HJWCircleViewDemoVC.m
//  CRAnimation
//
//  Created by Lemon_Mr.H on 2017/3/30.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "HJWCircleViewDemoVC.h"
#import <CRAnimation/HJWCircleView.h>

@interface HJWCircleViewDemoVC ()

@end

@implementation HJWCircleViewDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addFloatViews];
    [self addTopBarWithTitle:@"HJWCircleFloat"];
}

- (void)addFloatViews {
    /**
     Use:
     1. New A HJWCircleView Class,
     2. Set Color,
     3. AddAniamtionLikeGameCenterBubble
     */
    {
        HJWCircleView * circle = [[HJWCircleView alloc] initWithFrame:CGRectMake(80, self.view.centerY / 2 + 80, 35, 35)];
        circle.color = UIColorFromHEX(0x57d0c9);
        [circle addAniamtionLikeGameCenterBubble];
        [self.view addSubview:circle];
    }
    
    {
        HJWCircleView * circle = [[HJWCircleView alloc] initWithFrame:CGRectMake(-35 / 2, self.view.centerY / 2 + 44, 35, 35)];
        circle.color = UIColorFromHEX(0x57d0c9);
        [circle addAniamtionLikeGameCenterBubble];
        [self.view addSubview:circle];
    }
    
    {
        HJWCircleView * circle = [[HJWCircleView alloc] initWithFrame:CGRectMake(120, self.view.centerY / 2 + 40, 20, 20)];
        circle.color = UIColorFromHEX(0x5bd6ce);
        [circle addAniamtionLikeGameCenterBubble];
        [self.view addSubview:circle];
    }
    
    {
        HJWCircleView * circle = [[HJWCircleView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 25 / 2, self.view.centerY / 2 + 175, 25, 25)];
        circle.color = UIColorFromHEX(0x57d0c9);
        [circle addAniamtionLikeGameCenterBubble];
        [self.view addSubview:circle];
    }
    
    {
        HJWCircleView * circle = [[HJWCircleView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 45, self.view.centerY / 2 + 50, 90, 90)];
        circle.color = UIColorFromHEX(0x5bd6ce);
        [circle addAniamtionLikeGameCenterBubble];
        [self.view addSubview:circle];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
