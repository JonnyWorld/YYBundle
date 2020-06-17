//
//  YYBundleAppNotification.h
//  YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//  Copyright © 2020 baozhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000

#import <UserNotifications/UserNotifications.h>

#endif


NS_ASSUME_NONNULL_BEGIN

@protocol YYBundleAppNotification <NSObject>

@optional

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000

/// iOS10新增：处理前台收到通知的代理方法
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler API_AVAILABLE(ios(10.0));

/// iOS10新增：处理后台点击通知的代理方法
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler API_AVAILABLE(ios(10.0));

- (void)userNotificationReceiveNotification:(UNNotification *)notification API_AVAILABLE(ios(10.0));

#endif

- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo;

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification;

@end

NS_ASSUME_NONNULL_END
