//
//  NSDictionary+LMFunctional.h
//  MyiOSCategories
//
//  Created by min Lee  on 2017/5/14.
//  Copyright © 2017 min Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (LMFunctional)

- (NSDictionary *)map:(id (^)(id key, id value))block;
- (NSDictionary *)filter:(BOOL (^)(id key, id value))block;
- (id)reduce:(id)initial withBlock:(id (^)(id acc, id key, id value))block;

@end

NS_ASSUME_NONNULL_END
