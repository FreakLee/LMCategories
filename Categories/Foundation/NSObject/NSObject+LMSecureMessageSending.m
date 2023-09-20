//
//  NSObject+LMSecureMessageSending.m
//  MyiOSCategories
//
//  Created by Lyman on 16/9/12.
//  Copyright © 2016年 Lyman. All rights reserved.
//

#import <objc/message.h>

#import "NSObject+LMSecureMessageSending.h"
#import "NSObject+LMExchangeMethod.h"

@implementation NSObject (LMSecureMessageSending)

void LMCrash(id self, SEL _cmd) {
    NSLog(@"%@ LMCrash called %@",self,NSStringFromSelector(_cmd));
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[self class] lm_exchangedSelector:@selector(forwardingTargetForSelector:) withSelector:@selector(lm_forwardingTargetForSelector:)];
    });
}

- (id)lm_forwardingTargetForSelector:(SEL)aSelector {
    // 获取NSObject的消息转发方法
    SEL sel = NSSelectorFromString(@"forwardingTargetForSelector:");
    Method method = class_getInstanceMethod(NSClassFromString(@"NSObject"), sel);
    // 获取当前类的消息转发方法
    Method _m = class_getInstanceMethod([self class],sel);
    
    // 类本身有没有实现消息转发流程
    BOOL transmit = method_getImplementation(_m) == method_getImplementation(method);
    
    // 有没有实现下一步消息转发流程
    if (transmit) {
        // 有没有实现第三步消息转发
        SEL sel1 = NSSelectorFromString(@"methodSignatureForSelector:");
        Method method1 = class_getInstanceMethod(NSClassFromString(@"NSObject"), sel1);
        
        Method _m1 = class_getInstanceMethod([self class], sel1);
        transmit = method_getImplementation(_m1) == method_getImplementation(method1);
        
        if (transmit) {
            // 创建一个新类
            NSString *errClassName = NSStringFromClass([self class]);
            NSString *errSel   = NSStringFromSelector(aSelector);
            NSLog(@"出问题的类，出问题的方法 == %@ %@", errClassName, errSel);
            
            NSString *className = @"LMCrachClass";
            Class cls = NSClassFromString(className);
            if (!cls) {
                Class superCls = [NSObject class];
                cls = objc_allocateClassPair(superCls, className.UTF8String, 0);
                class_addMethod(cls, aSelector, (IMP)LMCrash, "@@:@");
                objc_registerClassPair(cls);
            }
            
            // 如果类没有对应的方法，则动态添加一个
            if (!class_getInstanceMethod(NSClassFromString(className), aSelector)) {
                class_addMethod(cls, aSelector, (IMP)LMCrash, "@@:@");
            }
            
            return [[NSClassFromString(className) alloc] init];
        }
    }
    
    return [self lm_forwardingTargetForSelector:aSelector];
}

@end
