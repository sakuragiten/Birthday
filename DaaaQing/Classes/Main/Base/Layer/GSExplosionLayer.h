//
//  GSExplosionLayer.h
//  DaaaQing
//
//  Created by Fireloli on 17/10/31.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface GSExplosionLayer : CAEmitterLayer

+ (instancetype)explosionLayer;

+ (instancetype)explosionLayerAtPosition:(CGPoint)position;


/** 爆炸效果的速度控制 */
- (void)boomWithBirthRate:(CGFloat)rate;

/** 爆炸效果 */
- (void)boomEffect;

/** 停止爆炸效果 */
- (void)stopBoom;

@end
