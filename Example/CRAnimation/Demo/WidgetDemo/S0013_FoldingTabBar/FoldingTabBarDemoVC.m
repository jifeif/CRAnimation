//
//  FoldingTabBarDemoVC.m
//  CRAnimation
//
//  Created by Bear on 17/4/21.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "FoldingTabBarDemoVC.h"
#import "YALFoldingTabBarController.h"
#import "YALTabBarItem.h"
#import <BearSkill/BearConstants.h>

@interface FoldingTabBarDemoVC ()

@end

@implementation FoldingTabBarDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTopBarWithTitle:@"FoldingTabBar"];
    [self createUI];
}

- (void)createUI
{
    [super createUI];
    [self createTabBarVC];
}

- (void)createTabBarVC
{
    YALFoldingTabBarController *tabBarController = [[YALFoldingTabBarController alloc] init];
    
    //prepare leftBarItems
    YALTabBarItem *item1 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"nearby_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];
    
    
    YALTabBarItem *item2 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"profile_icon"]
                                                      leftItemImage:[UIImage imageNamed:@"edit_icon"]
                                                     rightItemImage:nil];
    
    tabBarController.leftBarItems = @[item1, item2];
    
    //prepare rightBarItems
    YALTabBarItem *item3 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"chats_icon"]
                                                      leftItemImage:[UIImage imageNamed:@"search_icon"]
                                                     rightItemImage:[UIImage imageNamed:@"new_chat_icon"]];
    
    
    YALTabBarItem *item4 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"settings_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];
    tabBarController.rightBarItems = @[item3, item4];
    
    for (int i = 0; i < 4; i++) {
        CRProductionBaseVC *testVC = [[CRProductionBaseVC alloc] init];
        testVC.view.backgroundColor = [BearConstants randomColor];
    }
//    self.view.window.rootViewController = tabBarController;
//    return;
    
    tabBarController.view.frame = self.contentView.bounds;
    [self addChildViewController:tabBarController];
    [self.contentView addSubview:tabBarController.view];
}

@end
