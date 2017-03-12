//
//  CRCardCustomViewCell.m
//  CRAnimation
//
//  Created by Bear on 17/3/12.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRCardCustomViewCell.h"

@implementation CRCardCustomViewCell

- (instancetype)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createUI];
    }
    
    return self;
}

- (void)createUI
{
    _contentImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:_contentImageView];
}

@end
