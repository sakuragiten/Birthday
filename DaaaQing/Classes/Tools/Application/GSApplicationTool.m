//
//  GSApplicationTool.m
//  DaaaQing
//
//  Created by Fireloli on 17/10/19.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSApplicationTool.h"

@implementation GSApplicationTool

SingletonImplementation(Application)
//static GSApplicationTool *_applicationTool = nil;
//+ (instancetype)sharedApplication
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _applicationTool = [[GSApplicationTool alloc] init];
//    });
//    
//    return _applicationTool;
//}


#pragma mark - 选择根控制器
- (void)chooseRootControllerWithWindow:(UIWindow *)window
{
    GSHomeViewController *vc = [[GSHomeViewController alloc] init];
    
    GSNavigationController *nav = [[GSNavigationController alloc] initWithRootViewController:vc];
    
    window.rootViewController = nav;
    
    
}

@end
