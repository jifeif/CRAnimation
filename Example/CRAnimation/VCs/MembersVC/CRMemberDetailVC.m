//
//  CRMemberDetailVC.m
//  CRAnimation
//
//  Created by Bear on 17/2/11.
//  Copyright © 2017年 BearRan. All rights reserved.
//

#import "CRMemberDetailVC.h"
#import "CRCustomNaviBarView.h"
#import "CRMemberDetailHeadView.h"
#import "CRMemberDetailProductCollectionViewCell.h"

static NSString *__collectionViewCellID = @"__collectionViewCellID";
static NSString *__collectionViewReusableViewID = @"__collectionViewReusableViewID";

@interface CRMemberDetailVC () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    CRCustomNaviBarView     *_naviBarView;
    CRMemberInfoModel       *_memberInfoModel;
    
    UICollectionView        *_mainCollectionView;
    NSNumber                *_userId;
}

@end

@implementation CRMemberDetailVC

- (instancetype)initWithUserId:(NSNumber *)userId
{
    self = [super init];
    
    if (self) {
        _userId = userId;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createFakeDataWithAddBriefDemoInfo];
    [self createUI];
}



- (void)createFakeDataWithAddBriefDemoInfo
{
    NSMutableArray *briefDemoInfoArray = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        CRDemoBriefDemoInfo *briefDemoInfo = [CRDemoBriefDemoInfo new];
        briefDemoInfo.gifAddress = TestCRDemoGifURL_Card;
        [briefDemoInfoArray addObject:briefDemoInfo];
    }
    _memberInfoModel.productBriefModelArray = briefDemoInfoArray;
}

- (void)createUI
{
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = color_323341;
    
    [self creteNaviBarView];
    [self createCollectionView];
    
    [self.view bringSubviewToFront:_naviBarView];
}

- (void)creteNaviBarView
{
    __weak typeof(self) weakSelf = self;
    _naviBarView = [CRCustomNaviBarView commonNaviBarViewWithTitle:@"个人详情" inVC:weakSelf];
    [self.view addSubview:_naviBarView];
}

- (void)createCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    _mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _mainCollectionView.delegate = self;
    _mainCollectionView.dataSource = self;
    [self.view addSubview:_mainCollectionView];
    [_mainCollectionView registerClass:[CRMemberDetailProductCollectionViewCell class] forCellWithReuseIdentifier:__collectionViewCellID];
    [_mainCollectionView registerClass:[CRMemberDetailHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:__collectionViewReusableViewID];
}


#pragma mark - collectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_memberInfoModel.productBriefModelArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CRMemberDetailProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:__collectionViewCellID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor purpleColor];
    
    CRDemoBriefDemoInfo *demoInfoModel = _memberInfoModel.productBriefModelArray[indexPath.row];
    if (demoInfoModel.gifAddress) {
        [cell loadBriefDemoInfoModel:demoInfoModel];
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CRMemberDetailHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:__collectionViewReusableViewID forIndexPath:indexPath];
        if (!headerView) {
            headerView = [CRMemberDetailHeadView commonHeadView];
        }
        [headerView setDataWithMemberInfoModel:_memberInfoModel];
        
        return headerView;
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        return nil;
    }
    
    return nil;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CRMemberDetailHeadView *headerView = [CRMemberDetailHeadView commonHeadView];
    return headerView.frame.size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellGapX = XX_6N(16);
    CGFloat cellOffX = XX_6N(30);
    
    CGFloat cellWidth = (WIDTH - 2 * cellOffX - 2 * cellGapX) / 3.0;
    CGFloat cellHeight = cellWidth;
    return (CGSize){cellWidth, cellHeight};
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat cellOffX = XX_6N(30);
    CGFloat cellOffY = YY_6N(23);
    return UIEdgeInsetsMake(cellOffY, cellOffX, cellOffY, cellOffX);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat cellGapX = XX_6N(16);
    return cellGapX;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat cellGapY = YY_6N(16);
    return cellGapY;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
