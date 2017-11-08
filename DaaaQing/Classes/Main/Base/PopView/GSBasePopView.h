//
//  GSBasePopView.h
//  AgriculturalProduct
//
//  Created by Fireloli on 17/9/27.
//  Copyright © 2017年 cjwsc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    GSPopAnimatedPlain,
    GSPopAnimatedDamping,
} GSPopAnimatedType;

@interface GSBasePopView : UIView

/** 内容的大小 */
@property (nonatomic, assign) CGSize contentSize;

/** 内容的原点 */
@property (nonatomic, assign) CGPoint orinal;
/** 点击背景是否隐藏 */
@property (nonatomic, assign) BOOL outsideEnable;

/** 背景颜色 */
@property (nonatomic, strong) UIColor *superBgColor;

/** 动画的方式 */
@property (nonatomic, assign) GSPopAnimatedType animatedType;


/** 显示 */
- (void)show;



/** 子类根据需要重写的方法 */


/** 显示动画结束 */
- (void)viewDidAppear;

/** 视图消失 */
- (void)viewWillDisAppear;
/** 关闭 */
- (void)hideAnimated;



/** 显示之前 */
- (void)prepareToShow;

/** 展示的时候动画结束的状态 */
- (void)animatedShowEndStatus;

//隐藏的时候动画结束状态
- (void)animatedHideEndStatus;

@end
