//
//  CRDesignProductionBaseVC.m
//  CRAnimation
//
//  Created by Bear on 17/3/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRDesignProductionBaseVC.h"
#import "CRFLAnimatiatedImageView.h"

@interface CRDesignProductionBaseVC ()
{
    CRFLAnimatiatedImageView *_gifImageView;
}
@end

@implementation CRDesignProductionBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI
{
    [super createUI];
    self.view.backgroundColor = color_Master;
    
    [self createGifImageView];
    [self setGifImageViewContent];
}

- (void)createGifImageView
{
    if (!_gifImageView) {
        _gifImageView = [[CRFLAnimatiatedImageView alloc] init];
        _gifImageView.frame = self.contentView.bounds;
        _gifImageView.contentMode = UIViewContentModeScaleAspectFit;
        _gifImageView.clipsToBounds = YES;
        [self.contentView addSubview:_gifImageView];
    }
}

- (void)setGifImageViewContent
{
    if ([CRCommon validateStr:self.demoInfoModel.gifAddress] && _gifImageView) {
        [_gifImageView setGifImageWithURLStr:self.demoInfoModel.gifAddress];
    }
    else if ([CRCommon validateStr:self.demoInfoModel.demoGifName]){
        NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:self.demoInfoModel.demoGifName];
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfFile:path]];
        _gifImageView.animatedImage = image;
    }
}

@end
