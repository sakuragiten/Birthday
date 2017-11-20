//
//  GSBirthdayView.m
//  DaaaQing
//
//  Created by Fireloli on 17/10/20.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSBirthdayView.h"


@interface GSBirthdayView ()<CAAnimationDelegate>

/** 盒子盖 */
@property (nonatomic, strong) CALayer *boxLibLayer;


/** 盒子体 */
@property (nonatomic, strong) CALayer *boxBodyLayer;

/** 盒子前面  正视图 用于遮挡音符 有种从盒子里面跑出来的感觉 */
@property (nonatomic, strong) CALayer *frontLayer;

/** 爱心 */
@property (nonatomic, strong) CALayer *heartLayer;

/** happy birthday text */
@property (nonatomic, strong) CALayer *textLayer;


/** 花絮 */
@property (nonatomic, strong) CALayer *blindLayer;

/** 左侧音符 */
@property (nonatomic, strong) CALayer *leftNoteLayer;

/** 中间音符 */
@property (nonatomic, strong) CALayer *midNoteLayer;

/** 右侧音符 */
@property (nonatomic, strong) CALayer *rightNoteLayer;

/** 爱心动画结束后的大小 */
@property (nonatomic, assign) CGRect heartBounds;

/** 文字 */
@property (nonatomic, strong) YYLabel *textLabel;

/** 点击 */
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;



@end

//内敛函数
static inline CGFloat BirthDegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;}


static NSTimeInterval const kAnimationDuriation = 1.0f;
static NSString *const kAnimationIdentifier = @"birthdayAnimationIdentifier";
static NSString *const kAnimationTypeLib = @"libAnimation";
static NSString *const kAnimationTypeHideText = @"textHideAnimation";
static NSString *const kAnimationTypeShowText = @"showTextAnimation";

@implementation GSBirthdayView



- (instancetype)init
{
    if (self = [super init]) {
        
        self.contentSize = CGSizeMake(Ration(281), Ration(271));
        self.animatedType = GSPopAnimatedPlain;
        self.superBgColor = [UIColor skyBlue];
        [self settingUI];
        [self addGestureRecognizer:self.tapGesture];
    }
    
    return self;
}

/** 初始化UI界面 */
- (void)settingUI
{
    
    //盒子体
    self.boxBodyLayer.position = CGPointMake(self.width * 0.5, self.height - 10);
    [self.layer addSublayer:_boxBodyLayer];
    
    
    
    //盒子盖   向下 移动16.5个像素
    self.boxLibLayer.position = CGPointMake(self.width * 0.5, _boxBodyLayer.top + Ration(16.5));
    
    
    //爱心
    CGPoint heartPosition = CGPointMake(self.width * 0.5, _boxLibLayer.bottom);
    self.heartLayer.position = heartPosition;
    [self.layer addSublayer:_heartLayer];
    
    //文字
    self.textLayer.position = heartPosition;
    [self.layer addSublayer:self.textLayer];
    
    //花絮
    self.blindLayer.position = heartPosition;
    [self.layer addSublayer:self.blindLayer];
    
    //音符
    CGPoint musicPosition = CGPointMake(self.width * 0.5, _boxLibLayer.bottom + self.leftNoteLayer.height * 0.5);
    
    self.leftNoteLayer.position = musicPosition;
    [self.layer addSublayer:_leftNoteLayer];
    
    self.rightNoteLayer.position = musicPosition;
    [self.layer addSublayer:_rightNoteLayer];
    
    self.midNoteLayer.position = musicPosition;
    [self.layer addSublayer:_midNoteLayer];
    
    //盒子前面
    self.frontLayer.position = CGPointMake(self.width * 0.5, self.height - 10);
    [self.layer addSublayer:_frontLayer];
    
    //盒盖最后添加 保证盒盖图层在最前端
    [self.layer addSublayer:_boxLibLayer];
    
    
    //最后的文字显示
    
    [self addSubview:self.textLabel];
    

    
    
}


