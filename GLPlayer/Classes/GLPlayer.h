//
//  GLPlayer.h
//  GLPlayerLib
//
//  Created by guolei on 2016/11/27.
//  Copyright © 2016年 guolei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#define kRemotePlayerURLOrStateChangeNotification @"remotePlayerURLOrStateChangeNotification"

/**
 * 播放器的状态
 * 因为UI界面需要加载状态显示, 所以需要提供加载状态
 - GLPlayerStateUnknown: 未知(比如都没有开始播放音乐)
 - GLPlayerStateLoading: 正在加载()
 - GLPlayerStatePlaying: 正在播放
 - GLPlayerStateStopped: 停止
 - GLPlayerStatePause:   暂停
 - GLPlayerStateFailed:  失败(比如没有网络缓存失败, 地址找不到)
 */
typedef NS_ENUM(NSInteger, GLPlayerState) {
    GLPlayerStateUnknown = 0,
    GLPlayerStateLoading   = 1,
    GLPlayerStatePlaying   = 2,
    GLPlayerStateStopped   = 3,
    GLPlayerStatePause     = 4,
    GLPlayerStateFailed    = 5
};

@interface GLPlayer : NSObject

+ (instancetype)shareInstance;


/** 视频展示player */
@property (nonatomic, strong ,readonly) AVPlayer *player;

/**
 根据URL地址进行播放音频
 @param url url
 */
- (void)playWithURL: (NSURL *)url;

/** 暂停当前音频 */
- (void)pause;

/** 继续播放 */
- (void)resume;

/** 停止播放 */
- (void)stop;

/**
 快速播放到某个时间点
 @param time 时间
 */
- (void)seekWithTime: (NSTimeInterval)time;

/** 速率 */
@property (nonatomic, assign) float rate;

/** 声音 */
@property (nonatomic, assign) float volume;

/** 静音 */
@property (nonatomic, assign) BOOL mute;

/** 根据进度播放 */
@property (nonatomic, assign) float progress;

/** 音频总时长 */
@property (nonatomic, assign, readonly) double duration;

/** 音频当前播放时长 */
@property (nonatomic, assign, readonly) double currentTime;

/** 音频当前播放URL */
@property (nonatomic, strong, readonly) NSURL *url;

/** 音频当前加载进度 */
@property (nonatomic, assign, readonly) float loadProgress;

/** 音频当前播放状态 */
@property (nonatomic, assign, readonly) GLPlayerState state;

/** 监听音频播放状态 */
@property (nonatomic, copy) void(^stateChange)(GLPlayerState state);


/** 监听音频播放完成 */
@property (nonatomic, copy) void(^playEndBlock)(void);

/** 监听音频播放进度 */
@property (nonatomic, copy) void(^progressBlock)(float progress,double currentTime,double duration);

@end
