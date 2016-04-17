//
//  DCTimeModel.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/16.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "DCTimeModel.h"

@implementation DCTimeModel

- (void)setSecond:(NSTimeInterval)second
{
    if (_second == second) {
        return;
    }
    [self showTimeWithSecond:second];
}

- (void)showTimeWithSecond:(NSTimeInterval)second
{
    NSArray *thresholdList = @[@60,@60,@12];
    NSArray *unitList = @[@"秒",@"分钟",@"小时"];
    NSTimeInterval time = second;
    for (int index = 0; index < thresholdList.count; index++) {
        int threshold = [thresholdList[index] intValue];
        if (time <= threshold) {
            _time = time;
            _unit = unitList[index];
            return;
        }
        time = time/threshold;
    }
}

@end
