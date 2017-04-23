//
//  PullToRefreshRentalsCell.m
//  CRAnimation
//
//  Created by Bear on 17/4/23.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "PullToRefreshRentalsCell.h"

@interface PullToRefreshRentalsCell ()
{
    UIImageView *_imageView;
}

@end

@implementation PullToRefreshRentalsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createUI];
    }
    
    return self;
}

- (void)createUI
{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [self.contentView addSubview:_imageView];
}

#pragma mark - RelayUI
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self relauUI];
}

- (void)relauUI
{
    [_imageView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}

#pragma mark - Setter & Getter

- (void)setImageNameStr:(NSString *)imageNameStr
{
    _imageNameStr = imageNameStr;
    
    _imageView.image = [UIImage imageNamed:_imageNameStr];
    [self relauUI];
}

@end
