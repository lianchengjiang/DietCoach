//
//  LCPlayer.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/9.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCPlayerView.h"

@interface LCPlayer : NSObject
@property (nonatomic, strong, readonly) LCPlayerView *playerView;
@property (nonatomic, strong) NSURL *playURL;

- (void)play;
- (void)pause;

@end
