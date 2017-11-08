//
//  GSAudioTool.h
//  DaaaQing
//
//  Created by Fireloli on 17/10/19.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSAudioTool : NSObject


//+ (instancetype)sharedAudioTool;
SingletonInterface(AudioTool)


/**
 *
 * @param fileName 播放的文件名
 * @param isLoop 是否循环播放
 * @return 是否播放成功
 */

- (BOOL)playMusic:(NSString *)fileName isLoops:(BOOL)isLoop;


/**
 *
 * @param fileName 停止播放的文件名
 *
 */
- (void)stopMusic:(NSString *)fileName;


/** 播放生日歌 */
- (void)playBirthSong;

/** 停止播放生日歌 */
- (void)stopBirthSong;
@end
