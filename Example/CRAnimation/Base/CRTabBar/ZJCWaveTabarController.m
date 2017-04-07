//
//  ZJCWaveTabarController.m
//  WaveDemo
//
//  Created by 小川 on 2017/3/29.
//  Copyright © 2017年 iXiaoChuan. All rights reserved.
//

#import "ZJCWaveTabarController.h"
#import "CRBaseNavigationViewController.h"

#import <AudioToolbox/AudioToolbox.h>
#import "HJWWaveView.h"
#import "ReplicatorLineAnimationView.h"
//#import "UIView+HJW.h"

// 波浪颜色
#define ThemeColor [UIColor orangeColor]

@interface ZJCWaveTabarController (){
    SystemSoundID _soundFileObject;
}

@end



@implementation ZJCWaveTabarController
// 初始化方法,需要定制,可以将定制方法剥离出去
- (instancetype)init{
    if (self = [super init]) {
        // 隐藏原生的
        self.tabBar.hidden = NO;
        
        // 搭建自己的
        [self configSelf];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)addViewControllerWithName:(NSString *)viewControllerName andTitle:(NSString *)title andNormalImage:(NSString *)normalImage andSelectedImage:(NSString *)selectedImage{
    // 获取类名,通过类名创建类
    Class class = NSClassFromString(viewControllerName);
    UIViewController * tempVC = [[class alloc] init];
    // 设置基本属性
    tempVC.title = title;
    
    // 设置图片
    UIImage * normalImageOfItem = [UIImage imageNamed:normalImage];
    UIImage * selectImageOfItem = [UIImage imageNamed:selectedImage];
    tempVC.tabBarItem.image = [normalImageOfItem imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tempVC.tabBarItem.selectedImage = [selectImageOfItem imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    tempVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    // 设置标题栏属性
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:10]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:14]} forState:UIControlStateSelected];
    
    // **添加NavigationController导航器
    CRBaseNavigationViewController * navTemp = [[CRBaseNavigationViewController alloc] initWithRootViewController:tempVC];
    NSMutableArray * tempArray = [NSMutableArray arrayWithArray:self.viewControllers];
    [tempArray addObject:navTemp];
    self.viewControllers = tempArray;
}





#pragma mark - 波浪效果 ------------------------------------------------------------------------------------------
- (void)configSelf{
    // 隐藏顶部线(其实是个边线图片)
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];
    
    // 波浪图
    UIView * view = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    [self.tabBar insertSubview:view atIndex:0];
    
    UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, self.tabBar.bounds.size.width, self.tabBar.bounds.size.height - 10)];
    [view addSubview:view1];
    view1.backgroundColor = ThemeColor;
    // wave background
    {
        HJWWaveView *waveView = [[HJWWaveView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 10)];
        waveView.phase     = 0.f;
        waveView.waveCrest = 5.f;
        waveView.waveCount = 1;
        waveView.type      = kStrokeWave | kFillWave;
        
        {
            DrawingStyle *fillStyle = [DrawingStyle new];
            fillStyle.fillColor     = [DrawingColor colorWithUIColor:[ThemeColor colorWithAlphaComponent:0.25f]];
            waveView.fillStyle      = fillStyle;
            
            DrawingStyle *strokeStyle = [DrawingStyle new];
            strokeStyle.strokeColor   = [DrawingColor colorWithUIColor:[ThemeColor colorWithAlphaComponent:0.5f]];
            strokeStyle.lineWidth     = 0.5f;
            waveView.strokeStyle      = strokeStyle;
        }
        
        ReplicatorLineAnimationView *replicatorLineView = [[ReplicatorLineAnimationView alloc] initWithFrame:waveView.bounds];
        replicatorLineView.direction   = kReplicatorLeft;
        replicatorLineView.speed       = 0.1f;
        replicatorLineView.contentView = waveView;
        [replicatorLineView startAnimation];
        [view addSubview:replicatorLineView];
    }
    
    // Wave mid
    {
        HJWWaveView *waveView = [[HJWWaveView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 10)];
        waveView.phase     = 2.0f;
        waveView.waveCrest = 5.f;
        waveView.waveCount = 1;
        waveView.type      = kStrokeWave | kFillWave;
        
        {
            DrawingStyle *fillStyle = [DrawingStyle new];
            fillStyle.fillColor     = [DrawingColor colorWithUIColor:[ThemeColor colorWithAlphaComponent:0.5f]];
            waveView.fillStyle      = fillStyle;
            
            DrawingStyle *strokeStyle = [DrawingStyle new];
            strokeStyle.strokeColor   = [DrawingColor colorWithUIColor:ThemeColor];
            strokeStyle.lineWidth     = 1.f;
            waveView.strokeStyle      = strokeStyle;
        }
        
        ReplicatorLineAnimationView *replicatorLineView = [[ReplicatorLineAnimationView alloc] initWithFrame:waveView.bounds];
        replicatorLineView.direction = kReplicatorLeft;
        replicatorLineView.speed     = 0.5f;
        replicatorLineView.contentView = waveView;
        [replicatorLineView startAnimation];
        [view addSubview:replicatorLineView];
    }
    
    // Wave foreground
    {
        HJWWaveView *waveView = [[HJWWaveView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 10)];
        waveView.phase     = 4.f;
        waveView.waveCrest = 5.f;
        waveView.waveCount = 1;
        waveView.type      = kFillWave;
        
        {
            DrawingStyle *fillStyle = [DrawingStyle new];
            fillStyle.fillColor     = [DrawingColor colorWithUIColor:ThemeColor];
            waveView.fillStyle      = fillStyle;
        }
        
        ReplicatorLineAnimationView *replicatorLineView = [[ReplicatorLineAnimationView alloc] initWithFrame:waveView.bounds];
        replicatorLineView.direction   = kReplicatorLeft;
        replicatorLineView.speed       = 0.2f;
        replicatorLineView.contentView = waveView;
        [replicatorLineView startAnimation];
        [view addSubview:replicatorLineView];
    }
}







#pragma mark - 点击效果 ------------------------------------------------------------------------------------------
- (void)tabBar:(UITabBar*)atabBar didSelectItem:(UITabBarItem*)item{
    // 点击音效
        [self playAudioFileWith:@"sound_press_short" andType:@"wav"];
    // 转场效果
    CATransition* animation = [CATransition animation];
    [animation setDuration:0.5f];
    [animation setType:kCATransitionFade];
    [animation setSubtype:kCATransitionFromTop];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[self.view layer] addAnimation:animation forKey:@"switchView"];
}


// 播放音频
- (void)playAudioFileWith:(NSString *)soundName andType:(NSString *)soundType{
    // 获取路径
    NSURL * fileUrl = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:soundName ofType:soundType]];
    // 系统API播放
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileUrl, &_soundFileObject);
    //    AudioServicesPlaySystemSound(_soundFileObject);
    AudioServicesPlayAlertSound(_soundFileObject);
}




@end
