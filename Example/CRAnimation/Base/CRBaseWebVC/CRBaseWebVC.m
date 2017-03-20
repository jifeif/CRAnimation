//
//  CRBaseWebVC.m
//  CRAnimation
//
//  Created by Bear on 17/3/14.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseWebVC.h"
#import "CRCustomNaviBarView.h"

@interface CRBaseWebVC ()

@end

@implementation CRBaseWebVC

- (instancetype)initWithURL:(NSURL *)url
{
    self = [super initWithURL:url];
    
    if (self) {
    
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    return;
    __weak typeof(self) weakSelf = self;
    CRCustomNaviBarView *naviBarView = [CRCustomNaviBarView commonNaviBarViewWithTitle:@"个人主页" inVC:weakSelf];
    [self.view addSubview:naviBarView];
    [self.webView setY:naviBarView.maxX];
    [self.webView setHeight:HEIGHT - naviBarView.maxY];
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
