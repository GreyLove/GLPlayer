//
//  GLVoiceConverter.h
//  video
//
//  Created by guolei on 2019/3/14.
//  Copyright © 2019 guolei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLVoiceConverter : NSObject

+ (int)isMP3File:(NSString *)filePath;

+ (int)isAMRFile:(NSString *)filePath;

+ (int)amrToWav:(NSString*)_amrPath wavSavePath:(NSString*)_savePath;

+ (int)wavToAmr:(NSString*)_wavPath amrSavePath:(NSString*)_savePath;

+ (int)wavToMp3:(NSString*)_wavPath mp3SavePath:(NSString*)_savePath;

@end
