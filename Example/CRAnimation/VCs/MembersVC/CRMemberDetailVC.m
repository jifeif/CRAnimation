//
//  CRMemberDetailVC.m
//  CRAnimation
//
//  Created by Bear on 17/2/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRMemberDetailVC.h"
#import "CRCustomNaviBarView.h"

@interface CRMemberDetailVC ()
{
    CRCustomNaviBarView *_naviBarView;
}

@end

@implementation CRMemberDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = color_323341;
    
    __weak typeof(self) weakSelf = self;
    _naviBarView = [CRCustomNaviBarView commonNaviBarViewWithTitle:@"个人详情" inVC:weakSelf];
    [self.view addSubview:_naviBarView];
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
