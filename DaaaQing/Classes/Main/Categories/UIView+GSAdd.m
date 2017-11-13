//
//  UIView+GSAdd.m
//  DaaaQing
//
//  Created by Fireloli on 2017/11/13.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "UIView+GSAdd.h"

@implementation UIView (GSAdd)

+ (UIViewController *)currentViewController
{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([vc isKindOfClass:[UITabBarController class]]) {
        vc = [(UITabBarController *)vc selectedViewController];
    }
    if ([vc isKindOfClass:[UINavigationController class]]) {
        vc = [(UINavigationController *)vc visibleViewController];
    }
    
    return vc;
}


@end
