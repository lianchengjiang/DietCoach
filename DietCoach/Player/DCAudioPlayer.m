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
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:URL error:nil];
    [self.player play];
}

- (void)setDelegate:(id<AVAudioPlayerDelegate>)delegate
{
    _delegate = delegate;
    [self.player setDelegate:delegate];
}



@end
