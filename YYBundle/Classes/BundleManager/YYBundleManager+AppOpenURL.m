//
//  YYBundleManager+AppOpenURL.m
//  YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//  Copyright © 2020 baozhou. All rights reserved.
//

#import "YYBundleManager+AppOpenURL.h"

@implementation YYBundleManager (AppOpenURL)

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    __block BOOL shouldOpen = YES;
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(application:openURL:options:)]) {
            shouldOpen = shouldOpen && [bundle application:app openURL:url options:options];
        }
    }];
    return shouldOpen;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    __block BOOL shouldHandle = YES;
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(application:handleOpenURL:)]) {
            shouldHandle = shouldHandle && [bundle application:application handleOpenURL:url];
        }
    }];
    return shouldHandle;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    __block BOOL shouldOpen = YES;
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(application:openURL:sourceApplication:annotation:)]) {
            shouldOpen = shouldOpen && [bundle application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
        }
    }];
    return shouldOpen;
}

@end
