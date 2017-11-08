//
//  GSCakeView.m
//  DaaaQing
//
//  Created by Fireloli on 17/11/1.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSCakeView.h"
#import "GSCakeLayer.h"

#define kBoxWidth 220.0

/** 外侧边距 */
static const UIEdgeInsets outSideEdge = {20, 10, 20, 10};

/** 内侧边距 */
static const UIEdgeInsets inSideEdge = {30, 20, 30, 20};




@interface GSCakeView ()<CAAnimationDelegate>


/** 外层box */
@property (nonatomic, strong) CAShapeLayer *outSideLayer;

/** 内侧 */
@property (nonatomic, strong) CAShapeLayer *inSideLayer;

/** 保存盒子线条的layer */
@property (nonatomic, strong) NSMutableArray *lineArray;


/** 蛋糕 */
@property (nonatomic, strong) GSCakeLayer *cakeLayer;

/** 回调block */
@property (nonatomic, copy) dispatch_block_t handleBlock;

@end

static NSString *const kAnimationType = @"animationType";
static NSString *const kAnimationInside = @"animationInside";
static NSString *const kAnimationDisappear = @"animationDisappear";
@implementation GSCakeView

+ (instancetype)cakeView
{
    return [[self alloc] init];
}


- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
//    self.backgroundColor = [UIColor randomColor];
    

}



#pragma mark - 开启动画
- (void)showWithAnimation
{
    //1.画box
    [self drawBox];
    
}

#pragma mark - 绘制盒子
- (void)drawBox
{
//    [self drawCake]; return;
    
    //1.盒子外侧
    [self drawBoxOutSide];
    
    
    //2.盒子内侧 耗时2.0秒
    [self drawBoxInSide];
    
    //3.盒子里的线条 延迟1.6秒 耗时 1.0秒
    [self performSelector:@selector(drawBoxLine) withObject:nil afterDelay:1.6];
    
    //4.画蛋糕 耗时0.9 结束时间 3.5
    [self performSelector:@selector(drawCake) withObject:nil afterDelay:2.6];
    
    //5.移除线条 耗时2.5 结束时间 6.5
    [self performSelector:@selector(removeAllLine) withObject:nil afterDelay:4];
    
    
    //6.动画结束的回调
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_handleBlock) {
            _handleBlock();
        }
    });
    
}


// 绘制外层的box
- (void)drawBoxOutSide
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //创建四角顶点
    CGPoint p1 = CGPointMake(outSideEdge.left, outSideEdge.top);
    CGPoint p2 = CGPointMake(SCREEN_WIDTH - outSideEdge.right, outSideEdge.top);
    CGPoint p3 = CGPointMake(SCREEN_WIDTH - outSideEdge.right, SCREEN_HEIGHT - outSideEdge.bottom);
    CGPoint p4 = CGPointMake(outSideEdge.left, SCREEN_HEIGHT - outSideEdge.bottom);
    
    //绘制路径
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p3];
    [path addLineToPoint:p4];
    [path addLineToPoint:p1];
    
    //添加对应的图层
    self.outSideLayer.path = path.CGPath;
    [self.layer addSublayer:_outSideLayer];
    
    //动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.duration = kAnimationTime * 2;
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:1.0];
    
    
    [_outSideLayer addAnimation:animation forKey:@"animationOutSide"];
}



#pragma mark -  盒子内侧
- (void)drawBoxInSide
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //创建四角顶点
    CGPoint p1 = CGPointMake(inSideEdge.left , inSideEdge.top);
    CGPoint p2 = CGPointMake(inSideEdge.left, SCREEN_HEIGHT - inSideEdge.bottom);
    CGPoint p3 = CGPointMake(SCREEN_WIDTH - inSideEdge.right, SCREEN_HEIGHT - inSideEdge.bottom);
    CGPoint p4 = CGPointMake(SCREEN_WIDTH - inSideEdge.right, inSideEdge.top);
    
    
    //绘制路径
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p3];
    [path addLineToPoint:p4];
    [path addLineToPoint:p1];
    
    //添加对应的图层
    self.inSideLayer.path = path.CGPath;
    [self.layer addSublayer:_inSideLayer];
    
    //动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.duration = kAnimationTime * 2;
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:1.0];

    
    [_inSideLayer addAnimation:animation forKey:@"animationInside"];
}


