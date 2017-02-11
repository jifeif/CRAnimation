//
//  CRMembersTableViewCell.m
//  CRAnimation
//
//  Created by Bear on 17/2/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRMembersTableViewCell.h"

@interface CRMembersTableViewCell ()
{
    UIView  *_mainContentView;
    
    UIImageView *_headerImageV;
    UIImageView *_jobIconImageV;
    UILabel     *_nameLabel;
    UILabel     *_professionLabel;
    UIImageView *_productionCountIconImageV;
    UILabel     *_productionCountLabel;
    UIImageView *_popularityCountIconImageV;
    UILabel     *_popularityCountLabel;
}

@end

@implementation CRMembersTableViewCell

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
    [self createMainContentView];
    [self setMainContentViewContents];
}

- (void)createMainContentView
{
    CGFloat off_x = XX_6N(48);
    CGFloat contentView_width = WIDTH - 2 * off_x;
    CGFloat contentView_height = YY_6N(250);
    _mainContentView = [[UIView alloc] initWithFrame:CGRectMake(off_x, 0, contentView_width, contentView_height)];
    [self.contentView addSubview:_mainContentView];
}

- (void)setMainContentViewContents
{
    CGFloat headerImageV_width = _mainContentView.height;
    
    _headerImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, headerImageV_width, headerImageV_width)];
}

- (void)setDataWithmemberInfoModel
{

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
