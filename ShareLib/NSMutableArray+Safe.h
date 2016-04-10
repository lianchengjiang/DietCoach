//
//  NSMutableArray+Safe.h
//  BDFoundation
//
//  Created by Wayne W on 14-8-30.
//
//

#import <Foundation/Foundation.h>
#import "NSArray+Safe.h"

@interface NSMutableArray (Safe)

- (void)safe_insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)safe_addObject:(id)anObject;

- (void)safe_removeObjectAtIndex:(NSUInteger)index;
- (void)safe_removeObject:(id)anObject;

@end
