//
//  GSCakeLayer.m
//  DaaaQing
//
//  Created by Fireloli on 17/11/1.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSCakeLayer.h"



@implementation GSCakeLayer

+ (instancetype)cakeLayer
{
    return [[self alloc] init];
}


- (void)drawACakeWithAnimation
{
    NSLog(@"begin");
//    self.backgroundColor = [UIColor orpimentColor].CGColor;
    
    //1.画蛋糕的底托 耗时0.5 结束时间 0.5
    [self drawCakeHolder];
    
    //2.画蛋糕的底层 耗时0.5 结束时间 0.6
    [self performSelector:@selector(drawCakeBottomLayer) withObject:nil afterDelay:0.1];
    
    //3.画蛋糕底层的纹理 耗时0.4 结束时间 0.6
    [self performSelector:@selector(drawCakeBottomLayerStripe) withObject:nil afterDelay:0.2];
    
    //4.画蛋糕的顶层 耗时0.5 结束时间 0.8
    [self performSelector:@selector(drawCakeTopLayer) withObject:nil afterDelay:0.3];
    
    //5.画蛋糕顶层的纹理 耗时0.4 结束时间 0.8
    [self performSelector:@selector(drawCakeTopLayerStripe) withObject:nil afterDelay:0.4];
    
    //6.顶部的樱桃 耗时0.3 结束时间 0.7
    [self performSelector:@selector(drawCherry) withObject:nil afterDelay:0.4];
    
    //7.樱桃杆 耗时0.1 结束时间 0.6
    [self performSelector:@selector(drawCherryTrunk) withObject:nil afterDelay:0.5];
    
    //8.蜡烛 耗时0.3 结束时间 0.9
    [self performSelector:@selector(drawCandle) withObject:nil afterDelay:0.6];
    
    //9.火焰 耗时0.1 结束时间 0.7
    [self performSelector:@selector(drawCandleFire) withObject:nil afterDelay:0.6];
}



#pragma mark - 绘制蛋糕底托
- (void)drawCakeHolder
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGPoint p1 = CGPointMake(5, self.height - 10);
    CGPoint p2 = CGPointMake(self.width - 5, self.height - 10);
    
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    
    CAShapeLayer *layer = [self shapLayerWithPath:path];
    layer.strokeColor = RGB(176, 60, 61).CGColor;
    
    [self strokeAnimationForLayer:layer duration:0.5];
    
}

#pragma mark - 绘制蛋糕底层
- (void)drawCakeBottomLayer
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGPoint p1 = CGPointMake(15, self.height - 10);
    CGPoint p2 = CGPointMake(10, self.height - 50);
    
    CGPoint p3 = CGPointMake(15, self.height - 63);
    CGPoint p4 = CGPointMake(26, self.height - 70);
    CGPoint p5 = CGPointMake(self.width * 0.5, self.height - 75);
    
    CGPoint p6 = CGPointMake(self.width - 26, self.height - 70);
    CGPoint p7 = CGPointMake(self.width - 15, self.height - 63);
    CGPoint p8 = CGPointMake(self.width - 10, self.height - 50);
    
    CGPoint p9 = CGPointMake(self.width - 15, self.height - 10);
    
    //添加直线
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    
    //第一段曲线 中心位置
    [path addCurveToPoint:p5 controlPoint1:p3 controlPoint2:p4];
    
    //第二段曲线 与第一段曲线关于中轴对称
    [path addCurveToPoint:p8 controlPoint1:p7 controlPoint2:p6];
    
    //最后一段直线 与第一段直线关于中轴对称
    [path addLineToPoint:p9];
    
    CAShapeLayer *layer = [self shapLayerWithPath:path];
    
    [self strokeAnimationForLayer:layer duration:0.5];
    
}


