//
//  AutoVideoCellModel.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/16.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "AutoVideoCellModel.h"
#import "LCFoundation.h"

@implementation AutoVideoCellModel
+ (NSArray<AutoVideoCellModel *> *)modelListWithList:(NSArray<NSString *> *)list;
{
    NSMutableArray *modelList = [NSMutableArray new];
    for (int index = 0; index < (list.count+1)/2; index ++) {
        AutoVideoCellModel *model = [AutoVideoCellModel new];
        model.headString = list[2*index];
        model.tailString = [list safe_objectAtIndex:2*index+1];
        [modelList addObject:model];
    }
    return modelList;
}

@end
