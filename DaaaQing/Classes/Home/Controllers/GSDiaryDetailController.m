//
//  GSDiaryDetailController.m
//  DaaaQing
//
//  Created by Fireloli on 17/11/8.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSDiaryDetailController.h"
#import "GSCollectionViewScaleLayout.h"
#import "GSDiaryCollectionViewCell.h"

static NSString *const kReuseCollectionCell = @"reuseCollectionCellIdentifier";
@interface GSDiaryDetailController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *dqArray;

@end

@implementation GSDiaryDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}
- (void)setupUI
{
    [self.view addSubview:self.collectionView];
    
    self.title = @"✎      All of you       ✎";
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dqArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GSDiaryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseCollectionCell forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor randomColor];
    
    cell.diaryModel = _dqArray[indexPath.item];
    
    return cell;
    
}

#pragma mark - UICollectionViewDelegate

#pragma mark - lazyload
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        
        GSCollectionViewScaleLayout *layout = [[GSCollectionViewScaleLayout alloc] init];
        layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - kNavHeight);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        CGRect frame = CGRectMake(0, kNavHeight, SCREEN_WIDTH, SCREEN_HEIGHT - kNavHeight);
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
//        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kReuseCollectionCell];
        [_collectionView registerNib:[UINib nibWithNibName:@"GSDiaryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kReuseCollectionCell];
        
    }
    
    return _collectionView;
}
- (NSArray *)dqArray
{
    if (!_dqArray) {
        _dqArray = [GSDiaryModel dqModelArray];
    }
    
    return _dqArray;
}



@end