#pragma mark - 绘制底层波浪
- (void)drawCakeBottomLayerStripe
{
    CGPoint p1 = CGPointMake(15, self.height - 48);
    
    CGPoint p2 = CGPointMake(30, self.height - 30);
    CGPoint p3 = CGPointMake(50, self.height - 50);
    CGPoint p4 = CGPointMake(67, self.height - 51);
    
    CGPoint p5 = CGPointMake(77, self.height - 32);
    CGPoint p6 = CGPointMake(89, self.height - 51);
    CGPoint p7 = CGPointMake(111, self.height - 49);
    
    CGPoint p8 = CGPointMake(128, self.height - 24);
    CGPoint p9 = CGPointMake(136, self.height - 45);
    CGPoint p10 = CGPointMake(156, self.height - 46);
    
    CGPoint p11 = CGPointMake(171, self.height - 34);
    CGPoint p12 = CGPointMake(185, self.height - 46);
    CGPoint p13 = CGPointMake(self.width - 15, self.height - 48);
    

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:p1];
    [path addCurveToPoint:p4 controlPoint1:p2 controlPoint2:p3];
    [path addCurveToPoint:p7 controlPoint1:p5 controlPoint2:p6];
    [path addCurveToPoint:p10 controlPoint1:p8 controlPoint2:p9];
    [path addCurveToPoint:p13 controlPoint1:p11 controlPoint2:p12];
    
    CAShapeLayer *layer = [self shapLayerWithPath:path];
    layer.lineWidth = 4.0;
    
    [self strokeAnimationForLayer:layer duration:0.4];
    
}

#pragma mark - 绘制蛋糕顶层
- (void)drawCakeTopLayer
{
    CGPoint p1 = CGPointMake(40, self.height - 70);
    CGPoint p2 = CGPointMake(35, self.height - 90);
    
    CGPoint p3 = CGPointMake(45, self.height - 105);
    CGPoint p4 = CGPointMake(50, self.height - 110);
    CGPoint p5 = CGPointMake(self.width * 0.5, self.height - 115); //中心点
    
    CGPoint p6 = CGPointMake(self.width - 50, self.height - 110);
    CGPoint p7 = CGPointMake(self.width - 45, self.height - 105);
    CGPoint p8 = CGPointMake(self.width - 35, self.height - 90);
    
    CGPoint p9 = CGPointMake(self.width - 40, self.height - 70);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addCurveToPoint:p5 controlPoint1:p3 controlPoint2:p4];
    [path addCurveToPoint:p8 controlPoint1:p6 controlPoint2:p7];
    [path addLineToPoint:p9];
    
    CAShapeLayer *layer = [self shapLayerWithPath:path];
    
    [self strokeAnimationForLayer:layer duration:0.5];
    
}


#pragma mark - 绘制蛋糕顶层的纹理
- (void)drawCakeTopLayerStripe
{
    CGPoint p1 = CGPointMake(35, self.height - 90);
    
    CGPoint p2 = CGPointMake(52, self.height - 86);
    CGPoint p3 = CGPointMake(66, self.height - 92);
    CGPoint p4 = CGPointMake(77, self.height - 103);
    
    CGPoint p5 = CGPointMake(94, self.height - 87);
    CGPoint p6 = CGPointMake(113, self.height - 86);
    CGPoint p7 = CGPointMake(126, self.height - 89);
    
    CGPoint p8 = CGPointMake(143, self.height - 98);
    CGPoint p9 = CGPointMake(151, self.height - 92);
    CGPoint p10 = CGPointMake(170, self.height - 86);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:p1];
    [path addCurveToPoint:p4 controlPoint1:p2 controlPoint2:p3];
    [path addCurveToPoint:p7 controlPoint1:p5 controlPoint2:p6];
    [path addCurveToPoint:p10 controlPoint1:p8 controlPoint2:p9];
    
    CAShapeLayer *layer = [self shapLayerWithPath:path];
    layer.lineWidth = 4.0;
    
    [self strokeAnimationForLayer:layer duration:0.4];
}



#pragma mark - 绘制顶部的樱桃
- (void)drawCherry
{
    //画三个圆 先确定圆的中心
    CGPoint r1 = CGPointMake(70, self.height - 122);
    CGPoint r2 = CGPointMake(self.width * 0.5, self.height - 129);
    CGPoint r3 = CGPointMake(self.width - 70, self.height - 121);
    
    [self circleLayerAt:r1 radius:8];
    [self circleLayerAt:r2 radius:10];
    [self circleLayerAt:r3 radius:7];
    
}

