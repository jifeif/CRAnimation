//
//  HJWCircleViewDemoVC.m
//  CRAnimation
//
//  Created by Lemon_Mr.H on 2017/3/30.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "HJWCircleViewDemoVC.h"
#import <CRAnimation/HJWCircleView.h>

@implementation UIColor (hjw)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end


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
        circle.color = [UIColor colorWithHexString:@"57d0c9" alpha:1.f] ;
        [circle addAniamtionLikeGameCenterBubble];
        [self.view addSubview:circle];
    }
    
    {
        HJWCircleView * circle = [[HJWCircleView alloc] initWithFrame:CGRectMake(-35 / 2, self.view.centerY / 2 + 44, 35, 35)];
        circle.color = [UIColor colorWithHexString:@"57d0c9" alpha:1.f] ;
        [circle addAniamtionLikeGameCenterBubble];
        [self.view addSubview:circle];
    }
    
    {
        HJWCircleView * circle = [[HJWCircleView alloc] initWithFrame:CGRectMake(120, self.view.centerY / 2 + 40, 20, 20)];
        circle.color = [UIColor colorWithHexString:@"5bd6ce" alpha:1.f] ;
        [circle addAniamtionLikeGameCenterBubble];
        [self.view addSubview:circle];
    }
    
    {
        HJWCircleView * circle = [[HJWCircleView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 25 / 2, self.view.centerY / 2 + 175, 25, 25)];
        circle.color = [UIColor colorWithHexString:@"57d0c9" alpha:1.f] ;
        [circle addAniamtionLikeGameCenterBubble];
        [self.view addSubview:circle];
    }
    
    {
        HJWCircleView * circle = [[HJWCircleView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 45, self.view.centerY / 2 + 50, 90, 90)];
        circle.color = [UIColor colorWithHexString:@"5bd6ce" alpha:1.f] ;
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
