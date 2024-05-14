//
//  NSSet+LMFunctional.m
//  MyiOSCategories
//
//  Created by min Lee  on 2017/5/14.
//  Copyright © 2017 min Lee. All rights reserved.
//

#import "NSSet+LMFunctional.h"

@implementation NSSet (LMFunctional)

- (NSSet *)map:(id (^)(id obj))block {
    NSMutableSet *result = [NSMutableSet setWithCapacity:self.count];
    for (id obj in self) {
        id mappedObj = block(obj);
        if (mappedObj) {
            [result addObject:mappedObj];
        }
    }
    return [result copy];
}

- (NSSet *)filter:(BOOL (^)(id obj))block {
    NSMutableSet *result = [NSMutableSet setWithCapacity:self.count];
    for (id obj in self) {
        if (block(obj)) {
            [result addObject:obj];
        }
    }
    return [result copy];
}

- (id)reduce:(id)initial withBlock:(id (^)(id acc, id obj))block {
    id accumulator = initial;
    for (id obj in self) {
        accumulator = block(accumulator, obj);
    }
    return accumulator;
}

@end
