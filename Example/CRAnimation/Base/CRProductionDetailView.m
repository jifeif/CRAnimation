//
//  CRProductionDetailView.m
//  CRAnimation
//
//  Created by Bear on 17/2/6.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRProductionDetailView.h"

@interface CRProductionDetailView ()
{
    CRDemoInfoModel         *_infoModel;
    UIScrollView            *_mainScrollView;
    
    UIView                  *_topView;
    UILabel                 *_productNameLabel;
    
    UIView                  *_bodyView;
    UIView                  *_bodyUpView;
    UIView                  *_bodyDownView;
    
    CGFloat                 _offX_start;
    CGFloat                 _offX_end;
}

@end

@implementation CRProductionDetailView

+ (CRProductionDetailView *)commonDetailViewWithInfoModel:(CRDemoInfoModel *)infoModel
{
    CRProductionDetailView *detailView = [[CRProductionDetailView alloc] initWithFrame:CGRectMake(0, 0, XX_6N(544), HEIGHT)
                                                                             infoModel:infoModel];
    return detailView;
}

- (instancetype)initWithFrame:(CGRect)frame
                    infoModel:(CRDemoInfoModel *)infoModel
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _infoModel = infoModel;
        _offX_start = XX_6N(40);
        _offX_end = XX_6N(70);
        [self createUI];
    }
    
    return self;
}

- (void)createUI
{
    self.backgroundColor = [UIColor clearColor];
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _mainScrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:_mainScrollView];
    
    [self createTopView];
    [self createBodyView];
    [self resizeScrollView];
}

- (void)createTopView
{
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _mainScrollView.width, YY_6N(236))];
    _topView.backgroundColor = [color_323341 colorWithAlphaComponent:0.95];
    [_mainScrollView addSubview:_topView];
    
    _productNameLabel = [UILabel new];
    _productNameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    _productNameLabel.textColor = color_5868f2;
    _productNameLabel.text = _infoModel.demoName;
    [_productNameLabel sizeToFit];
    [_topView addSubview:_productNameLabel];
    [_productNameLabel BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
}

- (void)createBodyView
{
    _bodyView = [[UIView alloc] initWithFrame:CGRectMake(0, _topView.maxY, _mainScrollView.width, 1000)];
    _bodyView.backgroundColor = [UIColor whiteColor];
    [_mainScrollView addSubview:_bodyView];
    
    [self createBodyUpView];
}

- (void)createBodyUpView
{
    UILabel     *_CRIDTitleLable;
    UILabel     *_CRIDContentLable;
    UILabel     *_codeLanguageTitleLabel;
    UILabel     *_codeLanguageContentLabel;
    UILabel     *_briefTitleLabel;
    UILabel     *_briefContentLabel;
    UIView      *_sepLineV;
    
    _bodyUpView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _bodyView.width, 0)];
    [_bodyView addSubview:_bodyUpView];
    
    
    //  _CRID
    _CRIDTitleLable = [UILabel new];
    [self setTitleLabel:_CRIDTitleLable text:@"CRID：" inView:_bodyUpView];
    [_CRIDTitleLable setY:YY_6N(55)];
    
    _CRIDContentLable = [UILabel new];
    [self setContentLabel:_CRIDContentLable text:_infoModel.CRID inView:_bodyUpView];
    [_CRIDContentLable setY:_CRIDTitleLable.maxY + YY_6N(20)];
    
    
    //  _codeLanguage
    NSString *codeLanguage = @"";
    switch (_infoModel.codeLanguage) {
        case kCRLanguageTypeSwift: codeLanguage = @"Swift"; break;
        case kCRLanguageTypeObjectiveC: codeLanguage = @"ObjectiveC"; break;
        default: break;
    }
    
    _codeLanguageTitleLabel = [UILabel new];
    [self setTitleLabel:_codeLanguageTitleLabel text:@"开发语言：" inView:_bodyUpView];
    [_codeLanguageTitleLabel setY:_CRIDContentLable.maxY + YY_6N(40)];
    
    _codeLanguageContentLabel = [UILabel new];
    [self setContentLabel:_codeLanguageContentLabel text:codeLanguage inView:_bodyUpView];
    [_codeLanguageContentLabel setY:_codeLanguageTitleLabel.maxY + YY_6N(20)];
    
    
    
    _briefTitleLabel = [UILabel new];
    [self setTitleLabel:_briefTitleLabel text:@"动效简介：" inView:_bodyUpView];
    [_briefTitleLabel setY:_codeLanguageContentLabel.maxY + YY_6N(50)];
    
    _briefContentLabel = [UILabel new];
    [self setContentLabel:_briefContentLabel text:_infoModel.demoSummary inView:_bodyUpView textColor:color_777777 font:[UIFont systemFontOfSize:15]];
    [_briefContentLabel setY:_briefTitleLabel.maxY + YY_6N(30)];
    
    _sepLineV = [[UIView alloc] initWithFrame:CGRectMake(_offX_start, _briefContentLabel.maxY + YY_6N(40), _mainScrollView.width - _offX_start, 0.5)];
    _sepLineV.backgroundColor = color_e5e5e5;
    [_bodyUpView addSubview:_sepLineV];
    
    [_bodyUpView setHeight:_sepLineV.maxY];
}

- (void)setTitleLabel:(UILabel *)label text:(NSString *)text inView:(UIView *)inView
{
    label.textColor = color_c5c5c5;
    label.font = [UIFont systemFontOfSize:14];
    label.text = text;
    [label setX:_offX_start];
    [label sizeToFit];
    [inView addSubview:label];
}


- (void)setContentLabel:(UILabel *)label text:(NSString *)text inView:(UIView *)inView
{
    [self setContentLabel:label
                     text:text
                   inView:inView
                textColor:color_323341
                     font:[UIFont systemFontOfSize:19]];
}

- (void)setContentLabel:(UILabel *)label
                   text:(NSString *)text
                 inView:(UIView *)inView
              textColor:(UIColor *)textColor
                   font:(UIFont *)font
{
    label.textColor = textColor;
    label.font = font;
    label.text = text;
    label.numberOfLines = 0;
    [label setX:_offX_start];
    [label setWidth:_mainScrollView.width - _offX_start - _offX_end];
    [label sizeToFit];
    [inView addSubview:label];
}

- (void)resizeScrollView
{
    _mainScrollView.contentSize = CGSizeMake(_mainScrollView.width, _bodyView.maxY);
}


@end
