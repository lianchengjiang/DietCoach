//
//  DCTimeView.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/16.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "DCTimeView.h"
#import "LCUIKit.h"
#import "UIColorPicker.h"
#import "Masonry.h"
#import "ReactiveCocoa.h"

@interface DCTimeView ()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *unitLabel;

@end

@implementation DCTimeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    [self layoutPageSubviews];
    [self bindViewModel];
    return self;
}

- (void)layoutPageSubviews
{
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.offset(0);
        make.left.greaterThanOrEqualTo(self);
        make.right.lessThanOrEqualTo(self);
    }];

    [self addSubview:self.unitLabel];
    [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel).offset(5);
        make.centerX.equalTo(self.timeLabel);
        make.left.greaterThanOrEqualTo(self);
        make.right.lessThanOrEqualTo(self);
    }];

}

- (void)bindViewModel
{
    RAC(self.timeLabel, text) = RACObserve(self, model.time);
    RAC(self.unitLabel, text) = RACObserve(self, model.unit);
}

#pragma mark - getter
- (UILabel *)timeLabel
{
    if (_timeLabel) {
        return _timeLabel;
    }
    _timeLabel = [UILabel lc_labelWithFontSize:33 textColorHexValue:[UIColorPicker fireRedColorValue]];
    return _timeLabel;
}

- (UILabel *)unitLabel
{
    if (_unitLabel) {
        return _unitLabel;
    }
    _unitLabel = [UILabel lc_labelWithFontSize:15 textColorHexValue:[UIColorPicker fireRedColorValue]];
    return _unitLabel;
}

@end
