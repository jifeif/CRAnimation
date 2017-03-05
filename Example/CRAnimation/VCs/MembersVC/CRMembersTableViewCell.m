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
    CRMemberInfoModel   *_memberInfoModel;
    
    UIView      *_mainContentView;
    
    UIImageView *_headerImageV;
    UIImageView *_jobIconImageV;
    UILabel     *_nameLabel;
    UILabel     *_professionLabel;
    UIImageView *_productsCountIconImageV;
    UILabel     *_productsCountLabel;
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


#pragma mark - CreateUI

- (void)createUI
{
    self.backgroundColor = color_323341;
    
    [self createMainContentView];
    [self setMainContentViewContents];
}

- (void)createMainContentView
{
    CGFloat off_x = XX_6N(48);
    CGFloat contentView_width = WIDTH - 2 * off_x;
    CGFloat contentView_height = YY_6N(250);
    _mainContentView = [[UIView alloc] initWithFrame:CGRectMake(off_x, 0, contentView_width, contentView_height)];
    _mainContentView.backgroundColor = color_5e67f7;
    [self.contentView addSubview:_mainContentView];
}

- (void)setMainContentViewContents
{
    CGFloat headerImageV_width = _mainContentView.height;
    
    _headerImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, headerImageV_width, headerImageV_width)];
    [_mainContentView addSubview:_headerImageV];
    
    _nameLabel = [UILabel new];
    _nameLabel.font = BoldFont(19);
    _nameLabel.textColor = [UIColor whiteColor];
    [_mainContentView addSubview:_nameLabel];
    
    _professionLabel = [UILabel new];
    _professionLabel.font = [UIFont systemFontOfSize:15];
    _professionLabel.textColor = color_e1e3ff;
    [_mainContentView addSubview:_professionLabel];
    
    _jobIconImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, XX_6N(44), XX_6N(44))];
    [_mainContentView addSubview:_jobIconImageV];
    [_jobIconImageV BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:nil parentRelation:YES distance:0 center:NO];
    
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


#pragma mark - RelayUI

- (void)relayUI
{
    CGFloat label_x = _headerImageV.maxX + XX_6N(24);
    
    [_nameLabel sizeToFit];
    [_nameLabel setOrigin:CGPointMake(label_x, YY_6N(32))];
    
    [_professionLabel sizeToFit];
    [_professionLabel setOrigin:CGPointMake(label_x, _nameLabel.maxY + YY_6N(40))];
    
    
    //  _productsCount
    [_productsCountIconImageV setOrigin:CGPointMake(label_x, _professionLabel.maxY + YY_6N(44))];
    
    [_productsCountLabel sizeToFit];
    [_productsCountLabel BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:_productsCountIconImageV parentRelation:NO distance:XX_6N(14) center:YES];
    
    
    //  _popularityCount
    [_popularityCountIconImageV BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:_productsCountLabel parentRelation:NO distance:XX_6N(36) center:YES];
    
    [_popularityCountLabel sizeToFit];
    [_popularityCountLabel BearSetRelativeLayoutWithDirection:kDIR_RIGHT destinationView:_popularityCountIconImageV parentRelation:NO distance:XX_6N(14) center:YES];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self relayUI];
}


#pragma mark - Set Data
- (void)setDataWithMemberInfoModel:(CRMemberInfoModel *)model
{
    _memberInfoModel = model;
    
    UIImage *placeHolderHeaderImage = [UIImage imageNamed:@"tab_btn_control_n"];
    if ([_memberInfoModel.headImageAddress length] > 0) {
        [_headerImageV sd_setImageWithURL:[NSURL URLWithString:_memberInfoModel.headImageAddress] placeholderImage:placeHolderHeaderImage];
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
    
    _productsCountLabel.text = [NSString stringWithFormat:@"%@", _memberInfoModel.productionAmount];
    _popularityCountLabel.text = [NSString stringWithFormat:@"%@", _memberInfoModel.hotDegree];
    
    [self relayUI];
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
