//
//  ModelCollectionViewDataSource.h
//  BaiduAbroadNews
//
//  Created by jiangliancheng on 16/4/5.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseModelDataSource.h"
#import "ReusableHeaderModel.h"
#import "ReusableFooterModel.h"

typedef void(^BDConfigHeaderBlock)(__kindof UIView *headerView, ReusableHeaderModel *model);
typedef void(^BDConfigFooterBlock)(__kindof UIView *footerView, ReusableFooterModel *model);

@interface ModelCollectionViewDataSource : BaseModelDataSource<UICollectionViewDataSource>

// @{sectionNumber:ReusableHeaderModel}
@property (nonatomic, copy) NSDictionary<NSNumber *,ReusableHeaderModel *> *headerMap;
@property (nonatomic, copy) NSDictionary<NSNumber *,ReusableFooterModel *> *footerMap;

@property (nonatomic, copy) BDConfigHeaderBlock configHeaderBlock;
@property (nonatomic, copy) BDConfigFooterBlock configFooterBlock;

@end
