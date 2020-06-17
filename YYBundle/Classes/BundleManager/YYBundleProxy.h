//
//  YYBundleProxy.h
//  Pods-YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//

#import <Foundation/Foundation.h>
#import "YYBundleConfig.h"

@interface YYBundleProxy : NSObject

@property (nonatomic, strong, readonly) YYBundleConfig *bundleConfig;

@property (nonatomic, strong, readonly) id bundle;

/**
 创建bundle代理对象

 @param coding bundle的coding
 @param bundleName bundle的名称
 @param name 包管理给模块分配的名称
 @param hostVersion 宿主的版本
 @return bundle代理对象
 */
+ (instancetype)bundleProxyWithCoding:(NSString *)coding bundleName:(NSString *)bundleName name:(NSString *)name hostVersion:(NSString *)hostVersion;


@end
