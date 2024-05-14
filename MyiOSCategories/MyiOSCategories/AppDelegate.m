//
//  AppDelegate.m
//  MyiOSCategories
//
//  Created by Lyman on 16/9/12.
//  Copyright © 2016年 Lyman. All rights reserved.
//

#import "AppDelegate.h"

#import "NSArray+LMFunctional.h"
#import "NSDictionary+LMFunctional.h"
#import "NSSet+LMFunctional.h"
#import "LMPerson.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    // NSArray 扩展功能使用示例
//    NSArray *numbers = @[@1, @2, @3, @4, @5];
//
//    // 使用map方法
//    NSArray *squaredNumbers = [numbers map:^id(id obj) {
//        NSNumber *number = (NSNumber *)obj;
//        return @(number.intValue * number.intValue);
//    }];
//    NSLog(@"Squared Numbers: %@", squaredNumbers);
//
//    // 使用filter方法
//    NSArray *evenNumbers = [numbers filter:^BOOL(id obj) {
//        NSNumber *number = (NSNumber *)obj;
//        return number.intValue % 2 == 0;
//    }];
//    NSLog(@"Even Numbers: %@", evenNumbers);
//
//    // 使用reduce方法
//    NSNumber *sum = [numbers reduce:@0 withBlock:^id(id acc, id obj) {
//        return @([acc intValue] + [obj intValue]);
//    }];
//    NSLog(@"Sum: %@", sum);
//
//    // 使用flatten方法
//    NSArray *nestedArray = @[@[@1, @2], @[@3, @[@4, @5]], @6];
//    NSArray *flattenedArray = [nestedArray flatten];
//    NSLog(@"Flattened Array: %@", flattenedArray);
//
//    // 使用distinct方法
//    NSArray *arrayWithDuplicates = @[@1, @2, @2, @3, @3, @3, @4];
//    NSArray *distinctArray = [arrayWithDuplicates distinct];
//    NSLog(@"Distinct Array: %@", distinctArray);
//
//
//    // NSDictionary 扩展功能使用示例
//    NSDictionary *dict = @{@"one": @1, @"two": @2, @"three": @3};
//
//    // 使用map方法
//    NSDictionary *squaredValuesDict = [dict map:^id(id key, id value) {
//        return @([value intValue] * [value intValue]);
//    }];
//    NSLog(@"Squared Values Dict: %@", squaredValuesDict);
//
//    // 使用filter方法
//    NSDictionary *filteredDict = [dict filter:^BOOL(id key, id value) {
//        return [value intValue] % 2 == 0;
//    }];
//    NSLog(@"Filtered Dict: %@", filteredDict);
//
//    // 使用reduce方法
//    NSNumber *sumDict = [dict reduce:@0 withBlock:^id(id acc, id key, id value) {
//        return @([acc intValue] + [value intValue]);
//    }];
//    NSLog(@"Sum Dict: %@", sumDict);
//
//    // NSSet 扩展功能使用示例
//    NSSet *set = [NSSet setWithObjects:@1, @2, @3, @4, @5, nil];
//
//    // 使用map方法
//    NSSet *squaredValuesSet = [set map:^id(id obj) {
//        return @([obj intValue] * [obj intValue]);
//    }];
//    NSLog(@"Squared Values Set: %@", squaredValuesSet);
//
//    // 使用filter方法
//    NSSet *filteredSet = [set filter:^BOOL(id obj) {
//        return [obj intValue] % 2 == 0;
//    }];
//    NSLog(@"Filtered Set: %@", filteredSet);
//
//    // 使用reduce方法
//    NSNumber *sumSet = [set reduce:@0 withBlock:^id(id acc, id obj) {
//        return @([acc intValue] + [obj intValue]);
//    }];
//    NSLog(@"Sum Set: %@", sumSet);
        
    // 创建自定义的Person对象
    LMPerson *person1 = [[LMPerson alloc] initWithName:@"Alice" age:30];
    LMPerson *person2 = [[LMPerson alloc] initWithName:@"Bob" age:25];
    LMPerson *person3 = [[LMPerson alloc] initWithName:@"Charlie" age:35];
    LMPerson *person4 = [[LMPerson alloc] initWithName:@"David" age:40];

    NSArray *peopleArray = @[person1, person2, person3, person4];
    
    // 使用map方法
    NSArray *namesArray = [peopleArray map:^id(LMPerson *person) {
        return person.name;
    }];
    NSLog(@"Names Array: %@", namesArray);

    // 使用filter方法
    NSArray *filteredArray = [peopleArray filter:^BOOL(LMPerson *person) {
        return person.age > 30;
    }];
    NSLog(@"Filtered Array: %@", filteredArray);

    // 使用reduce方法
    NSInteger totalAge = [[peopleArray reduce:@0 withBlock:^id(NSNumber *acc, LMPerson *person) {
        return @(acc.integerValue + person.age);
    }] integerValue];
    NSLog(@"Total Age: %ld", (long)totalAge);

    // 创建包含Person对象的NSDictionary
    NSDictionary *peopleDict = @{@"Alice": person1, @"Bob": person2, @"Charlie": person3, @"David": person4};

    // 使用map方法
    NSDictionary *nameAgeDict = [peopleDict map:^id(id key, LMPerson *person) {
        return @(person.age);
    }];
    NSLog(@"Name-Age Dict: %@", nameAgeDict);

    // 使用filter方法
    NSDictionary *filteredDict = [peopleDict filter:^BOOL(id key, LMPerson *person) {
        return person.age > 30;
    }];
    NSLog(@"Filtered Dict: %@", filteredDict);

    // 使用reduce方法
    totalAge = [[peopleDict reduce:@0 withBlock:^id(NSNumber *acc, id key, LMPerson *person) {
        return @(acc.integerValue + person.age);
    }] integerValue];
    NSLog(@"Total Age from Dict: %ld", (long)totalAge);

    // 创建包含Person对象的NSSet
    NSSet *peopleSet = [NSSet setWithObjects:person1, person2, person3, person4, nil];

    // 使用map方法
    NSSet *agesSet = [peopleSet map:^id(LMPerson *person) {
        return @(person.age);
    }];
    NSLog(@"Ages Set: %@", agesSet);

    // 使用filter方法
    NSSet *filteredS = [peopleSet filter:^BOOL(LMPerson *person) {
        return person.age > 30;
    }];
    NSLog(@"Filtered Set: %@", filteredS);

    // 使用reduce方法
    totalAge = [[peopleSet reduce:@0 withBlock:^id(NSNumber *acc, LMPerson *person) {
        return @(acc.integerValue + person.age);
    }] integerValue];
    NSLog(@"Total Age from Set: %ld", (long)totalAge);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
