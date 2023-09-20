//
//  NSObject+LMExchangeMethod.h
//  MyiOSCategories
//
//  Created by Lyman on 16/9/12.
//  Copyright © 2016年 Lyman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LMExchangeMethod)

/**
 *  交换实例方法
 *
 *  @param sourceSelector 源Selector
 *  @param targetSelector 目标Selector
 *
 *  @return 是否替换成功
 */
+ (BOOL)lm_exchangedSelector:(SEL)sourceSelector withSelector:(SEL)targetSelector;

@end

