//
//  LCPlayControlView.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveCocoa.h"
#import "DCPlayerControlModel.h"

@interface LCPlayControlView : UIView
@property (nonatomic, strong, readonly) RACSignal *backSignal;
@property (nonatomic, strong, readonly) RACSignal *forwardSignal;
@property (nonatomic, strong, readonly) RACSignal *playSignal;

@property (nonatomic, strong) DCPlayerControlModel *controlModel;
@end
