//
//  CRItemBriefCollectionViewCell.m
//  CRAnimation
//
//  Created by Bear on 16/10/12.
//  Copyright © 2016年 BearRan. All rights reserved.
//

#import "CRItemBriefCollectionViewCell.h"
#import "CRFLAnimatiatedImageView.h"

@interface CRItemBriefCollectionViewCell ()
{
    CRFLAnimatiatedImageView     *_imageView;
    
    UIView                  *_labelView;
    UIView                  *_sepLineV;
    UILabel                 *_namelabel;
    UILabel                 *_summaryLabel;
}

@end

@implementation CRItemBriefCollectionViewCell

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
    CGFloat off_x = 5;
    
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    
    _imageView = [[CRFLAnimatiatedImageView alloc] init];
    _imageView.frame = self.bounds;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.layer.masksToBounds = YES;
    [self addSubview:_imageView];
    
    _labelView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 55)];
    _labelView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_labelView];
    
    _sepLineV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _labelView.width, 0.5)];
    _sepLineV.backgroundColor = color_e5e5e5;
    [_labelView addSubview:_sepLineV];
    
    _namelabel = [UILabel new];
    _namelabel.textColor = color_333333;
    _namelabel.text = @" ";
    _namelabel.font = [UIFont systemFontOfSize:15];
    [_namelabel sizeToFit];
    [_namelabel setWidth:self.width - 2 * off_x];
    [_labelView addSubview:_namelabel];
    
    _summaryLabel = [UILabel new];
    _summaryLabel.textColor = color_9a9ba9;
    _summaryLabel.text = @" ";
    _summaryLabel.font = [UIFont systemFontOfSize:10];
    [_summaryLabel sizeToFit];
    [_summaryLabel setWidth:self.width - 2 * off_x];
    [_labelView addSubview:_summaryLabel];
    
    [_labelView BearSetRelativeLayoutWithDirection:kDIR_DOWN destinationView:nil parentRelation:YES distance:0 center:NO];
    [UIView BearV2AutoLayViewArray:(NSMutableArray *)@[_namelabel, _summaryLabel] layoutAxis:kLAYOUT_AXIS_Y alignmentType:kSetAlignmentType_Center alignmentOffDis:0 gapAray:@[@30, @22, @18]];
}

- (void)loadDemoInfoModel:(CRDemoInfoModel *)demoInfoModel
{
    if ([CRCommon validateStr:demoInfoModel.gifAddress]) {
        [_imageView setGifImageWithURLStr:demoInfoModel.gifAddress];
    }
    else if ([CRCommon validateStr:demoInfoModel.demoGifName]){
        NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:demoInfoModel.demoGifName];
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfFile:path]];
        _imageView.animatedImage = image;
    }
    
    _namelabel.text = demoInfoModel.demoName;
    _summaryLabel.text = demoInfoModel.demoSummary;
}

@end
