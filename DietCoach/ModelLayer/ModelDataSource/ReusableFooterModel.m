//
//  ReusableFooterModel.m
//  BaiduAbroadNews
//
//  Created by jiangliancheng on 16/4/6.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "ReusableFooterModel.h"

@implementation ReusableFooterModel
@synthesize kind = _kind;

- (NSString *)kind
{
    if (_kind) {
        return _kind;
    }
    _kind = UICollectionElementKindSectionFooter;
    return _kind;
}
@end
