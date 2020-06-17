//
//  YYBundleConfig.m
//  Pods-YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//

#import "YYBundleConfig.h"

@implementation YYBundleConfig

//组件信息简介
- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"c=%@|n=%@|v=%@|d=%@|host_v=%@", self.c, self.n, self.v, self.d, self.host_v];
}

//若编码相同，则认为两个组件相同
- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    if (![object isKindOfClass:[YYBundleConfig class]]) {
        return NO;
    }
    return [self isEqulToBundleConfig:object];
}

- (BOOL)isEqulToBundleConfig:(YYBundleConfig *)bundleConfig {
    if (!bundleConfig) {
        return NO;
    }
    BOOL haveEqualC = (!self.c && !bundleConfig.c)||[self.c isEqualToString:bundleConfig.c];
    return haveEqualC;
}

- (NSUInteger)hash {
    return [self.c hash];
}

@end
