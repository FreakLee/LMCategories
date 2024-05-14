//
//  NSSet+LMFunctional.h
//  MyiOSCategories
//
//  Created by min Lee  on 2017/5/14.
//  Copyright © 2017 min Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSSet (LMFunctional)

- (NSSet *)map:(id (^)(id obj))block;
- (NSSet *)filter:(BOOL (^)(id obj))block;
- (id)reduce:(id)initial withBlock:(id (^)(id acc, id obj))block;

@end

NS_ASSUME_NONNULL_END
