//
//  CRDesignerStageVC.m
//  CRAnimation
//
//  Created by BearRan on 10/07/2016.
//  Copyright (c) 2016 BearRan. All rights reserved.
//

#import "CRDesignerStageVC.h"
#import "CRHomeNaviBarView.h"
#import "CRDemoInfoModel.h"
#import "CRMemberDetailProductCollectionViewCell.h"
#import "CRJumpManager.h"
#import "CRProductsRequest.h"

static NSString *__collectionViewCellID = @"__collectionViewCellID";

@interface CRDesignerStageVC () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    CRHomeNaviBarView *_naviBarView;
    NSMutableArray <CRDemoInfoModel *> *_demoInfoModelArray;
}

@property (strong, nonatomic) UICollectionView  *mainCollectionView;

@end

@implementation CRDesignerStageVC

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.ifHideTabBar = [NSNumber numberWithBool:NO];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createFakeDataWithAddBriefDemoInfo];
    [self createUI];
    [self requestForProducts];
}

- (void)requestForProducts
{
    __weak typeof(self) weakSelf = self;
    [self showHud:nil];
    [CRProductsRequest reuestProductsWithAnmationType:kCRHomeProductType_DesignerAnimation
                                              success:^(CRHomeProductsModel *homeProductModel) {
                                                  [weakSelf hideHUDView];
                                                  [weakSelf dealDemoArray:homeProductModel.list];
                                                  [weakSelf.mainCollectionView reloadData];
                                              } failure:^(NSString *errorMsg) {
                                                  nil;
                                              }];
}

- (void)dealDemoArray:(NSArray *)demoArray
{
    if (!_demoInfoModelArray) {
        _demoInfoModelArray = [NSMutableArray new];
    }
    [_demoInfoModelArray removeAllObjects];
    
    if (!demoArray || [demoArray count] == 0) {
        return;
    }
    
    for (CRDemoInfoModel *demo in demoArray) {
        [_demoInfoModelArray addObject:demo];
    }
}

- (void)createFakeDataWithAddBriefDemoInfo
{
    _demoInfoModelArray = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        CRDemoInfoModel *demoInfoModel = [CRDemoInfoModel new];
        demoInfoModel.gifAddress = TestCRDemoGifURL_Card;
        [_demoInfoModelArray addObject:demoInfoModel];
    }
}

- (void)createUI
{
    self.view.backgroundColor = color_323341;
    
    [self createNaviBarView];
    [self createCollectionView];
    
    [self.view bringSubviewToFront:_naviBarView];
}

- (void)createNaviBarView
{
    __weak typeof(self) weakSelf = self;
    _naviBarView = [CRHomeNaviBarView commonNaviBarViewWithTitle:@"动效原型" inVC:weakSelf];
    [self.view addSubview:_naviBarView];
}

- (void)createCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _naviBarView.maxY, WIDTH, HEIGHT - _naviBarView.maxY) collectionViewLayout:layout];
    _mainCollectionView.delegate = self;
    _mainCollectionView.dataSource = self;
    _mainCollectionView.backgroundColor = color_323341;
    [self.view addSubview:_mainCollectionView];
    [_mainCollectionView registerClass:[CRMemberDetailProductCollectionViewCell class] forCellWithReuseIdentifier:__collectionViewCellID];
}


#pragma mark - collectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_demoInfoModelArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CRMemberDetailProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:__collectionViewCellID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor purpleColor];
    
    CRDemoInfoModel *demoInfoModel = _demoInfoModelArray[indexPath.row];
    if (demoInfoModel.gifAddress) {
        [cell loadDemoInfoModel:demoInfoModel];
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        return nil;
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        return nil;
    }
    
    return nil;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellOffX = XX_6N(38);
    
    CGFloat cellWidth = WIDTH - 2*cellOffX;
    CGFloat cellHeight = 1.0*cellWidth / 670 * 400;
    return (CGSize){cellWidth, cellHeight};
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat cellOffX = XX_6N(38);
    CGFloat cellOffYStart = YY_6N(0);
    CGFloat cellOffYEnd = YY_6N(36);
    return UIEdgeInsetsMake(cellOffYStart, cellOffX, cellOffYEnd, cellOffX);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat cellGapX = XX_6N(30);
    return cellGapX;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat cellGapY = 0;
    return cellGapY;
}

#pragma mark - collectionView delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakSelf = self;
    CRDemoInfoModel *demoInfoModel = _demoInfoModelArray[indexPath.row];
    [[CRJumpManager commonManagerInVC:weakSelf] jumpToProductDetailVCWithDemoInfoModel:demoInfoModel];
}

@end
