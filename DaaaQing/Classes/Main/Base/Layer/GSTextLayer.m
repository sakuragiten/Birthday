//
//  GSTextLayer.m
//  DaaaQing
//
//  Created by Fireloli on 17/11/2.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSTextLayer.h"




@implementation GSTextLayer

+ (instancetype)layerWithText:(NSString *)text rect:(CGRect)rect
{
    return [[self alloc] initWithText:text rect:rect];
}

- (instancetype)initWithText:(NSString *)text rect:(CGRect)rect
{
    if (self = [super init]) {
        self.text = text;
        self.frame = rect;
        self.animationTime = kAnimationTime * 4; //默认
        self.font = [UIFont fontWithName:kCoolFontName size:40]; //默认
        self.backgroundColor = [UIColor clearColor].CGColor;
        [self drawTextWithAnimation];
    }
    return self;
}

- (void)drawTextWithAnimation
{
    UIBezierPath *path = [self pathForText];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    layer.position = CGPointMake(self.width * 0.5, self.height * 0.5);
    layer.bounds = CGPathGetBoundingBox(path.CGPath);
    layer.geometryFlipped = YES;
    layer.path = path.CGPath;

    layer.strokeColor = RGB(247, 165, 195).CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 2.0;
    layer.lineJoin = kCALineJoinBevel;
    
    [self addSublayer:layer];
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = _animationTime;
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    
    [layer addAnimation:animation forKey:nil];
    
}


//文本的动画路径
- (UIBezierPath *)pathForText
{
    CTFontRef ctFont = CTFontCreateWithName((CFStringRef)_font.fontName,
                                            _font.pointSize,
                                            NULL);

    CGMutablePathRef pathRef = CGPathCreateMutable();

    NSDictionary *attribute = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)ctFont, kCTFontAttributeName, nil];

    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:_text attributes:attribute];

    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attributeStr);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);

    for (CFIndex index = 0; index < CFArrayGetCount(runArray); index ++) {
        CTRunRef run = CFArrayGetValueAtIndex(runArray, index);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        for (CFIndex j = 0; j < CTRunGetGlyphCount(run); j ++) {
            CFRange range = CFRangeMake(j, 1);
            
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, range, &glyph);
            CTRunGetPositions(run, range, &position);
            
            
            CGPathRef path = CTFontCreatePathForGlyph(runFont, glyph, NULL);
            CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
            CGPathAddPath(pathRef, &t, path);
            CGPathRelease(path);
            
        }
    }
    CFRelease(line);

    UIBezierPath *path = [UIBezierPath bezierPath];

    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:pathRef]];

    CGPathRelease(pathRef);
    CFRelease(ctFont);
    
    return path;
}


- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end













