//
//  UIColorPicker.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/7.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "UIColorPicker.h"
#import "LCUIKit.h"


@implementation UIColorPicker

+ (UIColor *)barYellowColor;
{
    return [UIColor lc_colorWithHexValue:0xc28d47];
}

+ (UIColor *)barTitleColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)greenColor
{
    return [UIColor lc_colorWithHexValue:0x63b806];
}

+ (NSUInteger)fireRedColorValue
{
    return 0xd92827;
}

@end
