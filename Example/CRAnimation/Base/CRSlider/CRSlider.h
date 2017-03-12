//
//  CRSlider.h
//  CRAnimation
//
//  Created by Bear on 17/3/12.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kCRSliderType_Normal,
}CRSliderType;

@interface CRSlider : UISlider

@property (assign, nonatomic) CRSliderType sliderType;

@end
