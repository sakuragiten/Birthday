//
//  GSBasePopView.m
//  AgriculturalProduct
//
//  Created by Fireloli on 17/9/27.
//  Copyright © 2017年 cjwsc. All rights reserved.
//

#import "GSBasePopView.h"
//默认内容弹窗的大小
#define CONTENTWIDTH (250.0 * RATIO)
#define CONTENTHEIGHT (370.0 * RATIO)
#define CONTENTSIZE CGSizeMake(CONTENTWIDTH, CONTENTHEIGHT)
#define STARTFRAME CGRectMake(SCREEN_WIDTH * 0.5 - 2, SCREEN_HEIGHT * 0.5 - 2, 4, 4)
#define ANIMATIONTIME 0.5
@interface GSBasePopView ()<UIGestureRecognizerDelegate>

/** 背景蒙版 */
//@property (nonatomic, weak) UIView *popView;

/** 视图外侧的点击 */
@property (nonatomic, strong) UITapGestureRecognizer *outSideTap;

@property (nonatomic, assign) CGRect contentFrame;

@property (nonatomic, assign) CGFloat scale;

@end

@implementation GSBasePopView


- (instancetype)init
{
    if (self = [super init]) {
        _contentSize = CONTENTSIZE;
        _contentFrame.origin = CGPointMake((SCREEN_WIDTH - _contentSize.width) * 0.5, (SCREEN_HEIGHT - _contentSize.height) * 0.5);
        _contentFrame.size = _contentSize;
        
        _superBgColor = RGBAlpha(0, 0, 0, 0.5);
    }
    
    return self;
}

- (void)setOrinal:(CGPoint)orinal
{
    _orinal = orinal;
    _contentFrame.origin = orinal;
}

- (void)setContentSize:(CGSize)contentSize
{
    _contentSize = contentSize;
    _contentFrame.size = contentSize;
    
    self.size = contentSize;
}


- (void)setOutsideEnable:(BOOL)outsideEnable
{
    _outsideEnable = outsideEnable;
    
    self.outSideTap.enabled = _outsideEnable;
}

- (void)show
{
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIView *popView = [self bg_popView];
    [keyWindow addSubview:popView];
    
    
    [popView addSubview:self];
    _scale = 5.0 / _contentSize.width;
    
    [self prepareToShow];
    [self showAnimated];

}

- (void)showAnimated
{
    if (_animatedType == GSPopAnimatedPlain) {
        //默认方式
        [UIView animateWithDuration:ANIMATIONTIME delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.superview.backgroundColor = _superBgColor;
            [self animatedShowEndStatus];
        } completion:^(BOOL finished) {
            [self viewDidAppear];
        }];
    } else {
        [UIView animateWithDuration:ANIMATIONTIME delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.superview.backgroundColor = _superBgColor;
            [self animatedShowEndStatus];
            
        } completion:^(BOOL finished) {
            [self viewDidAppear];
        }];
    }
  
    
}


- (void)hideAnimated
{
    [self viewWillDisAppear];
    [UIView animateWithDuration:ANIMATIONTIME  delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.superview.backgroundColor = [_superBgColor changeColorValueInType:GSColorTypeAlpha value:-1];
        [self animatedHideEndStatus];
    } completion:^(BOOL finished) {

        [self.superview removeFromSuperview];
    }];
}

/** 显示之前 */
- (void)prepareToShow
{

//    __weak typeof(self) weakSelf = self;
    GSWeakSelf(weakSelf)
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.superview);

        make.size.mas_equalTo(weakSelf.contentSize);
    }];
    self.transform = CGAffineTransformMakeScale(_scale, _scale);
}

/** 展示的时候动画结束的状态 */
- (void)animatedShowEndStatus
{

    self.transform = CGAffineTransformIdentity;
}

/** 显示动画结束 */
- (void)viewDidAppear
{
    
}

/** 即将移除弹窗 */
- (void)viewWillDisAppear
{
    
}

//隐藏的时候动画结束状态
- (void)animatedHideEndStatus
{

    self.transform = CGAffineTransformMakeScale(_scale, _scale);
    
}


- (UIView *)bg_popView
{
    UIView  *popView = [[UIView alloc] initWithFrame:SCREEN_BOUNDS];
    popView.backgroundColor = [_superBgColor changeColorValueInType:GSColorTypeAlpha value:-0.5];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideAnimated)];
//    tap.delegate = self;
//    tap.enabled = _outsideEnable;
    [popView addGestureRecognizer:self.outSideTap];
    
    return popView;
}

- (UITapGestureRecognizer *)outSideTap
{
    if (!_outSideTap) {
        _outSideTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideAnimated)];
        _outSideTap.delegate = self;
        _outSideTap.enabled = _outsideEnable;
    }
    return _outSideTap;
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    CGPoint p = [touch locationInView:self.superview];
//    NSLog(@"point:%@",NSStringFromCGPoint(p));

    if (CGRectContainsPoint(_contentFrame, p)) {
//        NSLog(@"ininininininin");
        return NO;
    }
    return YES;
}




@end
