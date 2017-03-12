//
//  CRSlider.m
//  CRAnimation
//
//  Created by Bear on 17/3/12.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRSlider.h"

@implementation CRSlider

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
}

- (void)setSliderType:(CRSliderType)sliderType
{
    _sliderType = sliderType;
    
    if (_sliderType == kCRSliderType_Normal) {
        [self setNormalType];
    }
}

- (void)setNormalType
{
    [self setThumbImage:[UIImage imageNamed:@"icon_CRSliderNormal"] forState:UIControlStateNormal];
    self.minimumTrackTintColor = color_8c2424;
    self.maximumTrackTintColor = color_8c2424;
//    self.backgroundColor = [UIColor whiteColor];
//    self.layer.shadowColor = [UIColor whiteColor].CGColor;
//    self.layer.shadowOpacity = 1;
//    self.layer.shadowRadius = 10;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
