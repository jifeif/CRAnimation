//
//  CRMembersTableViewCell.m
//  CRAnimation
//
//  Created by Bear on 17/2/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRMembersTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CRMembersTableViewCell ()
{
    UIView  *_mainContentView;
    
    UIImageView *_headerImageV;
    UIImageView *_jobIconImageV;
    UILabel     *_nameLabel;
    UILabel     *_professionLabel;
    UIImageView *_productsCountIconImageV;
    UILabel     *_productsCountLabel;
    UIImageView *_popularityCountIconImageV;
    UILabel     *_popularityCountLabel;
    
    CRMemberInfoModel   *_memberInfoModel;
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
    [_mainContentView addSubview:_headerImageV];
    
    _nameLabel = [UILabel new];
    _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:19];
    _nameLabel.textColor = [UIColor whiteColor];
    [_mainContentView addSubview:_nameLabel];
    
    _professionLabel = [UILabel new];
    _professionLabel.font = [UIFont systemFontOfSize:15];
    _professionLabel.textColor = color_e1e3ff;
    [_mainContentView addSubview:_professionLabel];
    
    _jobIconImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, XX_6N(44), XX_6N(44))];
    [_mainContentView addSubview:_jobIconImageV];
    
    
    //  _productsCount
    _productsCountIconImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"member_icon_work"]];
    [_mainContentView addSubview:_productsCountIconImageV];
    
    _productsCountLabel = [UILabel new];
    _productsCountLabel.font = [UIFont systemFontOfSize:17];
    _productsCountLabel.textColor = color_e1e3ff;
    [_mainContentView addSubview:_productsCountLabel];
    
    
    //  _popularityCount
    _popularityCountIconImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"member_icon_Popularity"]];
    [_mainContentView addSubview:_popularityCountIconImageV];
    
    _popularityCountLabel = [UILabel new];
    _popularityCountLabel.font = [UIFont systemFontOfSize:17];
    _popularityCountLabel.textColor = color_e1e3ff;
    [_mainContentView addSubview:_popularityCountLabel];
}

- (void)relayUI
{
    
}

- (void)setDataWithMemberInfoModel:(CRMemberInfoModel *)model
{
    _memberInfoModel = model;
    
    
    
#warning DAD Test
    _memberInfoModel.headURL = @"";
    _memberInfoModel.productsCount = @10;
    _memberInfoModel.popularityCount = @20;
    
    
    
    UIImage *placeHolderHeaderImage = [UIImage imageNamed:@"tab_btn_control_n"];
    if ([_memberInfoModel.headURL length] > 0) {
        [_headerImageV sd_setImageWithURL:[NSURL URLWithString:_memberInfoModel.headURL] placeholderImage:placeHolderHeaderImage];
    }else{
        _headerImageV.image = placeHolderHeaderImage;
    }
    
    _nameLabel.text = _memberInfoModel.nickName;
    
    NSString *professionStr;
    NSString *jobImageName;
    switch (_memberInfoModel.professionType) {
        case kProfessionTypeiOSDeveloper: { professionStr = @"iOS开发者"; jobImageName = @"member_icon_coder";} break;
        case kProfessionTypeDesigner: { professionStr = @"UI设计师"; jobImageName = @"member_icon_designer";} break;
        default: break;
    }
    _professionLabel.text = professionStr;
    _jobIconImageV.image = [UIImage imageNamed:jobImageName];
    
    _productsCountLabel.text = [NSString stringWithFormat:@"%@", _memberInfoModel.productsCount];
    _popularityCountLabel.text = [NSString stringWithFormat:@"%@", _memberInfoModel.popularityCount];
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
