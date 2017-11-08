//
//  GSCakeView.h
//  DaaaQing
//
//  Created by Fireloli on 17/11/1.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSCakeView : UIView


+ (instancetype)cakeView;

/** 动画展示 */
- (void)showWithAnimation;

- (void)animationEndWithCompletionHandle:(dispatch_block_t)handle;

@end
