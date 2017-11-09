//
//  GSDiaryDetailController.m
//  DaaaQing
//
//  Created by Fireloli on 17/11/8.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSDiaryDetailController.h"
#import "GSCollectionViewScaleLayout.h"

static NSString *const kReuseCollectionCell = @"reuseCollectionCellIdentifier";
@interface GSDiaryDetailController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation GSDiaryDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}
- (void)setupUI
{
    [self.view addSubview:self.collectionView];
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 25;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseCollectionCell forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor randomColor];
    
    return cell;
    
}

#pragma mark - UICollectionViewDelegate



- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        GSCollectionViewScaleLayout *layout = [[GSCollectionViewScaleLayout alloc] init];
        layout.itemSize = self.view.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        
        _collectionView.pagingEnabled = YES;
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kReuseCollectionCell];
        
    }
    
    return _collectionView;
}

@end
