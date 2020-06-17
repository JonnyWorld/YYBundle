//
//  YYBundleAppOpenURL.h
//  Pods-YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//

#import <Foundation/Foundation.h>

@protocol YYBundleAppOpenURL <NSObject>

@optional

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation;

@end
