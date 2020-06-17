//
//  YYBundleAppdelegate.h
//  Pods-YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//

#import <Foundation/Foundation.h>


@protocol YYBundleAppdelegate <NSObject>

@optional

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (void)applicationWillResignActive:(UIApplication *)application;

- (void)applicationDidEnterBackground:(UIApplication *)application;

- (void)applicationWillEnterForeground:(UIApplication *)application;

- (void)applicationDidBecomeActive:(UIApplication *)application;

- (void)applicationWillTerminate:(UIApplication *)application;

@end
