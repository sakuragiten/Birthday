//
//  GSDiaryModel.h
//  DaaaQing
//
//  Created by gongsheng on 2017/11/10.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSDiaryModel : NSObject

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *imageName;


+ (NSArray *)dqModelArray;

@end
