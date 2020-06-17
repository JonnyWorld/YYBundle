//
//  YYBundleManager+AppDelegate.m
//  YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//  Copyright © 2020 baozhou. All rights reserved.
//

#import "YYBundleManager+AppDelegate.h"
#import "YYBundleAppDelegate.h"

@implementation YYBundleManager (AppDelegate)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
            [bundle application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(applicationWillResignActive:)]) {
            [bundle applicationWillResignActive:application];
        }
    }];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(applicationDidEnterBackground:)]) {
            [bundle applicationDidEnterBackground:application];
        }
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(applicationWillEnterForeground:)]) {
            [bundle applicationWillEnterForeground:application];
        }
    }];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(applicationDidBecomeActive:)]) {
            [bundle applicationDidBecomeActive:application];
        }
    }];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(applicationWillTerminate:)]) {
            [bundle applicationWillTerminate:application];
        }
    }];
}

@end
