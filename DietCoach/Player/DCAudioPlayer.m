//
//  DCAudioPlayer.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/17.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "DCAudioPlayer.h"


@interface DCAudioPlayer ()
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation DCAudioPlayer


- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    [self.player stop];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:URL error:nil];
    [self.player prepareToPlay];
    self.player.delegate = self.delegate;
}

- (void)setDelegate:(id<AVAudioPlayerDelegate>)delegate
{
    _delegate = delegate;
    [self.player setDelegate:delegate];
}


- (void)play;
{
    if ([NSThread isMainThread]) {
        [self.player play];
        return;
    }
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.player play];
    });
}

- (void)stop;
{
    if ([NSThread isMainThread]) {
        [self.player stop];
        return;
    }
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.player stop];
    });

}

@end
