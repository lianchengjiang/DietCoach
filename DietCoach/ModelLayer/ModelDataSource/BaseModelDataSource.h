//
//  BaseModelDataSource.h
//  BaiduAbroadNews
//
//  Created by jiangliancheng on 16/4/5.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BDReusableViewModel.h"


typedef void (^BDConfigureCellBlock)(__kindof UIView <BDReusableViewModelProtocol>* cell,__kindof BDReusableViewModel * item);

@interface BaseModelDataSource : NSObject
// 当itemList 存的是数组时，默认为每个数组是个section
@property (nonatomic, assign, readonly) BOOL multipleSection;

@property (nonatomic, copy) NSArray *itemList;  // item must be kind of BDSettingCellModel

@property (nonatomic, copy) BDConfigureCellBlock configBlock;
// for auto complete
- (void)setConfigBlock:(BDConfigureCellBlock)configBlock;


- (NSUInteger)sectionNumber;
- (NSUInteger)itemNumberInSection:(NSUInteger)section;
- (__kindof BDReusableViewModel *)itemForIndexPath:(NSIndexPath *)indexPath;

@end
