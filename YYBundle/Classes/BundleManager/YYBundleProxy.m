//
//  YYBundleProxy.m
//  Pods-YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//

#import "YYBundleProxy.h"
#import "YYBundle.h"

@interface YYBundleProxy ()

@property (nonatomic, strong) YYBundleConfig *bundleConfig;

@property (nonatomic, strong) id bundle;

@end


@implementation YYBundleProxy

+ (instancetype)bundleProxyWithCoding:(NSString *)coding bundleName:(NSString *)bundleName name:(NSString *)name hostVersion:(NSString *)hostVersion {
    id<YYBundle> bundle = [[NSClassFromString(bundleName) alloc] init];
    YYBundleProxy *proxy = [[YYBundleProxy alloc] init];
    proxy.bundle = bundle;
    YYBundleConfig *config = [[YYBundleConfig alloc] init];
    config.c = coding;
    config.n = name;
    config.v = bundle.version;
    config.d = bundle.introduce;
    config.host_v = hostVersion;
    proxy.bundleConfig = config;
    return proxy;
}

//bundle代理信息简介
- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"----->%@", self.bundleConfig.description];
}

//若配置相同，则认为两个组件代理相同
- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[YYBundleProxy class]]) {
        YYBundleProxy *proxy = object;
        if ([self.bundleConfig isEqual:proxy.bundleConfig]) {
            return YES;
        }
    }
    return NO;
}

@end
