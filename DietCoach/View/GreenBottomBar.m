//
//  GreenBottomBar.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "GreenBottomBar.h"
#import "Masonry.h"
#import "UIColorPicker.h"
#import "LCCommonMacro.h"

@interface GreenBottomBar ()
@property (nonatomic, strong) UIImageView *leftIcon;
@property (nonatomic, strong) UIImageView *rightIcon;

@end

@implementation GreenBottomBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColorPicker greenColor];
    [self layoutPageSubviews];
    
    return self;
}

- (void)layoutPageSubviews
{
    [self addSubview:self.leftIcon];
    [self.leftIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.centerY.offset(0);
    }];
    
    [self addSubview:self.rightIcon];
    [self.rightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.offset(0);
    }];
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(kScreenSize.width, 64);
}

#pragma mark - getter
- (UIImageView *)leftIcon
{
    if (_leftIcon) {
        return _leftIcon;
    }
    _leftIcon = [UIImageView new];
    _leftIcon.image = [UIImage imageNamed:@"icon_video"];
    return _leftIcon;
}

- (UIImageView *)rightIcon
{
    if (_rightIcon) {
        return _rightIcon;
    }
    _rightIcon = [UIImageView new];
    _rightIcon.image = [UIImage imageNamed:@"icon_go"];
    return _rightIcon;
}

@end
