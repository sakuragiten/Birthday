//
//  GSFireStar.h
//  DaaaQing
//
//  Created by Fireloli on 17/10/30.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kStarWidth 15.0

@interface GSFireStar : UIImageView

/** 动画开始 */
- (void)animationStart;


/** 星星将要弹射出去 */
- (void)starWillCatapult:(dispatch_block_t)handle;

/** 星星消失，动画结束 */
- (void)starDidDisappear:(void(^)(CGPoint endPoint))handle;

@end
