//
//  LCPlayControlView.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "LCPlayControlView.h"
#import "Masonry.h"

@interface LCPlayControlView ()
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *forwardButton;
@property (nonatomic, strong) UIButton *stopButton;

@end

@implementation LCPlayControlView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    [self initializeConfig];
    [self layoutPageSubviews];
    return self;
}

- (void)initializeConfig
{
    
}

- (void)layoutPageSubviews
{
    [self addSubview:self.backButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.offset(0);
        make.top.greaterThanOrEqualTo(self);
        make.bottom.lessThanOrEqualTo(self);
    }];
    
    [self addSubview:self.forwardButton];
    [self.forwardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.centerY.offset(0);
        make.top.greaterThanOrEqualTo(self);
        make.bottom.lessThanOrEqualTo(self);
    }];
    
    [self addSubview:self.stopButton];
    [self.stopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.offset(0);
        make.top.greaterThanOrEqualTo(self);
        make.bottom.lessThanOrEqualTo(self);
    }];
}

#pragma mark - Action
- (void)goBack
{
    [self.delegate gobackButtonDidTouchedInControlView:self];
}

- (void)goForward
{
    [self.delegate goForwardButtonDidTouchedInControlView:self];
}

- (void)stop
{
    [self.delegate stopButtonDidTouchedInControlView:self];
}

#pragma mark - getter
- (UIButton *)backButton
{
    if (_backButton) {
        return _backButton;
    }
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setImage:[UIImage imageNamed:@"btn_left"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    return _backButton;
}

- (UIButton *)forwardButton
{
    if (_forwardButton) {
        return _forwardButton;
    }
    _forwardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_forwardButton setImage:[UIImage imageNamed:@"btn_right"] forState:UIControlStateNormal];
    [_forwardButton addTarget:self action:@selector(goForward) forControlEvents:UIControlEventTouchUpInside];
    return _forwardButton;
}

- (UIButton *)stopButton
{
    if (_stopButton) {
        return _stopButton;
    }
    _stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_stopButton setImage:[UIImage imageNamed:@"btn_stop"] forState:UIControlStateNormal];
    [_stopButton addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    return _stopButton;
}

@end
