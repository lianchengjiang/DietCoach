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
#import "DCAudioPlayer.h"

@interface DCRecordTimeView()<AVAudioPlayerDelegate>

@property (nonatomic, assign) NSUInteger remainTime;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) DCAudioPlayer *player;

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

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag;
{
//    [self.player play];
}

#pragma mark - timer
- (void)startTimer
{
    if ([self.timer isValid] || self.remainTime <= 0) {
        return;
    }
    _recording = YES;
    [self.player play];
    self.timer = [NSTimer safe_scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES disableIfBackground:YES];
}

- (void)stopTimer
{
    [self.timer invalidate];
    _recording = NO;
    [self.player stop];
    self.timer = nil;
}

- (void)timerAction
{
    self.remainTime --;
    [self.player play];
    if (self.remainTime > 0) {
        return;
    }

    [self stopTimer];
    [self.delegate recordCompletedInTimeView:self];
}

#pragma mark - setter
- (void)setTotalTime:(NSUInteger)totalTime
{
    [self stopTimer];
    _totalTime = totalTime;
    self.remainTime = totalTime;
}



#pragma mark - public
- (void)startRecord;
{
    [self startTimer];
}

- (void)stopRecord;
{
    [self stopTimer];
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

- (DCAudioPlayer *)player
{
    if (_player) {
        return _player;
    }
    _player = [DCAudioPlayer new];
    _player.URL = [[NSBundle mainBundle] URLForResource:@"dida" withExtension:@"mp3"];
    _player.delegate = self;
    return _player;
}

@end
