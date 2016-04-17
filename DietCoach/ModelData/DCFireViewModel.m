//
//  DCFireViewModel.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/14.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "DCFireViewModel.h"

@implementation DCFireViewModel

- (NSString *)fireTitle
{
    return [self fireTitleMap][@(self.fireLevel)];
}

- (UIImage *)fireImage
{
    return [self fireImageMap][@(self.fireLevel)];
}

#pragma mark -
- (NSDictionary *)fireTitleMap
{
    static NSDictionary *map;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = @{@(DCFireLevelSmall):@"小火",
                @(DCFireLevelMiddle):@"中火",
                @(DCFireLevelLarge):@"大火"};
    });
    return map;
}

- (NSMutableDictionary *)fireImageMap
{
    static NSDictionary *map;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = @{@(DCFireLevelSmall):[UIImage imageNamed:@"icon_fire1"],
                @(DCFireLevelMiddle):[UIImage imageNamed:@"icon_fire2"],
                @(DCFireLevelLarge):[UIImage imageNamed:@"icon_fire3"]};
    });
    return map;
}

@end
