//
//  GSFireworksLayer.m
//  DaaaQing
//
//  Created by Fireloli on 17/11/2.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSFireworksLayer.h"

@implementation GSFireworksLayer


+ (instancetype)fireworksLlayerAtPosition:(CGPoint)position
{
    GSFireworksLayer *layer = [self fireworksLlayer];
    
    layer.emitterPosition = position;
    
    return layer;
}

+ (instancetype)fireworksLlayer
{
    return [[self alloc] init];
}


- (instancetype)init
{
    if (self = [super init]) {
        [self fireConfiguration];
    }
    
    return self;
}


- (void)fireConfiguration
{
    self.emitterSize = CGSizeMake(1, 1);
    self.emitterMode = kCAEmitterLayerOutline;
    self.emitterShape = kCAEmitterLayerLine;
    self.renderMode = kCAEmitterLayerAdditive;
    
    //rocket
    CAEmitterCell *rocket = [CAEmitterCell emitterCell];
    rocket.birthRate = 6.0;
    rocket.emissionRange = 0.12 * M_PI;
    rocket.velocity = 400;
    rocket.velocityRange = 150;
    rocket.yAcceleration = 0;
    rocket.lifetime = 2.02;
    
    rocket.contents = (id)[UIImage imageNamed:@"ball"].CGImage;
    rocket.scale = 0.2;
    rocket.greenRange = 1.0;
    rocket.redRange = 1.0;
    rocket.blueRange = 1.0;
    
    rocket.spinRange = M_PI;
    
    
    //burst
    CAEmitterCell *burst = [CAEmitterCell emitterCell];
    
    burst.birthRate = 1.0;
    burst.velocity = 0;
    burst.scale = 2.5;
    burst.redSpeed = -1.5;
    burst.blueSpeed = 1.5;
    burst.greenSpeed = 1.0;
    burst.lifetime = 0.35;
    
    //spark
    CAEmitterCell *spark = [CAEmitterCell emitterCell];
    
    spark.birthRate = 666;
    spark.velocity = 125;
    spark.emissionRange = 2 * M_PI;
    spark.yAcceleration = 75;
    spark.lifetime = 3;
    
    spark.contents= (id)[UIImage imageNamed:@"fire"].CGImage;
    spark.scale = 0.5;
    spark.scaleSpeed = -0.2;
    spark.greenSpeed = -0.1;
    spark.redSpeed = 0.4;
    spark.blueSpeed = -0.1;
    spark.alphaSpeed = -0.5;
    spark.spin = 2 * M_PI;
    spark.spinRange = 2 * M_PI;
    
    //together
    self.emitterCells = @[rocket];
    rocket.emitterCells = @[burst];
    burst.emitterCells = @[spark];
    
    
}


@end
















