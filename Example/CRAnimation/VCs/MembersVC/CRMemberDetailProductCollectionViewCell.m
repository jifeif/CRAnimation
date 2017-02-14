//
//  CRMemberDetailProductCollectionViewCell.m
//  CRAnimation
//
//  Created by Bear on 17/2/14.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRMemberDetailProductCollectionViewCell.h"
#import "CRFLAnimatiatedImageView.h"

@interface CRMemberDetailProductCollectionViewCell ()
{
    FLAnimatedImage             *_image;
    CRFLAnimatiatedImageView    *_imageView;
}

@end

@implementation CRMemberDetailProductCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self createUI];
    }
    
    return self;
}

- (void)createUI
{
    _imageView = [[CRFLAnimatiatedImageView alloc] init];
    _imageView.frame = self.bounds;
    [self addSubview:_imageView];
}

- (void)loadDemoInfoModel:(CRDemoBriefDemoInfo *)demoInfoModel
{
//    NSURL *gifAddressUrl = [NSURL URLWithString:demoInfoModel.gifAddress];
//    NSData *gifData = [NSData dataWithContentsOfURL:gifAddressUrl];
//    NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:demoInfoModel.demoGifName];
//    _image = [FLAnimatedImage animatedImageWithGIFData:gifData];
//    _imageView.animatedImage = _image;
    [_imageView setGifImageWithURLStr:demoInfoModel.gifAddress];
}

@end
