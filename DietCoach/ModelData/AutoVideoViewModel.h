//
//  AutoVideoViewModel.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/14.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AutoVideoCellModel.h"
#import "DCFireViewModel.h"
#import "DCTimeModel.h"
#import "DCPlayerControlModel.h"

@interface AutoVideoViewModel : NSObject
@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, strong) NSURL *audioURL;
@property (nonatomic, copy) NSArray<AutoVideoCellModel *> *materialList;
@property (nonatomic, strong) DCFireViewModel *fireModel;
@property (nonatomic, strong) DCTimeModel *timeModel;
@property (nonatomic, strong) DCPlayerControlModel *controlModel;

- (void)goForward;
- (void)goBack;
@end
