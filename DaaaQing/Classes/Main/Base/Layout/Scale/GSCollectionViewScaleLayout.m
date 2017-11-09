//
//  GSCollectionViewScaleLayout.m
//  DaaaQing
//
//  Created by Fireloli on 17/11/8.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSCollectionViewScaleLayout.h"

@implementation GSCollectionViewScaleLayout


- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}



- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    if ([self.collectionView numberOfItemsInSection:0] > 2) {
        NSArray *attrs = [super layoutAttributesForElementsInRect:rect];
        CGFloat contentOffsetX = self.collectionView.contentOffset.x;
        CGFloat collectionViewCenterX = self.collectionView.frame.size.width * 0.5;
//        CGFloat contentOffsetY = self.collectionView.contentOffset.y;
//        CGFloat collectionViewCenterY = self.collectionView.frame.size.height * 0.5;
        for (UICollectionViewLayoutAttributes *attr in attrs) {
            CGFloat scale = 1 - fabs(attr.center.x - contentOffsetX - collectionViewCenterX) / self.collectionView.bounds.size.width;
            //        CGFloat scale = 1;
            //        CGFloat height = self.collectionView.bounds.size.height;
            
            
            attr.transform = CGAffineTransformMakeScale(scale, scale);
//            attr.alpha = scale;
        }
        return attrs;
    } else {
        return [super layoutAttributesForElementsInRect:rect];
    }
}


@end
