//
//  Singleton.h
//  DaaaQing
//
//  Created by Fireloli on 17/10/25.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#ifndef Singleton_h
#define Singleton_h


#define SingletonInterface(name)  + (instancetype)shared##name;

#define SingletonImplementation(name) \
static id _instance; \
+ (instancetype)shared##name \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
    _instance = [[self alloc] init]; \
    }); \
    return _instance; \
} \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
    return _instance; \
}


#endif /* Singleton_h */
