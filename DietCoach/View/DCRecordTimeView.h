//
//  DCRecordTimeView.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/17.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCRecordTimeView;
@protocol DCRecordTimeViewDelegate <NSObject>

- (void)recordCompletedInTimeView:(DCRecordTimeView *)view;

@end

@interface DCRecordTimeView : UIView

@property (nonatomic, assign) NSUInteger totalTime;
@property (nonatomic, assign) BOOL playing;
@property (nonatomic, weak) id<DCRecordTimeViewDelegate> delegate;

@end
