//
//  ModelCollectionViewDataSource.m
//  BaiduAbroadNews
//
//  Created by jiangliancheng on 16/4/5.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "ModelCollectionViewDataSource.h"
#import "SupplementaryModel.h"
#import "BDReusableViewModel.h"
#import "LCFoundation.h"

@implementation ModelCollectionViewDataSource

#pragma mark - delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{
    return [self sectionNumber];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [self itemNumberInSection:section];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;
{
    SupplementaryModel *model = nil;
    UICollectionReusableView * supplementaryView = nil;
    BOOL ret = YES;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        model = self.headerMap[@(indexPath.section)];
        CPRA(model);
        [collectionView registerClass:model.viewClass forSupplementaryViewOfKind:model.kind withReuseIdentifier:model.identifier];
        supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:model.kind withReuseIdentifier:model.identifier forIndexPath:indexPath];
        CPRA(supplementaryView);
        if (self.configHeaderBlock) {
            self.configHeaderBlock(supplementaryView,(ReusableHeaderModel*)model);
        }
        return supplementaryView;
    }
    
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        model = self.footerMap[@(indexPath.section)];
        CPRA(model);
        [collectionView registerClass:model.viewClass forSupplementaryViewOfKind:model.kind withReuseIdentifier:model.identifier];
        supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:model.kind withReuseIdentifier:model.identifier forIndexPath:indexPath];
        CPRA(supplementaryView);
        if (self.configFooterBlock) {
            self.configFooterBlock(supplementaryView,(ReusableFooterModel*)model);
        }
        return supplementaryView;
    }
    
ERROR:
    
    return nil;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    __kindof UICollectionViewCell<BDReusableViewModelProtocol> *cell = nil;
    BDReusableViewModel *item;
    BOOL ret = YES;
    CPRA(self.itemList);
    
    item = [self itemForIndexPath:indexPath];
    
    CPRA(item);
    
    [collectionView registerClass:item.viewClass forCellWithReuseIdentifier:item.identifier];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:item.identifier forIndexPath:indexPath];
    if (self.configBlock) {
        self.configBlock(cell, item);
    }
    
ERROR:
    return cell;

}

@end
