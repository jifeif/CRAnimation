//
//  ZJCWaveTabarController.h
//  WaveDemo
//
//  Created by 小川 on 2017/3/29.
//  Copyright © 2017年 iXiaoChuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJCWaveTabarController : UITabBarController

// init With themeColor
- (instancetype)initWithThemeColor:(UIColor *)color;
// add Controller
- (void)addViewControllerWithName:(NSString *)viewControllerName andTitle:(NSString *)title andNormalImage:(NSString *)image andSelectedImage:(NSString *)selectedImage;

- (void)addViewControllerWithName:(NSString *)viewControllerName andTitle:(NSString *)title andNormalTitleColor:(UIColor *)titleNormalColor andSelectedTitleColor:(UIColor *)titleSelectColor andNormalImage:(NSString *)image andSelectedImage:(NSString *)selectedImage;

@end
