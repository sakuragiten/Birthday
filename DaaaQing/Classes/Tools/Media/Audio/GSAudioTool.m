//
//  GSAudioTool.m
//  DaaaQing
//
//  Created by Fireloli on 17/10/19.
//  Copyright © 2017年 Fireloli. All rights reserved.
//

#import "GSAudioTool.h"
#import <AVFoundation/AVFoundation.h>

#define kBirthdaySong @"birthday"
@interface GSAudioTool ()<AVAudioPlayerDelegate>


@end

static NSMutableDictionary *musicPlayers;
@implementation GSAudioTool

- (instancetype)init
{
    if (self = [super init]) {
        if (!musicPlayers) musicPlayers = [NSMutableDictionary dictionary];
    }
    
    return self;
}

//static GSAudioTool *_audioTool = nil;
//+ (instancetype)sharedAudioTool
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _audioTool = [[GSAudioTool alloc] init];
//    });
//    return _audioTool;
//}
SingletonImplementation(AudioTool)

#pragma mark - 播放生日歌
- (void)playBirthSong
{
    [self playMusic:kBirthdaySong isLoops:YES];
}

#pragma mark - 停止生日歌
- (void)stopBirthSong
{
    [self stopMusic:kBirthdaySong];
}


- (BOOL)playMusic:(NSString *)fileName isLoops:(BOOL)isLoop
{
    //文件不存在
    if (fileName.length == 0) return NO;
    
    AVAudioPlayer *player = musicPlayers[fileName];
    if (!player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        player.delegate = self;
        
        if (isLoop) player.numberOfLoops = 2;
        
        if (![player prepareToPlay]) return NO; //是否可以播放
        
        [musicPlayers setObject:player forKey:fileName];
    }
    
    if (!player.isPlaying) return [player play];
    
    return YES;
}


- (void)stopMusic:(NSString *)fileName
{
    //文件不存在
    if (fileName.length == 0) return;
    AVAudioPlayer *player = musicPlayers[fileName];
    if (player) {
        [player stop];
        [[AVAudioSession sharedInstance] setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
        [musicPlayers removeObjectForKey:fileName];
    }
    
}

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [[AVAudioSession sharedInstance] setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
}


@end
