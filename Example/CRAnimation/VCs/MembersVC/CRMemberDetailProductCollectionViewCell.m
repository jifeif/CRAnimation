//
//  CRMemberDetailProductCollectionViewCell.m
//  CRAnimation
//
//  Created by Bear on 17/2/14.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRMemberDetailProductCollectionViewCell.h"
#import "CRFLAnimatiatedImageView.h"
#import "CRDemoInfoModel.h"

@interface CRMemberDetailProductCollectionViewCell ()
{
    CRFLAnimatiatedImageView    *_imageView;
}

@end

@implementation CRMemberDetailProductCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self createUI];
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
    }
    
    return self;
}

- (void)createUI
{
    _imageView = [[CRFLAnimatiatedImageView alloc] init];
    _imageView.frame = self.bounds;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_imageView];
}

- (void)loadDemoInfoModel:(CRDemoInfoModel *)demoInfoModel
{
    [_imageView setGifImageWithURLStr:demoInfoModel.gifAddress];
}

@end
