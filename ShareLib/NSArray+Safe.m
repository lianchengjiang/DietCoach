//
//  NSArray+Safe.m
//  BDFoundation
//
//  Created by Wayne W on 14-8-30.
//
//

#import "NSArray+Safe.h"
#import "ehm.h"
@implementation NSArray (Safe)

- (id)safe_objectAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        return [self objectAtIndex:index];
    }
    else
    {
        VERROR();
    }
    
    return nil;
}

@end
