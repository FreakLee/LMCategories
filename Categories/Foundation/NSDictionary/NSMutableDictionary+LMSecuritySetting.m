//
//  NSMutableDictionary+LMSecuritySetting.m
//  MyiOSCategories
//
//  Created by Lyman on 16/9/12.
//  Copyright © 2016年 Lyman. All rights reserved.
//

#import <objc/message.h>

#import "NSMutableDictionary+LMSecuritySetting.h"
#import "NSObject+LMExchangeMethod.h"

@implementation NSMutableDictionary (LMSecuritySetting)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSDictionaryM") lm_exchangedSelector:@selector(setObject:forKey:) withSelector:@selector(lm_setObject:forKey:)];
        [objc_getClass("__NSDictionaryM") lm_exchangedSelector:@selector(setObject:forKeyedSubscript:) withSelector:@selector(lm_setObject:forKeyedSubscript:)];
    });
}

- (void)lm_setObject:(id)object forKey:(id)key {
    
    if (object && key && [key conformsToProtocol:@protocol(NSCopying)]) {
        [self lm_setObject:object forKey:key];
    } else {
        if (!object) {
            if (![self.allKeys containsObject:@"ContentView.title"]) {
                NSLog(@"【Error字典：%@】setObject报错：object为空",self);
            }
        } else if (!key) {
            if (![self.allKeys containsObject:@"ContentView.title"]) {
                NSLog(@"【Error字典：%@】setObject报错：key为空",self);
            }
        } else if (![key conformsToProtocol:@protocol(NSCopying)]) {
            if (![self.allKeys containsObject:@"ContentView.title"]) {
                NSLog(@"【Error字典：%@】setObject报错：key不遵从NSCopying协议",self);
            }
        } else {
            if (![self.allKeys containsObject:@"ContentView.title"]) {
                NSLog(@"【Error字典：%@】setObject报错，请检查错误",self);
            }
        }
    }
}

- (void)lm_setObject:(id)object forKeyedSubscript:(id)key {
    
    if (object && key && [key conformsToProtocol:@protocol(NSCopying)]) {
        [self lm_setObject:object forKeyedSubscript:key];
    } else {
        if (!object) {
            if (![self.allKeys containsObject:@"ContentView.title"]) {
                NSLog(@"【Error字典：%@】setObject:forKeyedSubscript报错：object为空",self);
            }
        } else if (!key) {
            if (![self.allKeys containsObject:@"ContentView.title"]) {
                NSLog(@"【Error字典：%@】setObject:forKeyedSubscript报错：key为空",self);
            }
        } else if (![key conformsToProtocol:@protocol(NSCopying)]) {
            if (![self.allKeys containsObject:@"ContentView.title"]) {
                NSLog(@"【Error字典：%@】setObject:forKeyedSubscript报错：key不遵从NSCopying协议",self);
            }
        } else {
            if (![self.allKeys containsObject:@"ContentView.title"]) {
                NSLog(@"【Error字典：%@】setObject:forKeyedSubscript报错，请检查错误",self);
            }
        }
    }
}

@end
