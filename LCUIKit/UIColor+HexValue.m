//
//  UIColor+HexValue.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/7.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "UIColor+HexValue.h"

@implementation UIColor (HexValue)
+ (id)colorWithHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha
{
    CGFloat r = ((hexValue & 0x00FF0000) >> 16) / 255.0;
    CGFloat g = ((hexValue & 0x0000FF00) >> 8) / 255.0;
    CGFloat b = (hexValue & 0x000000FF) / 255.0;
    CGFloat a = alpha;
    
    return [self colorWithRed:r green:g blue:b alpha:a];
}

+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue
{
    return [self colorWithHexValue:hexValue alpha:1];
}
@end
