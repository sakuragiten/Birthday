//
//  UIColor+extension.m
//  DaaaQing
//
//  Created by Fireloli on 17/10/19.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "UIColor+extension.h"

@implementation UIColor (extension)


#pragma mark - 随机颜色
+ (instancetype)randomColor
{
    int r = arc4random() % 256;
    int g = arc4random() % 256;
    int b = arc4random() % 256;
    
    return RGB(r, g, b);
}


- (CGColorSpaceModel)colorSpaceModel
{
    return CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
}

- (NSString *)colorSpaceString
{
    switch ([self colorSpaceModel])
    {
        case kCGColorSpaceModelUnknown:
            return @"kCGColorSpaceModelUnknown";
        case kCGColorSpaceModelMonochrome: //单色
            return @"kCGColorSpaceModelMonochrome";
        case kCGColorSpaceModelRGB:
            return @"kCGColorSpaceModelRGB";
        case kCGColorSpaceModelCMYK:
            return @"kCGColorSpaceModelCMYK";
        case kCGColorSpaceModelLab:
            return @"kCGColorSpaceModelLab";
        case kCGColorSpaceModelDeviceN:
            return @"kCGColorSpaceModelDeviceN";
        case kCGColorSpaceModelIndexed:
            return @"kCGColorSpaceModelIndexed";
        case kCGColorSpaceModelPattern:
            return @"kCGColorSpaceModelPattern";
        default:
            return @"Not a valid color space";
    }
}

- (CGFloat)red
{
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    return c[0];
}

- (CGFloat)green
{
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    if ([self colorSpaceModel] == kCGColorSpaceModelMonochrome) return c[0];
    return c[1];
}

- (CGFloat)blue
{
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    if ([self colorSpaceModel] == kCGColorSpaceModelMonochrome) return c[0];
    return c[2];
}

- (CGFloat)alpha
{
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    return c[CGColorGetNumberOfComponents(self.CGColor)-1];
}

