//
//  DCTimeModel.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/16.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCTimeModel : NSObject
@property (nonatomic, assign) NSTimeInterval second;
@property (nonatomic, assign, readonly) float time;
@property (nonatomic, copy, readonly) NSString *unit;

@end
