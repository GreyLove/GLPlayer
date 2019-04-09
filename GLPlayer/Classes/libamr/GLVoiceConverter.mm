//
//  GLVoiceConverter.m
//  video
//
//  Created by guolei on 2019/3/14.
//  Copyright © 2019 guolei. All rights reserved.
//

#import "GLVoiceConverter.h"
#import "wav.h"
#import "interf_dec.h"
#import "dec_if.h"
#import "interf_enc.h"
#import "amrFileCodec.h"

#import "lame.h"

@implementation GLVoiceConverter
+ (int)isMP3File:(NSString *)filePath{
    const char *_filePath = [filePath cStringUsingEncoding:NSASCIIStringEncoding];
    return isMP3File(_filePath);
}

+ (int)isAMRFile:(NSString *)filePath{
    const char *_filePath = [filePath cStringUsingEncoding:NSASCIIStringEncoding];
    return isAMRFile(_filePath);
}

+ (int)amrToWav:(NSString*)_amrPath wavSavePath:(NSString*)_savePath{
    
    if (EM_DecodeAMRFileToWAVEFile([_amrPath cStringUsingEncoding:NSASCIIStringEncoding], [_savePath cStringUsingEncoding:NSASCIIStringEncoding]))
        return 1; // success
    
    return 0;   // failed
}

+ (int)wavToAmr:(NSString*)_wavPath amrSavePath:(NSString*)_savePath{
    
    if (EM_EncodeWAVEFileToAMRFile([_wavPath cStringUsingEncoding:NSASCIIStringEncoding], [_savePath cStringUsingEncoding:NSASCIIStringEncoding], 1, 16))
        return 1;   // success
    
    return 0;   // failed
}

+ (int)wavToMp3:(NSString*)_wavPath mp3SavePath:(NSString*)_savePath
{
    @try {
        int read, write;
        
        FILE *pcm = fopen([_wavPath cStringUsingEncoding:1], "rb");  //source 被转换的音频文件位置
        fseek(pcm, 4*1024, SEEK_CUR);                                   //skip file header
        FILE *mp3 = fopen([_savePath cStringUsingEncoding:1], "wb+");  //output 输出生成的Mp3文件位置
        
        const int PCM_SIZE = 8192;
        const int MP3_SIZE = 8192;
        short int pcm_buffer[PCM_SIZE*2];
        unsigned char mp3_buffer[MP3_SIZE];
        
        lame_t lame = lame_init(); // 初始化
        lame_set_num_channels(lame, 2); // 双声道
        lame_set_in_samplerate(lame, 8000); // 8k采样率
        lame_set_brate(lame, 16);  // 压缩的比特率为16
        lame_set_quality(lame, 2);  // mp3音质
        lame_init_params(lame);
        
        do {
            read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
            if (read == 0)
                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            else
                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            
            fwrite(mp3_buffer, write, 1, mp3);
            
        } while (read != 0);
        
        lame_mp3_tags_fid(lame, mp3);
        lame_close(lame);
        fclose(mp3);
        fclose(pcm);
        return 0;
    }
    @catch (NSException *exception) {
        NSLog(@"%@",[exception description]);
        return 1;
    }
}

@end
