//
//  CRImageGradientDemoVC.m
//  CRAnimation
//
//  Created by Bear on 16/10/9.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import "CRImageGradientDemoVC.h"
#import <CRAnimation/CRImageGradientView.h>

@interface CRImageGradientDemoVC ()
{
    NSArray             *_imageNameArray;
    int                 _indexNow;
    dispatch_queue_t    _queue;
    dispatch_source_t   _timer;
}

@property (strong, nonatomic) CRImageGradientView *imageGradientView;

@end

@implementation CRImageGradientDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    [self addTopBarWithTitle:@"CRImageGradient"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self start];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self finishTimer];
}

- (void)createUI
{
    [super createUI];
    
    _indexNow = -1;
    _imageNameArray = @[@"S0002TestImage_1",
                        @"S0002TestImage_2",
                        @"S0002TestImage_3",
                        ];
    
    _imageGradientView = [[CRImageGradientView alloc] initWithFrame:self.contentView.bounds];
    _imageGradientView.animationDuration_EX = 1.0f;
    [self.contentView addSubview:_imageGradientView];
    
    [self createTimer];
}

- (NSString *)getNextImageName
{
    _indexNow++;
    if (_indexNow > [_imageNameArray count] - 1) {
        _indexNow = 0;
    }
    
    return _imageNameArray[_indexNow];
}

- (void)createTimer
{
    __weak typeof(self) weakSelf = self;
    CGFloat duration = 1.3f;   //间隔时间
    
    if (!_queue) {
        _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    
    if (!_timer) {
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _queue);
        dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, duration * NSEC_PER_SEC, 0);
        dispatch_source_set_event_handler(_timer, ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSString *nextImageName = [weakSelf getNextImageName];
                [weakSelf.imageGradientView setNextImageName:nextImageName];
                
                NSLog(@"nextImageName:%@", nextImageName);
            });
            
        });
    }
}

- (void)start
{
    dispatch_resume(_timer);
}

- (void)stop
{
    dispatch_suspend(_timer);
}

- (void)finishTimer
{
    dispatch_source_cancel(_timer);
}

- (void)dealloc
{
    [self finishTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
