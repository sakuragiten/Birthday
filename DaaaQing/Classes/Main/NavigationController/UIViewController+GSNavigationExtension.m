//
//  UIViewController+GSNavigationExtension.m
//  GSNavigationController
//
//  Created by Tian on 16/2/17.
//  Copyright © 2016年 JiananTian. All rights reserved.
//

#import "UIViewController+GSNavigationExtension.h"
#import <objc/runtime.h>

@implementation UIViewController (GSNavigationExtension)

- (BOOL)gs_fullScreenPopGestureEnabled {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setGs_fullScreenPopGestureEnabled:(BOOL)fullScreenPopGestureEnabled {
    objc_setAssociatedObject(self, @selector(gs_fullScreenPopGestureEnabled), @(fullScreenPopGestureEnabled), OBJC_ASSOCIATION_RETAIN);
}

- (GSNavigationController *)gs_navigationController {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setGs_navigationController:(GSNavigationController *)navigationController {
    objc_setAssociatedObject(self, @selector(gs_navigationController), navigationController, OBJC_ASSOCIATION_RETAIN);
}

@end
