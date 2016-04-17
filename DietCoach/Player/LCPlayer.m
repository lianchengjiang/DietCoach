//
//  LCPlayer.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/9.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "LCPlayer.h"

@interface LCPlayer ()
@property (nonatomic, strong) AVPlayer *player;

@end

@implementation LCPlayer
@synthesize playerView = _playerView;


#pragma mark - public
- (void)play;
{
    [self.player play];
}

- (void)pause;
{
    [self.player pause];
}

#pragma mark - notification
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}


#pragma mark - setter

- (void)setPlayURL:(NSURL *)playURL
{
    if ([_playURL isEqual:playURL]) {
        return;
    }
    [self pause];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    _playURL = playURL;
    self.player = [AVPlayer playerWithURL:playURL];
    
    self.player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[self.player currentItem]];

    [self play];
}

- (void)setPlayer:(AVPlayer *)player
{
    if (_player == player) {
        return;
    }
    _player = player;
    self.playerView.player = player;
}

#pragma mark - getter
- (LCPlayerView *)playerView
{
    if (!_playerView) {
        _playerView = [LCPlayerView new];
    }
    return _playerView;
}


@end
