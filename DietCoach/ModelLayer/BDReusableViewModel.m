//
//  BDReusableViewModel.m
//  BaiduAbroadNews
//
//  Created by jiangliancheng on 16/4/7.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "BDReusableViewModel.h"

@implementation BDReusableViewModel

#pragma mark - getter
- (NSString *)identifier
{
    if (_identifier) {
        return _identifier;
    }
    _identifier = [self.viewClass description];
    return _identifier;
}

@end
