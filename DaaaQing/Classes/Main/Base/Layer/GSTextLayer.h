//
//  GSTextLayer.h
//  DaaaQing
//
//  Created by Fireloli on 17/11/2.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface GSTextLayer : CALayer


+ (instancetype)layerWithText:(NSString *)text rect:(CGRect)rect;


/** 文字内容 */
@property (nonatomic, copy) NSString *text;

/** 字体 */
@property (nonatomic, strong) UIFont *font;

/** 动画时长 */
@property (nonatomic, assign) NSTimeInterval animationTime;

- (void)drawTextWithAnimation;


@end
