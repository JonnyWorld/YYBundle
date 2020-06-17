//
//  YYBundleManager+AppOpenURL.h
//  YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//  Copyright © 2020 baozhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYBundleManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface YYBundleManager (AppOpenURL)

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation;


@end

NS_ASSUME_NONNULL_END
