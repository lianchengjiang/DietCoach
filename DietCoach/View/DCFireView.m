//
//  DCFireView.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/16.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "DCFireView.h"
#import "LCUIKit.h"
#import "Masonry.h"
#import "ReactiveCocoa.h"
#import "UIColorPicker.h"

@interface DCFireView ()
@property (nonatomic, strong) UIImageView *fireIcon;
@property (nonatomic, strong) UILabel *fireLabel;

@end

@implementation DCFireView

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

- (void)layoutPageSubviews;
{
    [self addSubview:self.fireIcon];
    [self.fireIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.offset(0);
        make.left.greaterThanOrEqualTo(self);
        make.right.lessThanOrEqualTo(self);
    }];
    
    [self addSubview:self.fireLabel];
    [self.fireLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fireIcon.mas_bottom).offset(3);
        make.centerX.equalTo(self.fireIcon);
        make.left.greaterThanOrEqualTo(self);
        make.right.lessThanOrEqualTo(self);
        make.bottom.offset(0);
    }];
}

- (void)bindViewModel
{
    RAC(self.fireIcon, image) = RACObserve(self, model.fireImage);
    RAC(self.fireLabel, text) = RACObserve(self, model.fireTitle);
}


#pragma mark - getter
- (UIImageView *)fireIcon
{
    if (_fireIcon) {
        return _fireIcon;
    }
    _fireIcon = [UIImageView new];
    return _fireIcon;
}

- (UILabel *)fireLabel
{
    if (_fireLabel) {
        return _fireLabel;
    }
    _fireLabel = [UILabel lc_labelWithFontSize:15 textColorHexValue:[UIColorPicker fireRedColorValue]];
    return _fireLabel;
}

@end
