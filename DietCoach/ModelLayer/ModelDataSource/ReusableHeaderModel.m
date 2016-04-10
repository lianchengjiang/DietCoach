//
//  ReusableHeaderModel.m
//  BaiduAbroadNews
//
//  Created by jiangliancheng on 16/4/6.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "ReusableHeaderModel.h"

@implementation ReusableHeaderModel
@synthesize kind = _kind;

- (NSString *)kind
{
    if (_kind) {
        return _kind;
    }
    _kind = UICollectionElementKindSectionHeader;
    return _kind;
}

@end
