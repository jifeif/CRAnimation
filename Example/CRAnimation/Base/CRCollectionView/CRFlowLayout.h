//
//  CRFlowLayout.h
//  CRAnimation
//
//  Created by Bear on 2017/5/7.
//  Copyright © 2017年 BearRan. All rights reserved.
//
//  参考：http://www.cnblogs.com/angelfeather/articles/5946587.html

#import <UIKit/UIKit.h>

typedef CGFloat(^HeightBlock)(NSIndexPath *indexPath , CGFloat width);
@interface CRFlowLayout : UICollectionViewLayout
/** 列数 */
@property (nonatomic, assign) NSInteger lineNumber;
/** 行间距 */
@property (nonatomic, assign) CGFloat rowSpacing;
/** 列间距 */
@property (nonatomic, assign) CGFloat lineSpacing;
/** 内边距 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;
/**
 *  计算各个item高度方法 必须实现
 *
 *  @param block 设计计算item高度的block
 */
- (void)computeIndexCellHeightWithWidthBlock:(CGFloat(^)(NSIndexPath *indexPath , CGFloat width))block;

@end
