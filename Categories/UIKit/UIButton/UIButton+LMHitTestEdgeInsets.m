//
//  UIButton+LMHitTestEdgeInsets.m
//  MyiOSCategories
//
//  Created by Lyman on 2018/2/8.
//  Copyright © 2018年 Lyman. All rights reserved.
//

#import <objc/runtime.h>
#import "UIButton+LMHitTestEdgeInsets.h"

@implementation UIButton (LMHitTestEdgeInsets)

static NSString const *LMKEY_HIT_TEST_EDGE_INSETS = @"LMHitTestEdgeInsets";

- (void)setLm_hitTestEdgeInsets:(UIEdgeInsets)lm_hitTestEdgeInsets {
    NSValue *value = [NSValue value:&lm_hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &LMKEY_HIT_TEST_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)lm_hitTestEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &LMKEY_HIT_TEST_EDGE_INSETS);
    if (value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    } else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (UIEdgeInsetsEqualToEdgeInsets(self.lm_hitTestEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect expandFrame = UIEdgeInsetsInsetRect(relativeFrame, self.lm_hitTestEdgeInsets);
    
    return CGRectContainsPoint(expandFrame, point);
}

@end
