//
//  GSTool.m
//  DaaaQing
//
//  Created by Fireloli on 17/11/7.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSTool.h"
@interface GSTool ()



@end
@implementation GSTool

SingletonImplementation(Tool)




#pragma mark - 二维码
- (UIImage *)qrCoderWithContent:(NSString *)string
{
    // 1. 创建一个二维码滤镜实例(CIFilter)
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 滤镜恢复默认设置
    [filter setDefaults];
    
    // 2. 给滤镜添加数据
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //    NSData *data = UIImagePNGRepresentation([UIImage imageNamed:@"birthday.jpeg"]);
    // 使用KVC的方式给filter赋值
    [filter setValue:data forKeyPath:@"inputMessage"];
    
    // 3. 生成二维码
    CIImage *image = [filter outputImage];
    
    
    
    return [self createNonInterpolatedUIImageFormCIImage:image withSize:2000];
}



- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}


#pragma mark - 摇一摇切换环境 写在控制器里
//- (void)shakeToChangeEnvironmentEnable:(BOOL)enable
//{
//    //设置摇一摇功能
//    [UIApplication sharedApplication].applicationSupportsShakeToEdit = enable;
//
//    //并让自己成为第一响应者
//    [self becomeFirstResponder];
//}

//开始摇动
//- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    if (_aletShow) return; //弹窗已经弹出
//    _aletShow = YES;
//    NSNumber *environment = [[NSUserDefaults standardUserDefaults] objectForKey:@"userEnvironment"];
//    NSArray *environmentArray = @[@"测试环境",@"开发环境",@"灰度环境",@"正式环境"];
//    NSString *currentEnvironment = environmentArray[environment.integerValue];
//    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"当前环境:%@", currentEnvironment] message:@"切换不同环境需要重新登录哦😀" preferredStyle:UIAlertControllerStyleAlert];
//    for (int i = 0; i < environmentArray.count; i++) {
//        NSString *e = environmentArray[i];
//        if (i == environment.integerValue) {
//            e = [e stringByAppendingString:@"(当前)"];
//        }
//        UIAlertAction *action = [UIAlertAction actionWithTitle:e style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            _aletShow = NO;
//            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:i] forKey:@"userEnvironment"];
//            [alertVC addAction:action];
//        }];
//    }
//
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        _aletShow = NO;
//    }];
//
//    [alertVC addAction:cancel];
//
//    [self presentViewController:alertVC animated:YES completion:nil];
//
//}


#pragma mark - 打印系统字体
- (void)printSystemFontsName
{
    NSArray*familyNames = [UIFont familyNames];
    
    for(NSString*familyName in familyNames )
        
    {
        
        printf("Family: %s \n", [familyName UTF8String]);
        
        NSArray*fontNames = [UIFont fontNamesForFamilyName:familyName];
        
        for(NSString*fontName in fontNames )
            
        {
            
            printf("\tFont: %s \n", [fontName UTF8String] );
            
        }
    }
}


@end
