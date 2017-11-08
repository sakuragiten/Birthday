//
//  GSFireStar.m
//  DaaaQing
//
//  Created by Fireloli on 17/10/30.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSFireStar.h"


@interface GSFireStar ()<CAAnimationDelegate>

/** 中心旋转时候的效果 */
@property (nonatomic, strong) CAEmitterLayer *activeLayer;

/** 移动时显示的火花 */
@property (nonatomic, strong) CAEmitterLayer *fireLayer;


/** 回调 */
@property (nonatomic, copy) dispatch_block_t catapultBlock;

/** 结束的回调 */
@property (nonatomic, copy) void (^endBlock)(CGPoint endPoint);
@end

@implementation GSFireStar


- (instancetype)init
{
    if (self = [super init]) {
        
        self.image = [UIImage imageNamed:@"1_star_2"];
    }
    
    return self;
}




- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"1_star_2"];
    }
    
    return self;
}


- (void)animationStart
{

    // 1.向左移动一点距离
    [self moveALittleToLeft];
    
    // 2. 移动到屏幕的底部中间位置 等待动画1 的完成
    [self performSelector:@selector(moveToTheMidBottomOfTheView) withObject:nil afterDelay:kAnimationTime];
    
    // 3. 屏幕内快速移动 然后中心转圈 共计 4 秒
    [self performSelector:@selector(quicklyMoved) withObject:nil afterDelay:kAnimationTime * 3];
    
    //4.设置效果
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kAnimationTime * 7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //先关闭移动时候的效果
        [self stopFireStar];
        
        //增加旋转时候的效果
        [self.layer addSublayer:self.activeLayer];
    });
    
    // 4.中心位置旋转完之后 开始消失动画
    [self performSelector:@selector(hideWithAnimation) withObject:nil afterDelay:8.0];
    
}

#pragma mark - 1.以弧线的方式向左移动一段距离
- (void)moveALittleToLeft
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = [self pathToLeftALittle].CGPath;
    animation.duration = kAnimationTime;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.layer addAnimation:animation forKey:@"animationALittleToLeft"];
    
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.toValue = @(-M_PI * 2);
    rotation.duration = kAnimationTime;
    
    [self.layer addAnimation:rotation forKey:@"rotationToLeft"];
    
    
}
- (UIBezierPath *)pathToLeftALittle
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    //起始点
    CGPoint startPoint = self.center;
    
    //移至起始点
    [path moveToPoint:startPoint];
    
    //设置控制点
    CGPoint controlPoint1 = startPoint;
    CGPoint controlPoint2 = CGPointMake(SCREEN_WIDTH * 5 / 6.0, SCREEN_HEIGHT * 7.0 / 8.0);
    CGPoint endPoint = CGPointMake(SCREEN_WIDTH * 2 / 3.0, SCREEN_HEIGHT - self.width * 0.5);
    
    //设置贝塞尔曲线
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    return path;
}

#pragma mark - 2.移动到底部中心的位置
- (void)moveToTheMidBottomOfTheView
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = [self pathToMidBottom].CGPath;
    animation.duration = kAnimationTime;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [self.layer addAnimation:animation forKey:@"animationToMidBottom"];
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.toValue = @(- M_PI * 6 / 5.0);
    rotation.duration = kAnimationTime * 0.8;
    
    [self.layer addAnimation:rotation forKey:@"rotationToMidBottom"];
    
}


- (UIBezierPath *)pathToMidBottom
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    
    //起始点
    CGPoint startPoint = CGPointMake(SCREEN_WIDTH * 2 / 3.0, SCREEN_HEIGHT - self.width * 0.5);
    
    //移至起始点
    [path moveToPoint:startPoint];
    
    //设置控制点
    CGPoint controlPoint1 = CGPointMake(SCREEN_WIDTH * 7 / 12.0 + kStarWidth * 2, SCREEN_HEIGHT * 15 / 16.0);
    CGPoint controlPoint2 = CGPointMake(SCREEN_WIDTH * 0.5 + kStarWidth * 2, SCREEN_HEIGHT - self.width * 0.5);
    CGPoint controlPoint3 = CGPointMake(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT - self.width * 0.5);
    
    //绘制曲线
    [path addCurveToPoint:controlPoint2 controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    [path addLineToPoint:controlPoint3];
    
    
    
    
    
    return path;
}


#pragma mark - 3.屏幕内快速移动 然后中心旋转
- (void)quicklyMoved
{
    //即将移动
    if (_catapultBlock) _catapultBlock();
    
    //添加移动时候的粒子效果
    [self.layer addSublayer:self.fireLayer];
    
    //移动动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = [self pathForMovingFast].CGPath;
    animation.duration = kAnimationTime * 4;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [self.layer addAnimation:animation forKey:@"animationQuicklyMoved"];
    
    //移动过程中的旋转动画 -> 移动结束仍然进行
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.toValue = @(- M_PI * 4.0);
    rotation.duration = kAnimationTime * 0.8;
    rotation.repeatCount = MAXFLOAT;
    
    [self.layer addAnimation:rotation forKey:@"rotationToCenter"];
    
}

