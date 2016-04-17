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
#import "LCFoundation.h"
#import "ReactiveCocoa.h"

@interface DCRecordTimeView()

@property (nonatomic, assign) NSUInteger remainTime;
@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation DCRecordTimeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor clearColor];
    [self bindViewWithModel];
    [self layoutPageSubviews];
    return self;
}

- (void)bindViewWithModel
{
    @weakify(self);
    [RACObserve(self, remainTime) subscribeNext:^(NSNumber *remainTimeNum) {
        @strongify(self);
        self.timeLabel.text = [self timeFormatWithTimeNumber:remainTimeNum];
        [self setNeedsDisplay];
    }];
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
    return CGSizeMake(85, 85);
}

#pragma mark - drawrect
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef content = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(content, 4);
    CGContextSetStrokeColorWithColor(content, [UIColor lc_colorWithHexValue:0xD9D9D9].CGColor);

    CGFloat radius = rect.size.width/2;
    CGFloat angle = (self.totalTime == 0)?0:((self.totalTime - self.remainTime)*2*M_PI/self.totalTime);
    CGContextAddArc(content, radius, radius, radius-2, -M_PI_2, -M_PI_2+angle, NO);
    CGContextDrawPath(content, kCGPathStroke);
    
    CGContextSetStrokeColorWithColor(content, [UIColor lc_colorWithHexValue:0x63B806].CGColor);
    CGContextAddArc(content, radius, radius, radius-2, -M_PI_2+angle, 3 * M_PI_2, NO);
    CGContextDrawPath(content, kCGPathStroke);
}

#pragma mark - timer
- (void)startTimer
{
    if ([self.timer isValid]) {
        return;
    }
    self.timer = [NSTimer safe_scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES disableIfBackground:YES];
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)timerAction
{
    if (self.remainTime > 0) {
        self.remainTime --;
    } else {
        [self stopTimer];
    }
}

#pragma mark - setter
- (void)setTotalTime:(NSUInteger)totalTime
{
    [self stopTimer];
    _totalTime = totalTime;
    self.remainTime = totalTime;
    [self startTimer];
}

- (void)setPlaying:(BOOL)playing
{
    _playing = playing;
    if (playing) {
        [self startTimer];
    } else
    {
        [self startTimer];
    }
}

#pragma mark - private
- (NSString *)timeFormatWithTimeNumber:(NSNumber *)timeNum
{
    NSUInteger time = [timeNum unsignedIntegerValue];
    NSUInteger seconds = time%60;
    NSUInteger mintues = time/60;
    return [NSString stringWithFormat:@"%@:%@",[self formatTime:mintues],[self formatTime:seconds]];
}

- (NSString *)formatTime:(NSUInteger)time
{
    if (time < 10) {
        return [NSString stringWithFormat:@"0%td",time];
    }
    return @(time).stringValue;
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
