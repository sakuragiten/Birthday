//
//  GSCollectionViewCascadeLayout.m
//  DaaaQing
//
//  Created by Fireloli on 17/10/26.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSCollectionViewCascadeLayout.h"

/** 默认的列数 */
static const NSInteger GSDefaultColumnCount = 3;

/** 每一列之间的间距 */
static const CGFloat GSDefaultColumnMargin = 10;

/** 每一行之间的间距 */
static const CGFloat GSDefaultRowMargin = 10;

/** 边缘间距 */
static const UIEdgeInsets GSDefaultEdgeInsets = {10, 10, 10, 10};



@interface GSCollectionViewCascadeLayout ()


/** 存放所有cell的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;

/** 存放所有列的当前高度 */
@property (nonatomic, strong) NSMutableArray *columnHeights;

/** 内容的高度 */
@property (nonatomic, assign) CGFloat contentHeight;


@end


@implementation GSCollectionViewCascadeLayout


/**
 *
 * 初始化，layout的预备操作
 * collectionView reloadData 时候调用
 *
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    self.contentHeight = 0;
    
    // 清除以前计算的所有高度
    [self.columnHeights removeAllObjects];
    for (NSInteger i = 0; i < self.columnCount; i++) {
        [self.columnHeights addObject:@(self.edgeInsets.top)];
    }
    
    // 清除之前所有的布局属性
    [self.attrsArray removeAllObjects];
    // 开始创建每一个cell对应的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < count; i++) {
        // 创建位置
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        // 获取indexPath位置cell对应的布局属性
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}


/**
 *
 * 决定cell的排布
 *
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}



/**
 *
 * 返回indexPath位置cell对应的布局属性
 *
 */

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // collectionView的宽度
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    
    // 设置布局属性的frame
    CGFloat w = (collectionViewW - self.edgeInsets.left - self.edgeInsets.right - (self.columnCount - 1) * self.columnMargin) / self.columnCount;
    CGFloat h = [self.delegate collectionViewLayout:self heightForItemAtIndex:indexPath.item itemWidth:w];
    
    // 找出高度最短的那一列
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1; i < self.columnCount; i++) {
        // 取得第i列的高度
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    
    CGFloat x = self.edgeInsets.left + destColumn * (w + self.columnMargin);
    CGFloat y = minColumnHeight;
    if (y != self.edgeInsets.top) {
        y += self.rowMargin;
    }
    attrs.frame = CGRectMake(x, y, w, h);
    
    // 更新最短那列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    
    // 记录内容的高度
    CGFloat columnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.contentHeight < columnHeight) {
        self.contentHeight = columnHeight;
    }
    return attrs;
}


/**
 *
 * 更新collectionView的ContentSize
 *
 */

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(0, self.contentHeight + self.edgeInsets.bottom);
}



#pragma mark - 获取基本数据
- (CGFloat)rowMargin
{
    if ([self.delegate respondsToSelector:@selector(rowMagrinInCascadeLayout:)]) {
        return [self.delegate rowMagrinInCascadeLayout:self];
    } else {
        return GSDefaultRowMargin;
    }
}


- (CGFloat)columnMargin
{
    if ([self.delegate respondsToSelector:@selector(columnMarginInCascadeLayout:)]) {
        return [self.delegate columnMarginInCascadeLayout:self];
    } else {
        return GSDefaultColumnMargin;
    }
}

- (NSInteger)columnCount
{
    if ([self.delegate respondsToSelector:@selector(columnCountInCascadeLayout:)]) {
        return [self.delegate columnCountInCascadeLayout:self];
    } else {
        return GSDefaultColumnCount;
    }
}

- (UIEdgeInsets)edgeInsets
{
    if ([self.delegate respondsToSelector:@selector(edgeInCascadeLayout:)]) {
        return [self.delegate edgeInCascadeLayout:self];
    } else {
        return GSDefaultEdgeInsets;
    }
}


#pragma mark - lazy load
- (NSMutableArray *)columnHeights
{
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}


@end