- (UIBezierPath *)pathForMovingFast
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //起始点
    CGPoint startPoint = CGPointMake(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT - self.width * 0.5);
    
    //移至起始点
    [path moveToPoint:startPoint];
    
    //其它控制点
    CGPoint point_1 = CGPointMake(0, SCREEN_HEIGHT / 3.0);
    CGPoint point_2 = CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT * 2 / 3.0);
    CGPoint point_3 = CGPointMake(0, 0);
    
    CGPoint endPoint = CGPointMake(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5);
    
    
    //绘制路径
    [path addLineToPoint:point_1];
    [path addLineToPoint:point_2];
    [path addLineToPoint:point_3];
    [path addLineToPoint:endPoint];
    
    return path;
    
}

#pragma mark - 4.中心位置旋转完之后 消失动画开始
- (void)hideWithAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = kAnimationTime * 3;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.path = [self pathForHiding].CGPath;
    [self.layer addAnimation:animation forKey:@"hideAnimation"];
    
    
    //缩放动画
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.duration = kAnimationTime * 3;
    scale.toValue = [NSNumber numberWithInt:0];
    scale.fillMode = kCAFillModeForwards;
    scale.removedOnCompletion = NO;
    scale.delegate = self;
    //结束点
    CGPoint endPoint = CGPointMake(SCREEN_WIDTH * 0.5, 80);
    [scale setValue:[NSValue valueWithCGPoint:endPoint] forKey:@"endPoint"];
    
    [self.layer addAnimation:scale forKey:@"scaleToHide"];
    
    
    
}

- (UIBezierPath *)pathForHiding
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //起点
    CGPoint startPoint = CGPointMake(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5);
    
    //移至起点位置
    [path moveToPoint:startPoint];
    
    //结束点
    CGPoint endPoint = CGPointMake(SCREEN_WIDTH * 0.5, 80);
    
    //绘制路径
    [path addLineToPoint:endPoint];
    
    return path;
}



#pragma mark - 动画结束 CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSValue *value = [anim valueForKey:@"endPoint"];
    
    if (_endBlock) {
        _endBlock(value.CGPointValue);
    }
    
    //所有动画执行完成 移除动画（否则造成循环引用） 并隐藏(动画移除后 会恢复到最开始的位置)
    [self.layer removeAllAnimations];
    self.hidden = YES;
}


#pragma mark - 回调
- (void)starWillCatapult:(dispatch_block_t)handle
{
    _catapultBlock = handle;
}

- (void)starDidDisappear:(void (^)(CGPoint))handle
{
    _endBlock = handle;
}



/** 关闭移动时候的粒子效果 */
- (void)stopFireStar
{
    [self.fireLayer setValue:@(0) forKey:@"emitterCells.fire.birthRate"];
}



- (CAEmitterLayer *)fireLayer
{
    if (!_fireLayer) {
        _fireLayer = [CAEmitterLayer layer];
        _fireLayer.position = CGPointMake(self.width * 0.5, self.height * 0.5);
        _fireLayer.emitterSize = CGSizeMake(self.width, self.height);
        _fireLayer.emitterMode = kCAEmitterLayerPoint;
        _fireLayer.emitterShape = kCAEmitterLayerSurface;
        _fireLayer.renderMode = kCAEmitterLayerAdditive;
        _fireLayer.zPosition = -15.0;
        _fireLayer.masksToBounds = NO;
        
        CAEmitterCell *fire = [self emitterCell];
        fire.birthRate = 800;
        fire.velocity = 170.0;

        _fireLayer.emitterCells = @[fire];
        
    }
    
    return _fireLayer;
}

- (CAEmitterLayer *)activeLayer
{
    if (!_activeLayer) {
        _activeLayer = [CAEmitterLayer layer];
        _activeLayer.position = CGPointMake(self.width * 0.5, self.height * 0.5);
        _activeLayer.emitterSize = CGSizeMake(self.width, self.width);
        _activeLayer.emitterMode = kCAEmitterLayerOutline;
        _activeLayer.emitterShape = kCAEmitterLayerCircle;
        _activeLayer.renderMode = kCAEmitterLayerOldestFirst;
        _activeLayer.zPosition = -15.0;
        _activeLayer.masksToBounds = NO;
        
        CAEmitterCell *fire = [self emitterCell];
        _activeLayer.emitterCells = @[fire];
        
     
    }
    
    return _activeLayer;
}



- (CAEmitterCell *)emitterCell
{
    CAEmitterCell *fire = [CAEmitterCell emitterCell];
    fire.name = @"fire";
    fire.birthRate = 1800.0;
    fire.velocity = 70.0;
    fire.lifetime = 1.0;
    fire.contents = (id)[UIImage imageNamed:@"FFTspark"].CGImage;
    fire.color = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1].CGColor;//RGB(0.5, 0.5, 0.5).CGColor;
    fire.scale = 0.1;
    fire.greenRange = 0.4;
    fire.redRange = 0.4;
    fire.blueRange = 0.4;
    fire.scaleSpeed = -0.1;
    fire.greenSpeed = -0.05;
    fire.redSpeed = 0.2;
    fire.blueSpeed = - 0.05;
    fire.alphaSpeed = -0.18;
    
    fire.spin = 2 * M_PI;
    fire.spinRange = 2 * M_PI;
    

    //发射角度
    fire.emissionRange = M_PI;
    
    return fire;
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}


@end

































