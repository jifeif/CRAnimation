//
//  CRAppDelegate.m
//  CRAnimation
//
//  Created by BearRan on 10/07/2016.
//  Copyright (c) 2016 BearRan. All rights reserved.
//
    
#import "CRAppDelegate.h"
#import "CRBaseNavigationViewController.h"
#import "CRBaseTabBarController.h"

#import "CRCodeAnimationVC.h"
#import "CRCodeWidgetVC.h"
#import "CRDesignerStageVC.h"
#import "CRMembersVC.h"

@implementation CRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [self initSetTabbarVC];
    
    return YES;
}

- (void)initSetTabbarVC
{
    //  CRCodeAnimationVC
    CRCodeAnimationVC *codeAnimationVC = [[CRCodeAnimationVC alloc] init];
    CRBaseNavigationViewController *codeAnimationNaviVC = [[CRBaseNavigationViewController alloc] initWithRootViewController:codeAnimationVC];
    
    //  CRCodeWidgetVC
//    CRCodeWidgetVC *codeWidgetVC = [[CRCodeWidgetVC alloc] init];
//    CRBaseNavigationViewController *codeWidgetNaviVC = [[CRBaseNavigationViewController alloc] initWithRootViewController:codeWidgetVC];
    
    //  CRDesignerStageVC
    CRDesignerStageVC *designerStageVC = [[CRDesignerStageVC alloc] init];
    CRBaseNavigationViewController *designerStageNaviVC = [[CRBaseNavigationViewController alloc] initWithRootViewController:designerStageVC];
    
    //  CRMemberFileVC
    CRMembersVC *memberVC = [[CRMembersVC alloc] init];
    CRBaseNavigationViewController *memberNaviVC = [[CRBaseNavigationViewController alloc] initWithRootViewController:memberVC];
    
    //  baseTabBarVC
    NSMutableArray *tabbarControllers = [[NSMutableArray alloc] initWithObjects:
                                         codeAnimationNaviVC,
//                                         codeWidgetNaviVC,
                                         designerStageNaviVC,
                                         memberNaviVC,
                                         nil];
    CRBaseTabBarController *baseTabBarVC = [[CRBaseTabBarController alloc] initWithViewControllers:tabbarControllers];
    
    
    //  rootVC
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = baseTabBarVC;
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
