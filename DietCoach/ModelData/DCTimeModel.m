//
//  DCTimeModel.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/16.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "DCTimeModel.h"

@implementation DCTimeModel
+ (instancetype)modelWithSecond:(NSUInteger)second;
{
    DCTimeModel *model = [DCTimeModel new];
    model.second = second;
    return model;
}

#pragma mark -
- (void)setSecond:(NSUInteger)second
{
    if (_second == second) {
        return;
    }
    _second = second;
    [self showTimeWithSecond:second];
}

- (void)showTimeWithSecond:(NSUInteger)second
{
    NSArray *thresholdList = @[@60,@60,@12];
    NSArray *unitList = @[@"秒",@"分钟",@"小时"];
    NSTimeInterval time = second;
    for (int index = 0; index < thresholdList.count; index++) {
        int threshold = [thresholdList[index] intValue];
        if (time <= threshold) {
            _time = @(time).stringValue;
            _unit = unitList[index];
            return;
        }
        time = time/threshold;
    }
}

@end