- (NSAttributedString *)attributeTextAtFirst
{
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Shawna"];
        one.yy_font = [UIFont boldSystemFontOfSize:20];
        one.yy_color = [UIColor whiteColor];
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Here is your gift."];
        one.yy_font = [UIFont boldSystemFontOfSize:20];
        one.yy_color = [UIColor whiteColor];
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    return text;
}

- (NSAttributedString *)attributeTextAtLast
{
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Shawna"];
        one.yy_font = [UIFont boldSystemFontOfSize:26];
        one.yy_color = [UIColor whiteColor];
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    {
        
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Happy birthday!!!"];
        one.yy_font = [UIFont boldSystemFontOfSize:26];
        one.yy_color = [UIColor whiteColor];
        
        YYTextShadow *shadow = [YYTextShadow new];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        
        YYTextShadow *shadow0 = [YYTextShadow new];
        shadow0.color = [UIColor colorWithWhite:0.000 alpha:0.20];
        shadow0.offset = CGSizeMake(0, -1);
        shadow0.radius = 1.5;
        YYTextShadow *shadow1 = [YYTextShadow new];
        shadow1.color = [UIColor colorWithWhite:1 alpha:0.99];
        shadow1.offset = CGSizeMake(0, 1);
        shadow1.radius = 1.5;
        shadow0.subShadow = shadow1;
        
        YYTextShadow *innerShadow0 = [YYTextShadow new];
        innerShadow0.color = [UIColor colorWithRed:0.851 green:0.311 blue:0.000 alpha:0.780];
        innerShadow0.offset = CGSizeMake(0, 1);
        innerShadow0.radius = 1;
        
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setColor:[UIColor colorWithRed:1.000 green:0.795 blue:0.014 alpha:1.000]];
        [highlight setShadow:shadow0];
        [highlight setInnerShadow:innerShadow0];
        [one yy_setTextHighlight:highlight range:one.yy_rangeOfAll];
        
        [text appendAttributedString:one];
        
        [text appendAttributedString:[self padding]];
        [text appendAttributedString:[self padding]];
        [text appendAttributedString:[self padding]];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"DaaaQing"];
        one.yy_font = [UIFont boldSystemFontOfSize:16];
        one.yy_color = [UIColor redColor];
        
        YYTextBorder *border = [YYTextBorder new];
        border.cornerRadius = 50;
        border.insets = UIEdgeInsetsMake(0, -10, 0, -10);
        border.strokeWidth = 0.5;
        border.strokeColor = one.yy_color;
        border.lineStyle = YYTextLineStyleSingle;
        one.yy_textBackgroundBorder = border;
        
        YYTextBorder *highlightBorder = border.copy;
        highlightBorder.strokeWidth = 0;
        highlightBorder.strokeColor = one.yy_color;
        highlightBorder.fillColor = one.yy_color;
        
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setColor:[UIColor whiteColor]];
        [highlight setBackgroundBorder:highlightBorder];
        GSWeakSelf(weakSelf)
        highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            [weakSelf hideAnimated];
        };
        [one yy_setTextHighlight:highlight range:one.yy_rangeOfAll];
        
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    
    return text;
}
- (NSAttributedString *)padding {
    NSMutableAttributedString *pad = [[NSMutableAttributedString alloc] initWithString:@"\n\n"];
    pad.yy_font = [UIFont systemFontOfSize:4];
    return pad;
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSString *animationType = [anim valueForKey:kAnimationIdentifier];
    if ([animationType isEqualToString:kAnimationTypeLib]) {
        //盒盖移动的动画结束

        //1.弹出爱心
        [self showHeartWithAnimation];
   
        //2.显示音符
        [self showMusicNoteWithAnimation];
    } else if ([animationType isEqualToString:kAnimationTypeShowText]) {
        //爱心 和 “happy birthday ”文字的动画结束
        
        //隐藏 "happy birthday"的字样
        [self hideHappyTextWithAnimation];
        
    } else if ([animationType isEqualToString:kAnimationTypeHideText]) {
        //隐藏 "happy birthday"的字样 的动画结束
        [self showTextWithAnimation];
    }

    
}


