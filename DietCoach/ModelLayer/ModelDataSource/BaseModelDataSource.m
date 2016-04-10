//
//  BaseModelDataSource.m
//  BaiduAbroadNews
//
//  Created by jiangliancheng on 16/4/5.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "BaseModelDataSource.h"
#import "LCFoundation.h"

@implementation BaseModelDataSource

#pragma mark - private
- (void)setItemList:(NSArray *)itemList
{
    _itemList = itemList;
    
    _multipleSection = YES;
    for (id item in itemList) {
        if (![item isKindOfClass:[NSArray class]]) {
            _multipleSection = NO;
            break;
        }
    }
}

- (NSUInteger)sectionNumber;
{
    NSInteger count = self.multipleSection?self.itemList.count:1;
    return count;
}

- (NSUInteger)itemNumberInSection:(NSUInteger)section;
{
    if (self.multipleSection) {
        NSArray *rowList = [self.itemList safe_objectAtIndex:section];
        return rowList.count;
    }
    
    return self.itemList.count;
    
}

- (__kindof BDReusableViewModel *)itemForIndexPath:(NSIndexPath *)indexPath;
{
    BDReusableViewModel *item;
    if (self.multipleSection) {
        NSArray *rowList = [self.itemList safe_objectAtIndex:indexPath.section];
        item = [rowList safe_objectAtIndex:indexPath.row];
    } else {
        item = [self.itemList safe_objectAtIndex:indexPath.row];
    }
    
    return item;
}

@end




