//
//  CRParticipateMembersView.h
//  CRAnimation
//
//  Created by Bear on 17/2/15.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRParticipateMembersView : UIView

+ (CRParticipateMembersView *)commonHeadersView;

- (void)setMemberInfoModelArray:(NSArray<CRMemberInfoModel *> *)memberInfoModelArray;

@end
