//
//  CRCodeAnimationVC.m
//  CRAnimation
//
//  Created by BearRan on 10/07/2016.
//  Copyright (c) 2016 BearRan. All rights reserved.
//

#import "CRCodeAnimationVC.h"
#import "CRDemoInfoModel.h"
#import "CRItemBriefCollectionViewCell.h"
#import "CRHomeNaviBarView.h"
#import "CRJumpManager.h"
#import "CRProductsRequest.h"

static NSString *collectionViewCellID           = @"collectionViewCellID";
static NSString *collectionViewReusableViewID   = @"collectionViewReusableViewID";

static NSString *__kCRDemoStorage       = @"动效仓库";
static NSString *__kCRDemoCombination   = @"组合动效";

@interface CRCodeAnimationVC () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    CRHomeNaviBarView   *_naviBarView;
}

@property (strong, nonatomic) NSMutableArray    *dataArrayTitle;
@property (strong, nonatomic) NSMutableArray    *dataArrayDemoModel;
@property (strong, nonatomic) NSArray           *storageDemoInfoModelNameArray;
@property (strong, nonatomic) NSArray           *combinationDemoInfoModelNameArray;
@property (strong, nonatomic) UICollectionView  *mainCollectionView;

@end

@implementation CRCodeAnimationVC

#pragma mark - LifeCircle
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.ifHideTabBar = [NSNumber numberWithBool:NO];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    [self createUI];
    
    [CRConstants normalBlock:^{
        [weakSelf requestData];
    } contributeBlock:^{
        [weakSelf localDataReady];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

#pragma mark - RequestData
- (void)requestData
{
    [self requestForProducts];
}

- (void)requestForProducts
{
    __weak typeof(self) weakSelf = self;
    _dataArrayTitle = [[NSMutableArray alloc] initWithArray:@[
                                                              __kCRDemoStorage,
                                                              ]];
    
    [self showHud:nil];
    [CRProductsRequest reuestProductsWithAnmationType:kCRHomeProductType_CodeAnimation
                                              success:^(CRHomeProductsModel *homeProductModel) {
                                                  [weakSelf hideHUDView];
                                                  [weakSelf dealDemoArray:homeProductModel.list withGroupName:__kCRDemoStorage];
                                                  [weakSelf.mainCollectionView reloadData];
                                              } failure:^(NSString *errorMsg) {
                                                  nil;
                                              }];
}

#pragma mark - LocalData
- (void)localDataReady
{
    _dataArrayTitle = [[NSMutableArray alloc] initWithArray:@[
                                                              __kCRDemoStorage,
                                                              __kCRDemoCombination,
                                                              ]];
    
    _storageDemoInfoModelNameArray = @[
                                       @"CRCardAnimationViewDemoInfoModel",
                                       @"CRImageGradientDemoInfoModel",
                                       @"GifDemoInfoModel",
                                       @"WCLLoadingViewDemoInfoModel",
                                       @"HZLaunchViewDemoInfoModel",
                                       @"CCWormHUDDemoInfoModel",
                                       @"CRGatlingModel",
                                       @"CRJHUDDemoInfoModel",
                                       @"CRWCLShineButtonModel",
                                       @"CRRollerCoasterLayerModel",
                                       ];
    
    _combinationDemoInfoModelNameArray = @[
                                           @"CRMusicCardDemoInfoModel"
                                           ];
    
    [self dealDemoNameArray:_storageDemoInfoModelNameArray withGroupName:__kCRDemoStorage];
    [self dealDemoNameArray:_combinationDemoInfoModelNameArray withGroupName:__kCRDemoCombination];
}

- (void)dealDemoNameArray:(NSArray *)demoNameArray withGroupName:(NSString *)groupName
{
    for (NSString *demoName in demoNameArray) {
        [self addDemoInfoModelName:demoName withGroupName:groupName];
    }
}

- (void)addDemoInfoModelName:(NSString *)demoInfoModelName withGroupName:(NSString *)groupName
{
    if (!_dataArrayDemoModel) {
        _dataArrayDemoModel = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < [_dataArrayTitle count]; i++) {
            NSMutableArray *subMutableArray = [NSMutableArray new];
            [_dataArrayDemoModel addObject:subMutableArray];
        }
    }
    
    if ([demoInfoModelName length] > 0) {
        
        CRDemoInfoModel *infoModel = [[NSClassFromString(demoInfoModelName) alloc] init];
        if (infoModel) {
            
            //  添加新的Demo数据模型
            NSInteger index = [self.dataArrayTitle indexOfObject:groupName];
            NSMutableArray *subMutableArray = self.dataArrayDemoModel[index];
            [subMutableArray addObject:infoModel];
            _dataArrayDemoModel[index] = subMutableArray;
        }
    }
}

- (void)dealDemoArray:(NSArray *)demoArray withGroupName:(NSString *)groupName
{
    if (!demoArray || [demoArray count] == 0) {
        return;
    }
    for (CRDemoInfoModel *demo in demoArray) {
        [self addDemoInfoModel:demo withGroupName:groupName];
    }
}

- (void)addDemoInfoModel:(CRDemoInfoModel *)demoInfoModel withGroupName:(NSString *)groupName
{
    if (!_dataArrayDemoModel) {
        _dataArrayDemoModel = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < [_dataArrayTitle count]; i++) {
            NSMutableArray *subMutableArray = [NSMutableArray new];
            [_dataArrayDemoModel addObject:subMutableArray];
        }
    }
    
    if (demoInfoModel) {
        
        //  添加新的Demo数据模型
        NSInteger index = [self.dataArrayTitle indexOfObject:groupName];
        NSMutableArray *subMutableArray = self.dataArrayDemoModel[index];
        [subMutableArray addObject:demoInfoModel];
        _dataArrayDemoModel[index] = subMutableArray;
    }
}

#pragma mark - Create UI
- (void)createUI
{
    self.view.backgroundColor = color_Master;
    
    [self createNaviBarView];
    [self createCollectionView];
}

- (void)createNaviBarView
{
    __weak typeof(self) weakSelf = self;
    _naviBarView = [CRHomeNaviBarView commonNaviBarViewWithTitle:@"动效体验" inVC:weakSelf];
    [self.view addSubview:_naviBarView];
}

- (void)createCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _naviBarView.maxY, WIDTH, HEIGHT - _naviBarView.maxY - TABBAR_HEIGHT) collectionViewLayout:layout];
    _mainCollectionView.backgroundColor = color_Master;
    _mainCollectionView.delegate = self;
    _mainCollectionView.dataSource = self;
    [self.view addSubview:_mainCollectionView];
    [_mainCollectionView registerClass:[CRItemBriefCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellID];
}


#pragma mark - collectionView dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [_dataArrayDemoModel count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_dataArrayDemoModel[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CRItemBriefCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor purpleColor];
    
    CRDemoInfoModel *demoInfoModel = _dataArrayDemoModel[indexPath.section][indexPath.row];
    if (demoInfoModel.demoVCName) {
        [cell loadDemoInfoModel:demoInfoModel];
    }
    
    return cell;
}

#pragma mark - collectionView delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakSelf = self;
    CRDemoInfoModel *demoInfoModel = _dataArrayDemoModel[indexPath.section][indexPath.row];
    [[CRJumpManager commonManagerInVC:weakSelf] jumpToProductDetailVCWithDemoInfoModel:demoInfoModel];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellWidth = WIDTH / 2.0 - 20;
    CGFloat cellHeight = 1.0 * HEIGHT6 / WIDTH6 * cellWidth;
    return (CGSize){cellWidth, cellHeight};
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 15, 5, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.f;
}

@end