#pragma mark - 盒子内侧线条
- (void)drawBoxLine
{
    //四角的起始点
    CGPoint p1 = CGPointMake(inSideEdge.left , inSideEdge.top);
    CGPoint p2 = CGPointMake(inSideEdge.left, SCREEN_HEIGHT - inSideEdge.bottom);
    CGPoint p3 = CGPointMake(SCREEN_WIDTH - inSideEdge.right, SCREEN_HEIGHT - inSideEdge.bottom);
    CGPoint p4 = CGPointMake(SCREEN_WIDTH - inSideEdge.right, inSideEdge.top);
    
    //四个角对应的结束点
    CGPoint end1 = CGPointMake((SCREEN_WIDTH - kBoxWidth) / 2.0, (SCREEN_HEIGHT - kBoxWidth) / 2.0);
    CGPoint end2 = CGPointMake((SCREEN_WIDTH - kBoxWidth) / 2.0, (SCREEN_HEIGHT + kBoxWidth) / 2.0);
    CGPoint end3 = CGPointMake((SCREEN_WIDTH + kBoxWidth) / 2.0, (SCREEN_HEIGHT + kBoxWidth) / 2.0);
    CGPoint end4 = CGPointMake((SCREEN_WIDTH + kBoxWidth) / 2.0, (SCREEN_HEIGHT - kBoxWidth) / 2.0);
    
    //四角发出的斜线
    CAShapeLayer *layer_1 = [self shapeLayerFromPoint:p1 toPoint:end1];
    CAShapeLayer *layer_2 = [self shapeLayerFromPoint:p2 toPoint:end2];
    CAShapeLayer *layer_3 = [self shapeLayerFromPoint:p3 toPoint:end3];
    CAShapeLayer *layer_4 = [self shapeLayerFromPoint:p4 toPoint:end4];
    
    [self.lineArray addObjectsFromArray:@[layer_1, layer_2, layer_3, layer_4]];
    
    //屏幕中心 也就是盒底的直线  //逆时针方向
    CAShapeLayer *layer_5 = [self shapeLayerFromPoint:end1 toPoint:end2];
    CAShapeLayer *layer_6 = [self shapeLayerFromPoint:end2 toPoint:end3];
    CAShapeLayer *layer_7 = [self shapeLayerFromPoint:end3 toPoint:end4];
    CAShapeLayer *layer_8 = [self shapeLayerFromPoint:end4 toPoint:end1];
    
    [self.lineArray addObjectsFromArray:@[layer_5, layer_6, layer_7, layer_8]];
    
    
}





- (CAShapeLayer *)shapeLayerFromPoint:(CGPoint)point1 toPoint:(CGPoint)point2
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.strokeColor = RGB(192, 60, 60).CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    
    [self.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = kAnimationTime * 0.6;
    animation.fromValue = @(0.0);
    animation.toValue = [NSNumber numberWithFloat:1.0];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [layer addAnimation:animation forKey:nil];
    
    return layer;
    
}


#pragma mark - 画cake
- (void)drawCake
{
    [self.layer addSublayer:self.cakeLayer];
    
    [_cakeLayer drawACakeWithAnimation];
}




#pragma mark - 动画结束
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSString *type = [anim valueForKey:kAnimationType];
    
    if ([type isEqualToString:kAnimationDisappear]) {
        //盒子线条隐藏动画结束
        NSLog(@"end");
        
    }
}

#pragma mark - 移除所有的盒子的线条 包括盒子内外侧
- (void)removeAllLine
{
    for (NSInteger i = _lineArray.count - 1; i >= 0; i --) {
        CAShapeLayer *layer = _lineArray[i];
        
        if (i == 3) {
            //隐藏斜线
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self removeLayerAfterAnimation:layer duration:0.5];
            });
        } else {
            //隐藏直线
            [self removeLayerAfterAnimation:layer duration:0.5];
        }
        
    }
    //线条隐藏完之后 再隐藏内外两侧的layer
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kAnimationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeLayerAfterAnimation:_inSideLayer duration:2.0 * kAnimationTime];
        [self removeLayerAfterAnimation:_outSideLayer duration:2.0 * kAnimationTime];
    });
    
    
}

//动画结束后移除掉对应的layer
- (void)removeLayerAfterAnimation:(CAShapeLayer *)layer duration:(NSTimeInterval)time
{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = time;
    animation.fromValue = @(1);
    animation.toValue = @(0);
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [layer addAnimation:animation forKey:nil];
    
//    animation.delegate = self;
//    [animation setValue:kAnimationDisappear forKey:kAnimationType];
    //动画执行完成后
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [layer removeAllAnimations];
        [layer removeFromSuperlayer];
    });
    
    
    
    
}


#pragma mark - lazyload
- (CAShapeLayer *)outSideLayer
{
    if (!_outSideLayer) {
        _outSideLayer = [CAShapeLayer layer];
        _outSideLayer.fillColor = [UIColor clearColor].CGColor;
        _outSideLayer.strokeColor = [UIColor whiteColor].CGColor;
        
    }
    
    return _outSideLayer;
}

- (CAShapeLayer *)inSideLayer
{
    if (!_inSideLayer) {
        _inSideLayer = [[CAShapeLayer alloc] init];
        _inSideLayer.fillColor = [UIColor clearColor].CGColor;
        _inSideLayer.strokeColor = RGB(254, 132, 1).CGColor;
    }
    
    return _inSideLayer;
}


- (NSMutableArray *)lineArray
{
    if (!_lineArray) {
        _lineArray = [NSMutableArray array];
    }
    
    return _lineArray;
}


- (GSCakeLayer *)cakeLayer
{
    if (!_cakeLayer) {
        _cakeLayer = [GSCakeLayer cakeLayer];
        _cakeLayer.bounds = CGRectMake(0, 0, kBoxWidth - 10, kBoxWidth - 10);
        _cakeLayer.position = self.center;
    }
    
    return _cakeLayer;
}


- (void)animationEndWithCompletionHandle:(dispatch_block_t)handle
{
    _handleBlock = handle;
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}


@end


























