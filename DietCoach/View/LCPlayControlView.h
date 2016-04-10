//
//  LCPlayControlView.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCPlayControlView;
@protocol LCPlayControlViewDelegate <NSObject>

- (void)gobackButtonDidTouchedInControlView:(LCPlayControlView *)controlView;
- (void)goForwardButtonDidTouchedInControlView:(LCPlayControlView *)controlView;
- (void)stopButtonDidTouchedInControlView:(LCPlayControlView *)controlView;

@end

@interface LCPlayControlView : UIView
@property (nonatomic, weak) id<LCPlayControlViewDelegate> delegate;

@end
