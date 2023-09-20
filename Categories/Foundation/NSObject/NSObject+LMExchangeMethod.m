//
//  NSObject+LMExchangeMethod.m
//  MyiOSCategories
//
//  Created by Lyman on 16/9/12.
//  Copyright © 2016年 Lyman. All rights reserved.
//

#import <objc/message.h>

#import "NSObject+LMExchangeMethod.h"

@implementation NSObject (LMExchangeMethod)

+ (BOOL)lm_exchangedSelector:(SEL)sourceSelector withSelector:(SEL)targetSelector {
    
    Method sourceMethod = class_getInstanceMethod(self,sourceSelector);
    if (!sourceMethod) return NO;

    Method targetMethod = class_getInstanceMethod(self,targetSelector);
    if (!targetMethod) return NO;

    if (class_addMethod([self class], sourceSelector, method_getImplementation(targetMethod), method_getTypeEncoding(targetMethod))) {
        class_replaceMethod([self class], targetSelector, method_getImplementation(sourceMethod), method_getTypeEncoding(sourceMethod));
    } else {
        method_exchangeImplementations(sourceMethod,targetMethod);
    }

    return YES;
}

@end
