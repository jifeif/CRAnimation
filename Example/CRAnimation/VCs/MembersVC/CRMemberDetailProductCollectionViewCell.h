//
//  CRMemberDetailProductCollectionViewCell.h
//  CRAnimation
//
//  Created by Bear on 17/2/14.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CRDemoBriefDemoInfo, CRDemoInfoModel;

@interface CRMemberDetailProductCollectionViewCell : UICollectionViewCell

- (void)loadBriefDemoInfoModel:(CRDemoBriefDemoInfo *)demoInfoModel;
- (void)loadDemoInfoModel:(CRDemoInfoModel *)demoInfoModel;

@end