#pragma mark - 最后字体的显示
- (void)showTextWithAnimation
{
    [UIView animateWithDuration:kAnimationDuriation delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _textLabel.alpha = 1;
    } completion:nil];
}



#pragma mark - “happy birthday ” 字样的隐藏动画
- (void)hideHappyTextWithAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:0.0];
    animation.duration = kAnimationDuriation;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    [animation setValue:kAnimationTypeHideText forKey:kAnimationIdentifier];
    [_textLayer addAnimation:animation forKey:kAnimationIdentifier];
}



#pragma mark - 爱心的动画
- (void)showHeartWithAnimation
{
    //爱心
    CABasicAnimation *heartAnimtion = [self heartAnimation];
    [_heartLayer addAnimation:heartAnimtion forKey:@"heartAnimtation"];
    _heartLayer.bounds = _heartBounds;
    
    //happy birthday text
    CABasicAnimation *textAnimation = [self heartAnimation];
    textAnimation.delegate = self;
    [textAnimation setValue:kAnimationTypeShowText forKey:kAnimationIdentifier];
    [_textLayer addAnimation:textAnimation forKey:@"textAnimtation"];
    _textLayer.bounds = _heartBounds;
    
    
    
    
    //花絮
    CABasicAnimation *blindAnimation = [self heartAnimation];
    [_blindLayer addAnimation:blindAnimation forKey:@"blindingAnimtation"];
    _blindLayer.bounds = _heartBounds;
    
    //最后显示的文字
    
}

- (CABasicAnimation *)heartAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = kAnimationDuriation;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:1.0];
    
    return animation;
}



#pragma mark - 显示音符
- (void)showMusicNoteWithAnimation
{
    CGFloat musicW = self.leftNoteLayer.width;
    CGFloat musicH = self.leftNoteLayer.height;
    
    CGPoint originPoint = CGPointMake(self.width * 0.5, _boxLibLayer.bottom + self.leftNoteLayer.height * 0.5);
    
    CGPoint leftEndPoint = CGPointMake(Ration(40) + musicW * 0.5, Ration(-70.0) + musicH * 0.5);
    CGPoint rightOneEndPoint = CGPointMake(Ration(168) + musicW * 0.5, Ration(-120) + musicH * 0.5);
    CGPoint rightTwoEndPoint = CGPointMake(Ration(275) + musicW * 0.5, Ration(-19) + musicH * 0.5);
    
    // leftMusicNotePath
    UIBezierPath *leftPath = [UIBezierPath bezierPath];
    [leftPath moveToPoint:originPoint];
    CGPoint leftControlPoint1 = CGPointMake(-10, self.height - 100);
    CGPoint leftControlPoint2 = CGPointMake(0, 0);
    [leftPath addCurveToPoint:leftEndPoint controlPoint1:leftControlPoint1 controlPoint2:leftControlPoint2];
    [self animationForBirthdayMusicAnimation:leftPath layer:self.leftNoteLayer];
    
    // rightOneMusicNotePath
    UIBezierPath *rightOnePath = [UIBezierPath bezierPath];
    [rightOnePath moveToPoint:originPoint];
    CGPoint rightOneControlPoint1 = CGPointMake(self.width*3/2, -self.height/3);
    CGPoint rightOneControlPoint2 = CGPointMake(0, self.height/2);
    [rightOnePath addCurveToPoint:rightOneEndPoint controlPoint1:rightOneControlPoint1 controlPoint2:rightOneControlPoint2];
    [self animationForBirthdayMusicAnimation:rightOnePath layer:self.midNoteLayer];
    
    // rightTwoMusicNotePath
    UIBezierPath *rightTwoPath = [UIBezierPath bezierPath];
    [rightTwoPath moveToPoint:originPoint];
    CGPoint rightTwoControlPoint1 = CGPointMake(self.width, self.height/2);
    CGPoint rightTwoControlPoint2 = CGPointMake(self.width*2/3, self.height/5);
    [rightTwoPath addCurveToPoint:rightTwoEndPoint controlPoint1:rightTwoControlPoint1 controlPoint2:rightTwoControlPoint2];
    [self animationForBirthdayMusicAnimation:rightTwoPath layer:self.rightNoteLayer];
    
}

