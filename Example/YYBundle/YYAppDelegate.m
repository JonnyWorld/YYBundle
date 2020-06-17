//
//  YYAppDelegate.m
//  YYBundle
//
//  Created by baozhou on 06/16/2020.
//  Copyright (c) 2020 baozhou. All rights reserved.
//

#import "YYAppDelegate.h"
//#import <YYBundle/YYBundleHeader.h>

@implementation YYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
//    NSLog(@"enter app");
//    [[YYBundleManager sharedInstance] start];
//    [[YYBundleManager sharedInstance] registerModulesWhenLaunch];
//    [[YYBundleManager sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
//
    return YES;
}
/*
- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options  {
    return [[YYBundleManager sharedInstance] application:application openURL:url options:options];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [[YYBundleManager sharedInstance] application:application handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application
          openURL:(NSURL *)url
sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[YYBundleManager sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [[YYBundleManager sharedInstance] applicationWillResignActive:application];

    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[YYBundleManager sharedInstance] applicationDidEnterBackground:application];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[YYBundleManager sharedInstance] applicationWillEnterForeground:application];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[YYBundleManager sharedInstance] applicationDidBecomeActive:application];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[YYBundleManager sharedInstance] applicationWillTerminate:application];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
*/
@end
