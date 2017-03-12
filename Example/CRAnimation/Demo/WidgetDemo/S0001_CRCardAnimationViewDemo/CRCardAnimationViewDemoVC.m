//
//  CRCardAnimationViewDemoVC.m
//  CRAnimation
//
//  Created by Bear on 16/10/11.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import "CRCardAnimationViewDemoVC.h"
#import <CRAnimation/CRCardAnimationView.h>
#import "CRCardCustomViewCell.h"

@interface CRCardAnimationViewDemoVC () <CardAnimationViewDelegate>
{
    
    CRCardAnimationView *_cardAnimationView;
    NSArray             *_imageNameArray;
}

@end

@implementation CRCardAnimationViewDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    [self addTopBarWithTitle:@"CRCardAnimation"];
}

- (void)createUI
{
    [super createUI];
    self.view.backgroundColor = color_Master;
    
    _imageNameArray = @[@"S0001TestImage_1",
                        @"S0001TestImage_2",
                        @"S0001TestImage_3",
                        @"S0001TestImage_2",
                        ];
    
    _cardAnimationView = [[CRCardAnimationView alloc] initWithFrame:CGRectMake(0, NAV_STA, WIDTH, HEIGHT - NAV_STA)];
    _cardAnimationView.delegate = self;
    _cardAnimationView.backgroundColor = color_323341;
    _cardAnimationView.cardShowInView_Count = 3;
    _cardAnimationView.cardOffSetPoint = CGPointMake(0, 30);
    _cardAnimationView.cardScaleRatio  = 0.09;
    _cardAnimationView.cardCycleShow = YES;
    [self.view addSubview:_cardAnimationView];
}

#pragma mark - CardAnimationView delegate

- (CRCardViewCell *)cardViewInCardAnimationView:(CRCardAnimationView *)cardAnimationView Index:(int)index
{
    CGFloat cardView_width = (1.0 * 540 / 640) * WIDTH;
    CGFloat cardView_height = (1.0 * 811 / 1134) * HEIGHT;
    NSString *cardViewID_Str = @"cardViewID_Str";
    
    CRCardCustomViewCell *cardView = (CRCardCustomViewCell *)[cardAnimationView dequeueReusableCardViewCellWithIdentifier:cardViewID_Str];
    if (!cardView) {
        cardView = [[CRCardCustomViewCell alloc] initWithFrame:CGRectMake(0, 0, cardView_width, cardView_height) reuseIdentifier:cardViewID_Str];
        cardView.layer.cornerRadius = 7.0f;
        cardView.layer.masksToBounds = YES;
    }
    
    cardView.backgroundColor = UIColorFromHEX(0x494fa5);
    if (index < [_imageNameArray count]) {
        cardView.contentImageView.image = [UIImage imageNamed:_imageNameArray[index]];
    }
    
    return cardView;
}

- (NSInteger)numberOfCardsInCardAnimationView:(CRCardAnimationView *)cardAnimationView
{
    return [_imageNameArray count];
}

- (void)cardViewWillDisappearWithCardViewCell:(CRCardViewCell *)cardViewCell Index:(NSInteger)index
{
//    NSLog(@"will disappear index:%ld", (long)index);
}

- (void)cardViewWillShowInTopWithCardViewCell:(CRCardViewCell *)cardViewCell Index:(NSInteger)index
{
//    NSLog(@"will show index:%ld", (long)index);
}

@end
