//
//  CRMemeberTagsView.m
//  CRAnimation
//
//  Created by Bear on 17/3/14.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRMemeberTagsView.h"

@interface CRMemeberTagsView ()
{
    NSArray *_tagsArray;
}

@end

@implementation CRMemeberTagsView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (void)setTagString:(NSString *)string
{
    //  clean
    for (UIView *oldView in self.subviews) {
        [oldView removeFromSuperview];
    }
    
    _tagsArray = [string componentsSeparatedByString:@"|"];
    if (_tagsArray && [_tagsArray count] > 0) {
        
        CGFloat offX = 24;
        CGFloat gapX = 14;
        CGFloat gapY = 5;
        CGFloat maxX = offX;
        CGFloat maxY = 0;
        [self setWidth:WIDTH];
        for (int i = 0; i < [_tagsArray count]; i++) {
            
            if ([_tagsArray[i] isKindOfClass:[NSString class]]) {
                UILabel *label = [self generateLabelWithStr:_tagsArray[i]];
                [label setX:maxX];
                
                if (label.maxX + gapX > self.width) {
                    [label setX:offX];
                    maxY += label.height;
                }
                
                [label setY:maxY];
                maxX = label.maxX + gapX;
                [self addSubview:label];
                
                //  最后一个label
                if (i == [_tagsArray count] - 1) {
                    maxY += label.height;
                }
            }
        }
        [self setHeight:maxY];
    }
}

- (UILabel *)generateLabelWithStr:(NSString *)str
{
    UILabel *label = [UILabel new];
    label.text = str;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = FontSize(14);
    label.layer.borderColor = [UIColor whiteColor].CGColor;
    label.layer.cornerRadius = 5;
    label.layer.borderWidth = 1;
    [label sizeToFit];
    [label setWidth:label.width + 20];
    [label setHeight:label.height + 12];
    
    return label;
}

@end
