//
//  DCAudioPlayer.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/17.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface DCAudioPlayer : NSObject
@property (nonatomic, weak) id<AVAudioPlayerDelegate> delegate;
@property (nonatomic, strong) NSURL *URL;

- (void)play;
- (void)stop;
@end
