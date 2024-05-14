//
//  LMPerson.m
//  MyiOSCategories
//
//  Created by min Lee  on 2017/5/14.
//  Copyright © 2017 min Lee. All rights reserved.
//

#import "LMPerson.h"

@implementation LMPerson

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, %ld", self.name, (long)self.age];
}

@end
