//
//  GreenBottomBar.h
//  DietCoach
//
//  Created by jiangliancheng on 16/4/10.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GreenBottomBar;
@protocol GreenBottomBarDelegate <NSObject>

- (void)GreenBottomBarDidTouched:(GreenBottomBar *)bottomBar;

@end

@interface GreenBottomBar : UIButton

@end
