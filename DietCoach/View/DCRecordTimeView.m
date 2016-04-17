//
//  DCRecordTimeView.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/17.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "DCRecordTimeView.h"
#import "LCUIKit.h"
#import "Masonry.h"

@interface DCRecordTimeView()

@property (nonatomic, assign) NSTimeInterval time;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation DCRecordTimeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    [self layoutPageSubviews];
    return self;
}

- (void)layoutPageSubviews
{
    [self addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
    }];
}

- (CGSize)intrinsicContentSize
{
    
}

#pragma mark - drawrect
- (void)drawRect:(CGRect)rect
{
    
}


#pragma mark - getter
- (UILabel *)timeLabel
{
    if (_timeLabel) {
        return _timeLabel;
    }
    _timeLabel = [UILabel lc_labelWithFontSize:20 textColorHexValue:0x030303];
    return _timeLabel;
}

@end
