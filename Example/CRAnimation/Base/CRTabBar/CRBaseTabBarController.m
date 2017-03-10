//
//  CRBaseTabBarController.m
//  CRAnimation
//
//  Created by Bear on 17/2/5.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseTabBarController.h"

@interface CRBaseTabBarController ()

@end

@implementation CRBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithViewControllers:(NSMutableArray *)viewControllers
{
    self = [super init];
    if (self)
    {
        [self setViewControllers:viewControllers];
        
        UITabBar *tabBar = self.tabBar;
//        [tabBar setShadowImage:[UIImage imageWithColor:UIColorFromHEX(0xe2e2e2)]];
//        [tabBar setBackgroundImage:[UIImage imageWithColor:UIColorFromHEX(0xf9f9f9)]];
//        tabBar.height = 98.f;
//        tabBar.selectedImageTintColor = color_Master;
//#ifdef color_Special_Tab2
//        tabBar.selectedImageTintColor = color_Special_Tab2;
//#endif
//        
//        
        NSArray *titleArr = @[@"动效体验",
//                              @"精巧控件",
                              @"动效原型",
                              @"成员档案"];
        
        NSArray *unSelectImageArr = @[@"tab_btn_index_n",
//                                      @"tab_btn_control_n",
                                      @"tab_btn_prototype_n",
                                      @"tab_btn_member_n"];
        
        NSArray *selectImageArr = @[@"tab_btn_index_s",
//                                    @"tab_btn_control_s",
                                    @"tab_btn_prototype_s",
                                    @"tab_btn_member_s"];
        
        for (NSInteger i = 0; i < tabBar.items.count; i++) {
            UITabBarItem *tabBarItem = [tabBar.items objectAtIndex:i];
            [tabBarItem setImage:[UIImage imageNamed:unSelectImageArr[i]]];
            [tabBarItem setSelectedImage:[UIImage imageNamed:selectImageArr[i]]];
//            tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
            tabBarItem.title = titleArr[i];
        }
//
//        UIFont *titleFont = [UIFont systemFontOfSize:10];
//        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                           color_555d62, NSForegroundColorAttributeName,
//                                                           titleFont, NSFontAttributeName,
//                                                           nil] forState:UIControlStateNormal];
//        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//#ifdef color_Special_Tab2
//                                                           color_Special_Tab2, NSForegroundColorAttributeName,
//#else
//                                                           color_Master, NSForegroundColorAttributeName,
//#endif
//                                                           titleFont, NSFontAttributeName,
//                                                           nil] forState:UIControlStateHighlighted];
//        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//#ifdef color_Special_Tab2
//                                                           color_Special_Tab2, NSForegroundColorAttributeName,
//#else
//                                                           color_Master, NSForegroundColorAttributeName,
//#endif
//                                                           titleFont, NSFontAttributeName,
//                                                           nil] forState:UIControlStateSelected];
        
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
