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
    NSArray <CRHeaderButton *> *_memberArray;
}

@end

@implementation CRHeadersView

+ (CRHeadersView *)commonHeasersViewWithMemberArray:(NSArray <CRHeaderButton *> *)memberArray
{
    CRHeadersView *headersView = [[CRHeadersView alloc] initWithMemberArray:memberArray];
    return headersView;
}

- (instancetype)initWithMemberArray:(NSArray <CRHeaderButton *> *)memberArray
{
    self = [super init];
    
    if (self) {
        _memberArray = memberArray;
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
