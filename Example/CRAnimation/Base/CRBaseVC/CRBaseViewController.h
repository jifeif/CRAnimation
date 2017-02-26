//
//  CRBaseViewController.h
//  CRAnimation
//
//  Created by Bear on 16/10/9.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface CRBaseViewController : UIViewController <MBProgressHUDDelegate>

@property (strong, nonatomic) NSNumber      *ifHideTabBar;

- (void)createUI;

- (void)showHud:(NSString *)text;
- (void)textStateHUD:(NSString *)text;
- (void)hideHUDView;

@end
