//
//  CRBaseWebVC.m
//  CRAnimation
//
//  Created by Bear on 17/3/14.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRBaseWebVC.h"

@interface CRBaseWebVC ()

@end

@implementation CRBaseWebVC

- (instancetype)initWithUrl:(NSURL *)url
{
    self = [super initWithUrl:url];
    
    if (self) {
        
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