- (void)animationForBirthdayMusicAnimation:(UIBezierPath *)bezierPath layer:(CALayer *)layer {
    // 音符位置变化
    CAKeyframeAnimation *musicAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    musicAnimation.path = bezierPath.CGPath;
    
    // 音符透明度变化
    CABasicAnimation *musicOpacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    musicOpacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    musicOpacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
  
    musicOpacityAnimation.beginTime = 0.2;

    
    // 音符组动画
    CAAnimationGroup * musicGroupAnimation = [CAAnimationGroup animation];
    musicGroupAnimation.animations = @[musicAnimation,musicOpacityAnimation];
    musicGroupAnimation.duration = kAnimationDuriation * 3;
    musicGroupAnimation.removedOnCompletion = NO;
    musicGroupAnimation.repeatCount = MAXFLOAT;
    musicGroupAnimation.fillMode = kCAFillModeForwards;
    musicGroupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [layer addAnimation:musicGroupAnimation forKey:@"musicGroupAnimation"];
}



#pragma mark - viewDidAppear
- (void)viewDidAppear
{
    
    
}

#pragma mark - viewWillDisAppear
- (void)viewWillDisAppear
{
    [_boxLibLayer removeAllAnimations];
    [_heartLayer removeAllAnimations];
    [_textLayer removeAllAnimations];
    _textLayer.hidden = YES;
    [_leftNoteLayer removeAllAnimations];
    [_midNoteLayer removeAllAnimations];
    [_rightNoteLayer removeAllAnimations];

}

#pragma mark - 开始动画
- (void)startAnimation
{
    _tapGesture.enabled = NO;
    _textLabel.alpha = 0;
    _textLabel.attributedText = [self attributeTextAtLast];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    
    //5秒以后 可以点击屏幕 隐藏礼物弹窗
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.outsideEnable = YES;
    });
    //移动盒盖
    
    NSMutableArray *values = [NSMutableArray array];
    for (NSInteger i = 1; i < 40; i++) {
        [values addObject:@(BirthDegreesToRadians(-i))];
    }
    
    //路径 移动
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = [self pathThatBoxLidMoved].CGPath;
    
    
    
    //旋转
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.values = values;
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[moveAnimation, rotationAnimation];
    group.delegate = self;
    group.duration = kAnimationDuriation;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    //防止动画结束 回到原处
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    //标记
    [group setValue:kAnimationTypeLib forKey:kAnimationIdentifier];
    
    [self.boxLibLayer addAnimation:group forKey:kAnimationTypeLib];
}



//绘制盒子移动的路径
- (UIBezierPath *)pathThatBoxLidMoved
{
    CGFloat radius = _boxBodyLayer.height * 0.5;
    
    CGFloat centerY = _boxBodyLayer.centerY;
    CGFloat centerX = _boxBodyLayer.centerX;
    // 盒子打开动画路径
    UIBezierPath *strokePath = [UIBezierPath bezierPath];
    for (NSInteger i = 1; i < 35; i++) {
        if (i < 30) {
            [strokePath addArcWithCenter:CGPointMake(centerX - i * 0.5, centerY - i / 15.0) radius:radius
                              startAngle:BirthDegreesToRadians(-90-(i-1))
                                endAngle:BirthDegreesToRadians(-90-i) clockwise:NO];
        } else {
            [strokePath addArcWithCenter:CGPointMake(centerX - (0.5 * i), centerY - 2 + (i - 30) / 2.5)
                                  radius:radius
                              startAngle:BirthDegreesToRadians(-90-(i-1))
                                endAngle:BirthDegreesToRadians(-90-i) clockwise:NO];
        }
    }
    for (NSInteger i = 1; i < 17; i++) {
        [strokePath addArcWithCenter:CGPointMake(centerX - 17 + (i - 1 )/ 5.0, centerY + i / 4.0) radius:radius
                          startAngle:BirthDegreesToRadians(-124-(i-1))
                            endAngle:BirthDegreesToRadians(-124-i) clockwise:NO];
    }
    for (NSInteger i = 1; i < 5; i++) {
        [strokePath addArcWithCenter:CGPointMake(centerX - 14 - i / 8.0 , centerY + 4 + i / 2.0) radius:radius
                          startAngle:BirthDegreesToRadians(-140 + (i-1))
                            endAngle:BirthDegreesToRadians(-140 + i) clockwise:YES];
    }
    for (NSInteger i = 0; i < 6; i++) {
        [strokePath addArcWithCenter:CGPointMake(centerX - 15 - i, centerY + 6 + i)
                              radius:radius -  3
                          startAngle:BirthDegreesToRadians(-140-(i-1))
                            endAngle:BirthDegreesToRadians(-140-i) clockwise:NO];
    }
    
    
    return strokePath;
}


