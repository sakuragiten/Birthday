//
//  UIViewController+GSNavigationExtension.h
//  GSNavigationController
//
//  Created by Tian on 16/2/17.
//  Copyright © 2016年 JiananTian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSNavigationController.h"

@interface UIViewController (GSNavigationExtension)

@property (nonatomic, assign) BOOL gs_fullScreenPopGestureEnabled;

@property (nonatomic, strong) GSNavigationController *gs_navigationController;

@end
