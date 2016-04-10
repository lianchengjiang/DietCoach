//
//  BDReusableViewModel.h
//  BaiduAbroadNews
//
//  Created by jiangliancheng on 16/4/7.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BDReusableViewModel;
@protocol BDReusableViewModelProtocol <NSObject>

- (void)updateUIWithViewModel:(__kindof BDReusableViewModel *)model;

@end

@interface BDReusableViewModel : NSObject
@property (nonatomic, strong) Class viewClass;
@property (nonatomic, copy) NSString *identifier;

@end
