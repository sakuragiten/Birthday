//
//  GSDiaryCollectionViewCell.m
//  DaaaQing
//
//  Created by gongsheng on 2017/11/10.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSDiaryCollectionViewCell.h"

@interface GSDiaryCollectionViewCell ()


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (nonatomic, strong) YYLabel *numLabel;
@end

@implementation GSDiaryCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setupUI];
}

- (void)setupUI
{
    CALayer *layerShadow = [[CALayer alloc] init];
    
    
    layerShadow.bounds = CGRectMake(0, 0, SCREEN_WIDTH - 32, 345);
    layerShadow.position = CGPointMake(16, 56);
    layerShadow.anchorPoint = CGPointZero;
    
//    layerShadow.shadowColor = [UIColor orangeRed].CGColor;
    layerShadow.shadowRadius = 6;
    layerShadow.shadowOpacity = 1;
    layerShadow.shadowOffset = CGSizeMake(6, 6);
    layerShadow.backgroundColor = [UIColor greenColor].CGColor;
    layerShadow.cornerRadius = 10.0;
//    [_imageView.layer addSublayer:layerShadow];
    [self.layer insertSublayer:layerShadow atIndex:0];
    
    _imageView.layer.cornerRadius = 10.0;
    _imageView.layer.masksToBounds = YES;
    
    

    
    
    [self addSubview:self.numLabel];
    
    CTFontDescriptorRef descRef = CTFontDescriptorCreateWithAttributes((__bridge CFDictionaryRef)@{(NSString *)kCTFontNameAttribute: kXingKaiFontName});
    NSArray *descs = @[(__bridge id)descRef];
    
    CTFontDescriptorMatchFontDescriptorsWithProgressHandler((CFArrayRef)descs, NULL, ^bool(CTFontDescriptorMatchingState state, CFDictionaryRef  _Nonnull progressParameter) {
        
        if (state == kCTFontDescriptorMatchingWillBeginDownloading) {
            NSLog(@"开始下载");
        } else if (state == kCTFontDescriptorMatchingDownloading) {
            double progressValue = [[(__bridge NSDictionary *)progressParameter objectForKey:(id)kCTFontDescriptorMatchingPercentage] doubleValue];
            NSLog(@"下载进度:%0.2lf",progressValue);
        } else if (state == kCTFontDescriptorMatchingDidFinishDownloading) {
            NSLog(@"下载完成");
            
            dispatch_async(dispatch_get_main_queue(), ^{
//                self.label.font = [UIFont fontWithName:fontName size:12];
            });
        } else if (state == kCTFontDescriptorMatchingDidBegin) {
            NSLog(@"开始");
        }
        
        return YES;
    });
    

    
    
    
}

- (void)setDiaryModel:(GSDiaryModel *)diaryModel
{
    _diaryModel = diaryModel;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:diaryModel.content];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:6];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, diaryModel.content.length)];
    _contentLabel.attributedText = attributedString;

    [_contentLabel sizeToFit];
    
    UIImage *image = [UIImage imageNamed:diaryModel.imageName];
    if (!image) image = [UIImage imageNamed:@"dq_0.jpg"];
    
    _imageView.image = image;
    
    NSString *numStr = [diaryModel.imageName substringFromIndex:3];
    
    _numLabel.attributedText = [self attrbuteStringWithNum:numStr.integerValue];
    
    _numLabel.textAlignment = NSTextAlignmentCenter;
    
    char c = [diaryModel.content characterAtIndex:0];
    if (c >= 'A' && c <= 'Z') {
        _contentLabel.font = [UIFont fontWithName:kCoolFontName size:16];
        
    } else {
        _contentLabel.font = [UIFont fontWithName:kXingKaiFontName size:16];
    }
}

- (NSAttributedString *)attrbuteStringWithNum:(NSInteger)num
{
    NSString *numStr = [NSString stringWithFormat:@" happy -> %ld", num + 1];
    
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    {
        [text appendAttributedString:[self emotionStringWithName:@"001"]];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:numStr];
        one.yy_font = [UIFont boldSystemFontOfSize:18];
        one.yy_color = [UIColor colorWithRed:1.000 green:0.029 blue:0.651 alpha:1.000];
        

        
        [text appendAttributedString:one];
    }
    
    {
        [text appendAttributedString:[self emotionStringWithName:@"029"]];
    }
    
    return text;
 
}

- (NSAttributedString *)emotionStringWithName:(NSString *)name
{

    NSString *path = [[NSBundle mainBundle] pathForScaledResource:name ofType:@"gif" inDirectory:@"EmoticonQQ.bundle"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    YYImage *image = [YYImage imageWithData:data scale:2];
    image.preloadAllAnimatedImageFrames = YES;
    YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
    
    NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.size alignToFont:[UIFont systemFontOfSize:18] alignment:YYTextVerticalAlignmentCenter];
    
    return attachText;
}


- (YYLabel *)numLabel
{
    if (!_numLabel) {
        _numLabel = [YYLabel new];

        _numLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 56);
    }
    
    return _numLabel;
}

@end
