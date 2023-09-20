//
//  NSArray+LMSafeBound.m
//  MyiOSCategories
//
//  Created by Lyman on 16/9/12.
//  Copyright © 2016年 Lyman. All rights reserved.
//

#import <objc/message.h>

#import "NSArray+LMSafeBound.h"
#import "NSObject+LMExchangeMethod.h"

@implementation NSArray (LMSafeBound)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArrayI") lm_exchangedSelector:@selector(objectAtIndex:) withSelector:@selector(lm_objectAtIndex:)];
        [objc_getClass("__NSArrayI") lm_exchangedSelector:@selector(objectAtIndexedSubscript:) withSelector:@selector(lm_objectAtIndexedSubscript:)];
    });
}

- (id)lm_objectAtIndexedSubscript:(NSUInteger)index {
    if (index < self.count) {
        return [self lm_objectAtIndexedSubscript:index];
    } else {
        NSLog(@"【Error数组：%@】越界了，index = %ld, count = %ld",self,index, self.count);
        return nil;
    }
}

- (id)lm_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self lm_objectAtIndex:index];
    } else {
        NSLog(@"【Error数组：%@】越界了，index = %ld, count = %ld",self,index, self.count);
        return nil;
    }
}

@end
