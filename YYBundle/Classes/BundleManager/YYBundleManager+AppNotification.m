//
//  YYBundleManager+AppNotification.m
//  YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//  Copyright © 2020 baozhou. All rights reserved.
//

#import "YYBundleManager+AppNotification.h"

@implementation YYBundleManager (AppNotification)

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)]) {
            [bundle application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(application:didReceiveRemoteNotification:)]) {
            [bundle application:application didReceiveRemoteNotification:userInfo];
        }
    }];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)]) {
            [bundle application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
        }
    }];
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000

/// iOS10新增：处理前台收到通知的代理方法
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler API_AVAILABLE(ios(10.0)) {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(userNotificationCenter:willPresentNotification:withCompletionHandler:)]) {
            [bundle userNotificationCenter:center willPresentNotification:notification withCompletionHandler:completionHandler];
        }
    }];
}

/// iOS10新增：处理后台点击通知的代理方法
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler API_AVAILABLE(ios(10.0)) {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:)]) {
            [bundle userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:completionHandler];
        }
    }];
}

- (void)userNotificationReceiveNotification:(UNNotification *)notification API_AVAILABLE(ios(10.0)) {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(userNotificationReceiveNotification:)]) {
            [bundle userNotificationReceiveNotification:notification];
        }
    }];
}

#endif

- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(didReceiveRemoteNotification:)]) {
            [bundle didReceiveRemoteNotification:userInfo];
        }
    }];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [self enumeratorBindBundleWithBlock:^(id bundle) {
        if ([bundle respondsToSelector:@selector(application:didReceiveLocalNotification:)]) {
            [bundle application:application didReceiveLocalNotification:notification];
        }
    }];
}

@end
