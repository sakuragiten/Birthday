//
//  MacroDefinition.h
//  DaaaQing
//
//  Created by Fireloli on 17/10/20.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#ifndef MacroDefinition_h
#define MacroDefinition_h


/**
 *
 * screen ratio
 *
 */

#define RATIO (SCREEN_WIDTH / 375.0)
#define Ration(num) (num * RATIO)


/**
 *
 * screen size
 *
 */
#define SCREEN_BOUNDS ([UIScreen mainScreen].bounds)

/**
 *
 * screen width
 *
 */
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)


/**
 *
 * sceen height
 *
 */
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)



/**
 *
 * weak self
 *
 */
#define GSWeakSelf(weakSelf) __weak typeof(self) weakSelf = self;



/**
 *
 * navigation_height
 *
 */
#define kNavHeight 64.0


/**
 *
 * tabBar_height
 *
 */
#define kTabBarHeight 49.0

#pragma mark - animationDuration
#define kAnimationTime 1.0



/** color */
#define kBgColor   (RGB(239,239,244))

/** fontName */
#define kCoolFontName @"BradleyHandITCTT-Bold"
#define kXingKaiFontName @"STXingkai" //@"STXingkaiSC-Light"

#endif /* MacroDefinition_h */
