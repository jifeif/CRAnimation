//
//  CRTestLTMorphingViewController.m
//  CRAnimation
//
//  Created by Bear on 17/4/26.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRTestLTMorphingViewController.h"

@interface CRTestLTMorphingViewController ()
{
    
}

@end

@implementation CRTestLTMorphingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    [super createUI];
    
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 400, 300)];
    pushBtn.backgroundColor = [UIColor orangeColor];
    [pushBtn addTarget:self action:@selector(pushBtnEvent_Present) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:pushBtn];
    [pushBtn BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}

- (void)pushBtnEvent_Present
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"LTMorphingLabelDemo" bundle:nil];
    UIViewController *vc = [storyBoard instantiateInitialViewController];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)pushBtnEvent_Push
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"LTMorphingLabelDemo" bundle:nil];
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"LTMorphingLabelDemoID"];
    [self.navigationController pushViewController:vc animated:YES];
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
