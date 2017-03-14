//
//  CRMemberDetailHeadView.h
//  CRAnimation
//
//  Created by Bear on 17/2/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRMemberInfoModel.h"

@protocol CRMemberDetailHeadViewDelegate <NSObject>

- (void)didTapUrlWtihUrlStr:(NSString *)urlStr;

@end

@interface CRMemberDetailHeadView : UICollectionReusableView

@property (weak, nonatomic) id <CRMemberDetailHeadViewDelegate> delegate;

+ (CRMemberDetailHeadView *)commonHeadView;

- (void)setDataWithMemberInfoModel:(CRMemberInfoModel *)model;

@end
