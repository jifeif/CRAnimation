//
//  CRHeadersView.m
//  CRAnimation
//
//  Created by Bear on 17/2/9.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRHeadersView.h"

@interface CRHeadersView ()
{
    NSArray <CRHeaderButton *> *_staffArray;
}

@end

@implementation CRHeadersView

+ (CRHeadersView *)commonHeasersViewWithStaffArray:(NSArray <CRHeaderButton *> *)staffArray
{
    CRHeadersView *headersView = [[CRHeadersView alloc] initWithStaffArray:staffArray];
    return headersView;
}

- (instancetype)initWithStaffArray:(NSArray <CRHeaderButton *> *)staffArray
{
    self = [super init];
    
    if (self) {
        _staffArray = staffArray;
        [self createUI];
    }
    
    return self;
}

- (void)createUI
{
    self.frame = CGRectMake(0, 0, XX_6N(100), XX_6N(100));
    self.layer.cornerRadius = self.width / 2.0;
    self.backgroundColor = [UIColor orangeColor];
}

@end
