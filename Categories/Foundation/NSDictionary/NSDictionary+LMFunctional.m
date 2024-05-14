//
//  NSDictionary+LMFunctional.m
//  MyiOSCategories
//
//  Created by min Lee  on 2017/5/14.
//  Copyright © 2017 min Lee. All rights reserved.
//

#import "NSDictionary+LMFunctional.h"

@implementation NSDictionary (LMFunctional)

- (NSDictionary *)map:(id (^)(id key, id value))block {
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        id newValue = block(key, value);
        if (newValue) {
            result[key] = newValue;
        }
    }];
    return [result copy];
}

- (NSDictionary *)filter:(BOOL (^)(id key, id value))block {
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        if (block(key, value)) {
            result[key] = value;
        }
    }];
    return [result copy];
}

- (id)reduce:(id)initial withBlock:(id (^)(id acc, id key, id value))block {
    __block id accumulator = initial;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        accumulator = block(accumulator, key, value);
    }];
    return accumulator;
}

@end
