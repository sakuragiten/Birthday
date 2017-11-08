//
//  GSExplosionLayer.m
//  DaaaQing
//
//  Created by Fireloli on 17/10/31.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSExplosionLayer.h"

@implementation GSExplosionLayer

+ (instancetype)explosionLayerAtPosition:(CGPoint)position
{
    return [[self explosionLayer] explosionLayerAtPosition:position];
}

+ (instancetype)explosionLayer
{
    return [[self alloc] init];
}




- (instancetype)init
{
    if (self = [super init]) {
        [self explosionConfiguration];
    }
    return self;
}

- (instancetype)explosionLayerAtPosition:(CGPoint)position
{
    self.position = position;
    
    return self;
}


- (void)explosionConfiguration
{
    self.name = @"explosionLayer";
    self.emitterMode = kCAEmitterLayerOutline;
    self.emitterShape = kCAEmitterLayerCircle;
    self.renderMode = kCAEmitterLayerOldestFirst;
    self.emitterSize = CGSizeMake(0, 0);
    self.masksToBounds = NO;
    
    CAEmitterCell *cell = [self emitterCell];
    self.emitterCells = @[cell];
}


- (CAEmitterCell *)emitterCell
{
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    
    cell.name = @"explosion";
    cell.birthRate = 0;
    cell.velocity = 110;
    cell.velocityRange = 20;
    cell.contents = (id)[UIImage imageNamed:@"1_star_3"].CGImage;
    cell.alphaRange = 0.10;
    cell.alphaSpeed = -1.0;
    cell.lifetime = 0.5;
    cell.lifetimeRange = 0.2;
    cell.scale = 0.01;
    
    return cell;
}

- (void)boomWithBirthRate:(CGFloat)rate
{
    [self setValue:@(rate) forKeyPath:@"emitterCells.explosion.birthRate"];
}

- (void)boomEffect
{
    [self boomWithBirthRate:4500];
    
    [self performSelector:@selector(stopBoom) withObject:nil afterDelay:0.3];

}

- (void)stopBoom
{
    [self boomWithBirthRate:0];
}





@end