/** 相反的颜色 */
- (UIColor *)reverseColor
{
    float r= 1 - [self red];
    float g= 1 - [self green];
    float b= 1 - [self blue];
    float alpha= [self alpha];
    UIColor *rcolor = [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    return rcolor;
}

- (void)printDetail
{
    float r= [self red];
    float g= [self green];
    float b= [self blue];
    float R= [self red] * 255;
    float G= [self green] *255;
    float B= [self blue] *255;
    float alpha= [self alpha];
    NSLog(@"\nThis Color's Red:%.0f, Green:%.0f, Blue:%.0f, Alpha:%.0f\ndecimal red:%.4f green:%.4f blue:%.4f \nHexadecimal 0x%x%x%x",R,G,B,alpha,r,g,b,(int)R,(int)G,(int)B);
}





- (UIColor *)changeColorValueInType:(GSColorType)type value:(NSInteger)degree
{
    float r = [self red] * 255.0;
    float g = [self green] * 255.0;
    float b = [self blue] * 255.0;
    float a = [self alpha];
    
    switch (type) {
        case 1:
            return RGBAlpha(r+degree, g, b, a);
        case 2:
            return RGBAlpha(r, g+degree, b, a);
        case 3:
            return RGBAlpha(r, g, b+degree, a);
        case 4:
            return RGBAlpha(r, g, b, a+degree);
        default:
            return self;
    }
}





#pragma mark - **************** 红色系
/** 薄雾玫瑰*/
+ (UIColor *)mistyRose
{
    return RGB16Color(0xFFE4E1);
}
/** 浅鲑鱼色*/
+ (UIColor *)lightSalmon
{
    return RGB16Color(0xFFA07A);
}
/** 淡珊瑚色*/
+ (UIColor *)lightCoral
{
    return RGB16Color(0xF08080);
}
/** 鲑鱼色*/
+ (UIColor *)salmonColor
{
    return RGB16Color(0xFA8072);
}
/** 珊瑚色*/
+ (UIColor *)coralColor
{
    return RGB16Color(0xFF7F50);
}
/** 番茄*/
+ (UIColor *)tomatoColor
{
    return RGB16Color(0xFF6347);
}
/** 橙红色*/
+ (UIColor *)orangeRed
{
    return RGB16Color(0xFF4500);
}
/** 印度红*/
+ (UIColor *)indianRed
{
    return RGB16Color(0xCD5C5C);
}
/** 猩红*/
+ (UIColor *)crimsonColor
{
    return RGB16Color(0xDC143C);
}
/** 耐火砖*/
+ (UIColor *)fireBrick
{
    return RGB16Color(0xB22222);
}


#pragma mark - **************** 黄色系
/** 玉米色*/
+ (UIColor *)cornColor
{
    return RGB16Color(0xFFF8DC);
}
/** 柠檬薄纱*/
+ (UIColor *)LemonChiffon
{
    return RGB16Color(0xFFFACD);
}
/** 苍金麒麟*/
+ (UIColor *)paleGodenrod
{
    return RGB16Color(0xEEE8AA);
}
/** 卡其色*/
+ (UIColor *)khakiColor
{
    return RGB16Color(0xF0E68C);
}
/** 金色*/
+ (UIColor *)goldColor
{
    return RGB16Color(0xFFD700);
}
/** 雌黄*/
+ (UIColor *)orpimentColor
{
    return RGB16Color(0xFFC64B);
}
/** 藤黄*/
+ (UIColor *)gambogeColor
{
    return RGB16Color(0xFFB61E);
}
/** 雄黄*/
+ (UIColor *)realgarColor
{
    return RGB16Color(0xE9BB1D);
}
/** 金麒麟色*/
+ (UIColor *)goldenrod
{
    return RGB16Color(0xDAA520);
}
/** 乌金*/
+ (UIColor *)darkGold
{
    return RGB16Color(0xA78E44);
}


#pragma mark - **************** 绿色系
/** 苍绿*/
+ (UIColor *)paleGreen
{
    return RGB16Color(0x98FB98);
}
/** 淡绿色*/
+ (UIColor *)lightGreen
{
    return RGB16Color(0x90EE90);
}
/** 春绿*/
+ (UIColor *)springGreen
{
    return RGB16Color(0x2AFD84);
}
/** 绿黄色*/
+ (UIColor *)greenYellow
{
    return RGB16Color(0xADFF2F);
}
/** 草坪绿*/
+ (UIColor *)lawnGreen
{
    return RGB16Color(0x7CFC00);
}
/** 酸橙绿*/
+ (UIColor *)limeColor
{
    return RGB16Color(0x00FF00);
}
/** 森林绿*/
+ (UIColor *)forestGreen
{
    return RGB16Color(0x228B22);
}
/** 海洋绿*/
+ (UIColor *)seaGreen
{
    return RGB16Color(0x2E8B57);
}
/** 深绿*/
+ (UIColor *)darkGreen
{
    return RGB16Color(0x006400);
}
/** 橄榄(墨绿)*/
+ (UIColor *)olive
{
    return RGB16Color(0x556B2F);
}


#pragma mark - **************** 青色系
/** 淡青色*/
+ (UIColor *)lightCyan
{
    return RGB16Color(0xE1FFFF);
}
/** 苍白绿松石*/
+ (UIColor *)paleTurquoise
{
    return RGB16Color(0xAFEEEE);
}
/** 绿碧*/
+ (UIColor *)aquamarine
{
    return RGB16Color(0x7FFFD4);
}
/** 绿松石*/
+ (UIColor *)turquoise
{
    return RGB16Color(0x40E0D0);
}
/** 适中绿松石*/
+ (UIColor *)mediumTurquoise
{
    return RGB16Color(0x48D1CC);
}
/** 美团色*/
+ (UIColor *)meituanColor
{
    return RGB16Color(0x2BB8AA);
}
/** 浅海洋绿*/
+ (UIColor *)lightSeaGreen
{
    return RGB16Color(0x20B2AA);
}
/** 深青色*/
+ (UIColor *)darkCyan
{
    return RGB16Color(0x008B8B);
}
/** 水鸭色*/
+ (UIColor *)tealColor
{
    return RGB16Color(0x008080);
}
/** 深石板灰*/
+ (UIColor *)darkSlateGray
{
    return RGB16Color(0x2F4F4F);
}


#pragma mark - **************** 蓝色系
/** 天蓝色*/
+ (UIColor *)skyBlue
{
    return RGB16Color(0xE1FFFF);
}
/** 淡蓝*/
+ (UIColor *)lightBLue
{
    return RGB16Color(0xADD8E6);
}
/** 深天蓝*/
+ (UIColor *)deepSkyBlue
{
    return RGB16Color(0x00BFFF);
}
/** 道奇蓝*/
+ (UIColor *)doderBlue
{
    return RGB16Color(0x1E90FF);
}
/** 矢车菊*/
+ (UIColor *)cornflowerBlue
{
    return RGB16Color(0x6495ED);
}
/** 皇家蓝*/
+ (UIColor *)royalBlue
{
    return RGB16Color(0x4169E1);
}
/** 适中的蓝色*/
+ (UIColor *)mediumBlue
{
    return RGB16Color(0x0000CD);
}
/** 深蓝*/
+ (UIColor *)darkBlue
{
    return RGB16Color(0x00008B);
}
/** 海军蓝*/
+ (UIColor *)navyColor
{
    return RGB16Color(0x000080);
}
/** 午夜蓝*/
+ (UIColor *)midnightBlue
{
    return RGB16Color(0x191970);
}


#pragma mark - **************** 紫色系
/** 薰衣草*/
+ (UIColor *)lavender
{
    return RGB16Color(0xE6E6FA);
}
/** 蓟*/
+ (UIColor *)thistleColor
{
    return RGB16Color(0xD8BFD8);
}
/** 李子*/
+ (UIColor *)plumColor
{
    return RGB16Color(0xDDA0DD);
}
/** 紫罗兰*/
+ (UIColor *)violetColor
{
    return RGB16Color(0xEE82EE);
}
/** 适中的兰花紫*/
+ (UIColor *)mediumOrchid
{
    return RGB16Color(0xBA55D3);
}
/** 深兰花紫*/
+ (UIColor *)darkOrchid
{
    return RGB16Color(0x9932CC);
}
/** 深紫罗兰色*/
+ (UIColor *)darkVoilet
{
    return RGB16Color(0x9400D3);
}
/** 泛蓝紫罗兰*/
+ (UIColor *)blueViolet
{
    return RGB16Color(0x8A2BE2);
}
/** 深洋红色*/
+ (UIColor *)darkMagenta
{
    return RGB16Color(0x8B008B);
}
/** 靛青*/
+ (UIColor *)indigoColor
{
    return RGB16Color(0x4B0082);
}


#pragma mark - **************** 灰色系
/** 白烟*/
+ (UIColor *)whiteSmoke
{
    return RGB16Color(0xF5F5F5);
}
/** 鸭蛋*/
+ (UIColor *)duckEgg
{
    return RGB16Color(0xE0EEE8);
}
/** 亮灰*/
+ (UIColor *)gainsboroColor
{
    return RGB16Color(0xDCDCDC);
}
/** 蟹壳青*/
+ (UIColor *)carapaceColor
{
    return RGB16Color(0xBBCDC5);
}
/** 银白色*/
+ (UIColor *)silverColor
{
    return RGB16Color(0xC0C0C0);
}
/** 暗淡的灰色*/
+ (UIColor *)dimGray
{
    return RGB16Color(0x696969);
}


#pragma mark - **************** 白色系
/** 海贝壳*/
+ (UIColor *)seaShell
{
    return RGB16Color(0xFFF5EE);
}
/** 雪*/
+ (UIColor *)snowColor
{
    return RGB16Color(0xFFFAFA);
}
/** 亚麻色*/
+ (UIColor *)linenColor
{
    return RGB16Color(0xFAF0E6);
}
/** 花之白*/
+ (UIColor *)floralWhite
{
    return RGB16Color(0xFFFAF0);
}
/** 老饰带*/
+ (UIColor *)oldLace
{
    return RGB16Color(0xFDF5E6);
}
/** 象牙白*/
+ (UIColor *)ivoryColor
{
    return RGB16Color(0xFFFFF0);
}
/** 蜂蜜露*/
+ (UIColor *)honeydew
{
    return RGB16Color(0xF0FFF0);
}
/** 薄荷奶油*/
+ (UIColor *)mintCream
{
    return RGB16Color(0xF5FFFA);
}
/** 蔚蓝色*/
+ (UIColor *)azureColor
{
    return RGB16Color(0xF0FFFF);
}
/** 爱丽丝蓝*/
+ (UIColor *)aliceBlue
{
    return RGB16Color(0xF0F8FF);
}
/** 幽灵白*/
+ (UIColor *)ghostWhite
{
    return RGB16Color(0xF8F8FF);
}
/** 淡紫红*/
+ (UIColor *)lavenderBlush
{
    return RGB16Color(0xFFF0F5);
}
/** 米色*/
+ (UIColor *)beigeColor
{
    return RGB16Color(0xF5F5DD);
}


#pragma mark - **************** 棕色系
/** 黄褐色*/
+ (UIColor *)tanColor
{
    return RGB16Color(0xD2B48C);
}
/** 玫瑰棕色*/
+ (UIColor *)rosyBrown
{
    return RGB16Color(0xBC8F8F);
}
/** 秘鲁*/
+ (UIColor *)peruColor
{
    return RGB16Color(0xCD853F);
}
/** 巧克力*/
+ (UIColor *)chocolateColor
{
    return RGB16Color(0xD2691E);
}
/** 古铜色*/
+ (UIColor *)bronzeColor // $$$$$
{
    return RGB16Color(0xB87333);
}
/** 黄土赭色*/
+ (UIColor *)siennaColor
{
    return RGB16Color(0xA0522D);
}
/** 马鞍棕色*/
+ (UIColor *)saddleBrown
{
    return RGB16Color(0x8B4513);
}
/** 土棕*/
+ (UIColor *)soilColor
{
    return RGB16Color(0x734A12);
}
/** 栗色*/
+ (UIColor *)maroonColor
{
    return RGB16Color(0x800000);
}
/** 乌贼墨棕*/
+ (UIColor *)inkfishBrown
{
    return RGB16Color(0x5E2612);
}


#pragma mark - **************** 粉色系
/** 水粉*/
+ (UIColor *)waterPink // $$$$$
{
    return RGB16Color(0xF3D3E7);
}
/** 藕色*/
+ (UIColor *)lotusRoot // $$$$$
{
    return RGB16Color(0xEDD1D8);
}
/** 浅粉红*/
+ (UIColor *)lightPink
{
    return RGB16Color(0xFFB6C1);
}
/** 适中的粉红*/
+ (UIColor *)mediumPink
{
    return RGB16Color(0xFFC0CB);
}
/** 桃红*/
+ (UIColor *)peachRed // $$$$$
{
    return RGB16Color(0xF47983);
}
/** 苍白的紫罗兰红色*/
+ (UIColor *)paleVioletRed
{
    return RGB16Color(0xDB7093);
}
/** 深粉色*/
+ (UIColor *)deepPink
{
    return RGB16Color(0xFF1493);
}

@end
