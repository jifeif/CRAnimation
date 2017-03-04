//
//  CRParticipateMemberCollectionCell.m
//  CRAnimation
//
//  Created by Bear on 17/2/15.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRParticipateMemberCollectionCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CRParticipateMemberCollectionCell ()
{
    UIImageView *_headerImageV;
}

@end

@implementation CRParticipateMemberCollectionCell

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
    self.layer.cornerRadius = self.width / 2.0;
    self.layer.masksToBounds = YES;
    
    _headerImageV = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:_headerImageV];
}

- (void)setDataWithMemberInfoModel:(CRProductsMemberBriefInfoModel *)model
{
    UIImage *placeHolderHeaderImage = [UIImage imageNamed:@"tab_btn_control_n"];
    if ([model.authorHeadImageAddress length] > 0) {
        [_headerImageV sd_setImageWithURL:[NSURL URLWithString:model.authorHeadImageAddress] placeholderImage:placeHolderHeaderImage];
    }else{
        _headerImageV.image = placeHolderHeaderImage;
    }
}

@end
