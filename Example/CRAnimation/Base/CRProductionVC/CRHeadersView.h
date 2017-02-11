//
//  CRHeadersView.h
//  CRAnimation
//
//  Created by Bear on 17/2/9.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRHeaderButton.h"

@interface CRHeadersView : UIView

+ (CRHeadersView *)commonHeasersViewWithMemberArray:(NSArray <CRHeaderButton *> *)memberArray;

@end
