//
//  UIColor+HexValue.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/7.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexValue)
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue;

@end