#pragma mark - lazy load

- (CALayer *)heartLayer
{
    if (!_heartLayer) {
        _heartLayer = [self layerWithImageName:@"birthday_heart"];
        _heartBounds = _heartLayer.bounds;
        _heartLayer.bounds = CGRectZero;
    }
    
    return _heartLayer;
}

- (CALayer *)textLayer
{
    if (!_textLayer) {
        _textLayer = [self layerWithImageName:@"birthday_happyBirthday"];
        _textLayer.bounds = CGRectZero;
    }
    return _textLayer;
}

- (CALayer *)blindLayer
{
    if (!_blindLayer) {
        _blindLayer = [self layerWithImageName:@"birthday_blingbling"];
        _blindLayer.bounds = CGRectZero;
    }
    
    return _blindLayer;
}

- (CALayer *)leftNoteLayer
{
    if (!_leftNoteLayer) {
        _leftNoteLayer = [self layerWithImageName:@"birthday_music"];
    }
    return _leftNoteLayer;
}

- (CALayer *)rightNoteLayer
{
    if (!_rightNoteLayer) {
        _rightNoteLayer = [self layerWithImageName:@"birthday_music"];
    }
    return _rightNoteLayer;
}

- (CALayer *)midNoteLayer
{
    if (!_midNoteLayer) {
        _midNoteLayer = [self layerWithImageName:@"birthday_music_blurry"];
    }
    return _midNoteLayer;
}

- (CALayer *)frontLayer
{
    if (!_frontLayer) {
        _frontLayer = [self layerWithImageName:@"birthday_body_front"];
    }
    return _frontLayer;
}

- (CALayer *)boxLibLayer
{
    if (!_boxLibLayer) {
        _boxLibLayer = [self layerWithImageName:@"birthday_lid"];
    }
    
    return _boxLibLayer;
}

- (CALayer *)boxBodyLayer
{
    if (!_boxBodyLayer) {
        _boxBodyLayer = [self layerWithImageName:@"birthday_body"];
    }
    
    return _boxBodyLayer;
}

- (YYLabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[YYLabel alloc] init];
        _textLabel.attributedText = [self attributeTextAtFirst];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        
        _textLabel.frame = CGRectMake(10, Ration(30), self.width - 20, _heartBounds.size.height - 100);
        
        _textLabel.numberOfLines = 0;
    }
    
    return _textLabel;
}

- (UITapGestureRecognizer *)tapGesture
{
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startAnimation)];
    }
    
    return _tapGesture;
}


/** 根据图片的内容创建对应的Layer对象 */
- (CALayer *)layerWithImageName:(NSString *)imageName
{
    if (imageName.length == 0) return nil;
    UIImage *image = [UIImage imageNamed:imageName];
    CALayer *layer = [CALayer layer];
    [layer setContents:(id)image.CGImage];
    
    layer.bounds = CGRectMake(0, 0, Ration(image.size.width), Ration(image.size.height));
    layer.anchorPoint = CGPointMake(0.5, 1);
    
    return layer;
}


- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end
