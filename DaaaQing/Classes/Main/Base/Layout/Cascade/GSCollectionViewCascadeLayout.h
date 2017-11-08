//
//  GSCollectionViewCascadeLayout.h
//  DaaaQing
//
//  Created by Fireloli on 17/10/26.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GSCollectionViewCascadeLayout;

@protocol GSCollectionViewCascadeLayoutDelegate <NSObject>


@required
- (CGFloat)collectionViewLayout:(GSCollectionViewCascadeLayout *)cascadeLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional

- (CGFloat)columnCountInCascadeLayout:(GSCollectionViewCascadeLayout *)cascadeLayout;
- (CGFloat)columnMarginInCascadeLayout:(GSCollectionViewCascadeLayout *)cascadeLayout;
- (CGFloat)rowMagrinInCascadeLayout:(GSCollectionViewCascadeLayout *)cascadeLayout;
- (UIEdgeInsets)edgeInCascadeLayout:(GSCollectionViewCascadeLayout *)cascadeLayout;

@end



@interface GSCollectionViewCascadeLayout : UICollectionViewLayout



/** 代理 */
@property (nonatomic, weak) id<GSCollectionViewCascadeLayoutDelegate> delegate;





@end
