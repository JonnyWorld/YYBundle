//
//  BLBaseModules.m
//  YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//  Copyright © 2020 baozhou. All rights reserved.
//

#import "BLBaseModules.h"

@implementation BLBaseModules

- (void)bind {
    NSLog(@"BLBaseModules  bind");

}

- (void)unbind {
  
}

// 组件版本
- (NSString *)version {
    return @"1.0";
}

//组件
- (NSString *)introduce {
    return @"基础启动管理";
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"BLBaseModules  didFinishLaunchingWithOptions");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"BLBaseModules  applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"BLBaseModules  applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"BLBaseModules  applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"BLBaseModules  applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"BLBaseModules  applicationWillTerminate");
}

@end
