//
//  ModelTableViewDataSource.m
//  BaiduAbroadNews
//
//  Created by jiangliancheng on 16/3/30.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "ModelTableViewDataSource.h"
#import "LCFoundation.h"


@implementation ModelTableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self sectionNumber];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self itemNumberInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __kindof UITableViewCell<BDReusableViewModelProtocol> *cell = nil;
    BDReusableViewModel *item;
    BOOL ret = YES;
    CPRA(self.itemList);
    
    item = [self itemForIndexPath:indexPath];
    
    CPRA(item);
    
    [tableView registerClass:item.viewClass forCellReuseIdentifier:item.identifier];
    cell = [tableView dequeueReusableCellWithIdentifier:item.identifier];
    if (self.configBlock) {
        self.configBlock(cell, item);
    }
    
ERROR:
    return cell;
}

@end