- (void)circleLayerAt:(CGPoint)center radius:(CGFloat)radius
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:center radius:radius startAngle:0 endAngle:(2 * M_PI) clockwise:NO];
    
    CAShapeLayer *layer = [self shapLayerWithPath:path];
    layer.lineWidth = 3;
    layer.strokeColor = RGB(240, 36, 79).CGColor;
    
    [self strokeAnimationForLayer:layer duration:0.3];
    
}

#pragma mark - 绘制樱桃杆
- (void)drawCherryTrunk
{
    //第一个樱桃杆
    CGPoint p1 = CGPointMake(70, self.height - 125);
    CGPoint p2 = CGPointMake(66, self.height - 127);
    CGPoint p3 = CGPointMake(60, self.height - 129);
    
    [self cherryTrunAt:p1 control1:p2 control2:p3];
    
    //第二个樱桃杆
    CGPoint p4 = CGPointMake(self.width * 0.5 + 2, self.height - 134);
    CGPoint p5 = CGPointMake(self.width * 0.5 + 4, self.height - 138);
    CGPoint p6 = CGPointMake(self.width * 0.5 + 2, self.height - 146);
    
    [self cherryTrunAt:p4 control1:p5 control2:p6];
    
    //第三个樱桃杆
    CGPoint p7 = CGPointMake(self.width - 70, self.height - 124);
    CGPoint p8 = CGPointMake(self.width - 66, self.height - 125);
    CGPoint p9 = CGPointMake(self.width - 60, self.height - 126);
    
    [self cherryTrunAt:p7 control1:p8 control2:p9];
    
    
}

- (void)cherryTrunAt:(CGPoint)endPoint control1:(CGPoint)c1 control2:(CGPoint)c2
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:endPoint];
    
    [path addCurveToPoint:c2 controlPoint1:c1 controlPoint2:c2];
    
    CAShapeLayer *layer = [self shapLayerWithPath:path];
    layer.strokeColor = RGB(254, 131, 1).CGColor;
    layer.lineWidth = 2.0;
    
    [self strokeAnimationForLayer:layer duration:0.1];
}



#pragma mark - 绘制蜡烛
- (void)drawCandle
{
    CGPoint p1 = CGPointMake(self.width - 55, self.height - 110);
    CGPoint p2 = CGPointMake(self.width - 45, self.height - 150);
    CGPoint p3 = CGPointMake(self.width - 38, self.height - 148);
    CGPoint p4 = CGPointMake(self.width - 48, self.height - 106);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p3];
    [path addLineToPoint:p4];
    
    CAShapeLayer *layer = [self shapLayerWithPath:path];
    
    layer.lineWidth = 3;
    layer.strokeColor = RGB(247, 88, 88).CGColor;
    
    [self strokeAnimationForLayer:layer duration:0.3];
    
    
}


#pragma mark - 绘制火焰
- (void)drawCandleFire
{
    CGPoint p1 = CGPointMake(self.width - 41, self.height - 153);
    CGPoint p2 = CGPointMake(self.width - 45, self.height - 159);
    CGPoint p3 = CGPointMake(self.width - 41, self.height - 167);
    CGPoint p4 = CGPointMake(self.width - 37, self.height - 159);
    
    UIBezierPath *path =[UIBezierPath bezierPath];
    [path moveToPoint:p1];
    [path addCurveToPoint:p3 controlPoint1:p2 controlPoint2:p3];
    [path addCurveToPoint:p1 controlPoint1:p3 controlPoint2:p4];
    
    CAShapeLayer *layer = [self shapLayerWithPath:path];
    layer.strokeColor = RGB(242, 193, 34).CGColor;
    layer.lineWidth = 2.0;
    
    [self strokeAnimationForLayer:layer duration:0.1];
    
}

- (CAShapeLayer *)shapLayerWithPath:(UIBezierPath *)path
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 6.0;
    layer.strokeColor = RGB(254, 131, 1).CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    [self addSublayer:layer];
    return layer;
}


- (void)strokeAnimationForLayer:(CAShapeLayer *)layer duration:(NSTimeInterval)duration
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = duration;
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    [layer addAnimation:animation forKey:@"animationStroke"];
}



@end
