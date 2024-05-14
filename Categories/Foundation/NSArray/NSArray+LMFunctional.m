//
//  NSArray+LMFunctional.m
//  MyiOSCategories
//
//  Created by min Lee  on 2017/5/14.
//  Copyright © 2017 min Lee. All rights reserved.
//

#import "NSArray+LMFunctional.h"

@implementation NSArray (LMFunctional)

- (NSArray *)map:(id (^)(id obj))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        id mappedObj = block(obj);
        if (mappedObj) {
            [result addObject:mappedObj];
        }
    }
    return [result copy];
}

- (NSArray *)filter:(BOOL (^)(id obj))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
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

- (NSArray *)flatten {
    NSMutableArray *result = [NSMutableArray array];
    for (id obj in self) {
        if ([obj isKindOfClass:[NSArray class]]) {
            [result addObjectsFromArray:[obj flatten]];
        } else {
            [result addObject:obj];
        }
    }
    return [result copy];
}

- (NSArray *)distinct {
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:self];
    return [orderedSet array];
}

@end
