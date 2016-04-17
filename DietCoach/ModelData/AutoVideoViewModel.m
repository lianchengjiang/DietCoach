//
//  AutoVideoViewModel.m
//  DietCoach
//
//  Created by jiangliancheng on 16/4/14.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "AutoVideoViewModel.h"
#import "DCPlayerControlModel.h"

@interface AutoVideoInnerViewModel : NSObject
@property (nonatomic, copy) NSURL *URL;
@property (nonatomic, copy) NSArray<AutoVideoCellModel *> *materialList;
@property (nonatomic, strong) DCFireViewModel *fireModel;
@property (nonatomic, strong) DCTimeModel *timeModel;

@end

@implementation AutoVideoInnerViewModel


@end


@interface AutoVideoViewModel ()
@property (nonatomic, copy) NSArray *modelList;

@property (nonatomic, assign) NSUInteger index;
@end

@implementation AutoVideoViewModel
- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.index = 0;
    
    return self;
}

#pragma mark - public
- (void)goForward;
{
    self.index ++;
}

- (void)goBack;
{
    self.index --;
}

#pragma mark - 
- (void)setIndex:(NSUInteger)index
{
    if (index >= self.modelList.count) {
        return;
    }
    _index = index;
    AutoVideoViewModel *model = self.modelList[index];
    self.URL = model.URL;
    self.timeModel = model.timeModel;
    self.fireModel = model.fireModel;
    self.materialList = model.materialList;
    self.controlModel = [DCPlayerControlModel new];
    self.controlModel.canBack = (index != 0);
    self.controlModel.canForward = (index != self.modelList.count-1);
    self.controlModel.playing = YES;
}

#pragma mark - getter
- (NSArray *)modelList
{
    if (_modelList) {
        return _modelList;
    }
    NSMutableArray *list = [NSMutableArray new];
    [list addObject:({
        AutoVideoInnerViewModel *model = [AutoVideoInnerViewModel new];
        model.URL = [[NSBundle mainBundle] URLForResource:@"cook1" withExtension:@"mov"];
        model.materialList = [AutoVideoCellModel modelListWithList:nil];
        model.fireModel = [DCFireViewModel modelWithLevel:DCFireLevelLarge];
        model.timeModel = [DCTimeModel modelWithSecond:20];
        model;
    })];
    
    [list addObject:({
        AutoVideoInnerViewModel *model = [AutoVideoInnerViewModel new];
        model.URL = [[NSBundle mainBundle] URLForResource:@"cook2" withExtension:@"mov"];
        model.materialList = [AutoVideoCellModel modelListWithList:nil];
        model.fireModel = [DCFireViewModel modelWithLevel:DCFireLevelLarge];
        model.timeModel = [DCTimeModel modelWithSecond:30];
        model;
    })];
    
    [list addObject:({
        AutoVideoInnerViewModel *model = [AutoVideoInnerViewModel new];
        model.URL = [[NSBundle mainBundle] URLForResource:@"cook3" withExtension:@"mov"];
        model.materialList = [AutoVideoCellModel modelListWithList:nil];
        model.fireModel = [DCFireViewModel modelWithLevel:DCFireLevelLarge];
        model.timeModel = [DCTimeModel modelWithSecond:60];
        model;
    })];
    
    [list addObject:({
        AutoVideoInnerViewModel *model = [AutoVideoInnerViewModel new];
        model.URL = [[NSBundle mainBundle] URLForResource:@"cook4" withExtension:@"mov"];
        model.materialList = [AutoVideoCellModel modelListWithList:nil];
        model.fireModel = [DCFireViewModel modelWithLevel:DCFireLevelLarge];
        model.timeModel = [DCTimeModel modelWithSecond:30];
        model;
    })];
    
    [list addObject:({
        AutoVideoInnerViewModel *model = [AutoVideoInnerViewModel new];
        model.URL = [[NSBundle mainBundle] URLForResource:@"cook5" withExtension:@"mov"];
        model.materialList = [AutoVideoCellModel modelListWithList:nil];
        model.fireModel = [DCFireViewModel modelWithLevel:DCFireLevelLarge];
        model.timeModel = [DCTimeModel modelWithSecond:30];
        model;
    })];
    
    [list addObject:({
        AutoVideoInnerViewModel *model = [AutoVideoInnerViewModel new];
        model.URL = [[NSBundle mainBundle] URLForResource:@"cook6" withExtension:@"mov"];
        model.materialList = [AutoVideoCellModel modelListWithList:nil];
        model.fireModel = [DCFireViewModel modelWithLevel:DCFireLevelLarge];
        model.timeModel = [DCTimeModel modelWithSecond:0];
        model;
    })];
    
    _modelList = list;
    return _modelList;
}

@end
