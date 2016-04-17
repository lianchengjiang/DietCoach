//
//  DCTimeModel.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/16.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCTimeModel : NSObject
@property (nonatomic, assign) NSUInteger second;
@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *unit;

+ (instancetype)modelWithSecond:(NSUInteger)second;

@end
