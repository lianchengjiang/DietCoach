//
//  LCPlayerView.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/9.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "LCPlayerView.h"

@implementation LCPlayerView

+ (Class)layerClass
{
    return [AVPlayerLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ((AVPlayerLayer *)self.layer).videoGravity = AVLayerVideoGravityResizeAspectFill;
    }
    return self;
}

- (void)setPlayer:(AVPlayer *)player
{
    [(AVPlayerLayer *)self.layer setPlayer:player];
}

- (AVPlayer *)player
{
    return [(AVPlayerLayer *)self.layer player];
}

@end
