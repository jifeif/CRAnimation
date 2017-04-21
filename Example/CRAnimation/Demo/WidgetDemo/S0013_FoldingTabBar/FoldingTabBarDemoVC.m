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
#import "YALAnimatingTabBarConstants.h"
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
    
    //  Custom Config
    tabBarController.selectedIndex = 2;
    tabBarController.centerButtonImage = [UIImage imageNamed:@"plus_icon"];
    tabBarController.tabBarView.tabBarColor = [UIColor colorWithRed:72.f/255.f green:211.f/255.f blue:178.f/255.f alpha:1.f];
    tabBarController.tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
    tabBarController.tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset;
    tabBarController.tabBarView.state = YALTabBarStateCollapsed;
    tabBarController.tabBarView.tabBarViewEdgeInsets = UIEdgeInsetsMake(0, 14.f, 7.f, 14.f);
    tabBarController.tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;
    
    //  ViewControllers
    NSMutableArray *viewControllers = [NSMutableArray new];
    for (int i = 0; i < 4; i++) {
        CRProductionBaseVC *testVC = [[CRProductionBaseVC alloc] init];
        testVC.view.backgroundColor = [BearConstants randomColor];
        [viewControllers addObject:testVC];
    }
    tabBarController.viewControllers = viewControllers;
    
    tabBarController.view.frame = self.contentView.bounds;
    [self addChildViewController:tabBarController];
    [self.contentView addSubview:tabBarController.view];
}

@end
