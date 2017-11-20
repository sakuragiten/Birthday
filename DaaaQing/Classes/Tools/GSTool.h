//
//  GSTool.h
//  DaaaQing
//
//  Created by Fireloli on 17/11/7.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSTool : NSObject

SingletonInterface(Tool)


- (UIImage *)qrCoderWithContent:(NSString *)string;


- (void)printSystemFontsName;

//- (void)shakeToChangeEnvironmentEnable:(BOOL)enable;


@end
