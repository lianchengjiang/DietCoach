//
//  NSMutableArray+Safe.m
//  BDFoundation
//
//  Created by Wayne W on 14-8-30.
//
//

#import "NSMutableArray+Safe.h"
#import "ehm.h"

@implementation NSMutableArray (Safe)

- (void)safe_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject && index <= [self count])
    {
        [self insertObject:anObject atIndex:index];
    }
    else
    {
        VERROR();
    }
}

- (void)safe_addObject:(id)anObject
{
    if (anObject)
    {
        [self addObject:anObject];
    }
    else
    {
        VERROR();
    }
}

- (void)safe_removeObjectAtIndex:(NSUInteger)index
{
    if (index < [self count]) {
        [self removeObjectAtIndex:index];
    }else
    {
        VERROR();
    }
}

- (void)safe_removeObject:(id)anObject
{
    if (anObject) {
        [self removeObject:anObject];
    }else
    {
        VERROR();
    }
}


@end
