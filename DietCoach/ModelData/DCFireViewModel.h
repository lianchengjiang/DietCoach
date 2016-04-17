//
//  DCFireViewModel.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/14.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DCFireLevel) {
    DCFireLevelSmall,
    DCFireLevelMiddle,
    DCFireLevelLarge,
};

@interface DCFireViewModel : NSObject
@property (nonatomic, assign) DCFireLevel fireLevel;
@property (nonatomic, readonly, copy) NSString *fireTitle;
@property (nonatomic, readonly, strong) UIImage *fireImage;

@end
