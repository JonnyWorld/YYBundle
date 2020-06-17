//
//  YYMainBundle.m
//  Pods-YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//

#import "YYMainBundle.h"

@implementation YYMainBundle

+ (NSString *)buildNumber {
    NSString *buildNumber = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return buildNumber?:@"";
}

+ (NSString *)appVersion {
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return appVersion?:@"";
}

@end
