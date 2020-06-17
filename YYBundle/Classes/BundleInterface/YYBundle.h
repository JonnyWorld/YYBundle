//
//  YYBundle.h
//  Pods-YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//

#import <Foundation/Foundation.h>

#define YYDATA(sectname) __attribute((used, section("__DATA,"#sectname" ")))
#define YYDATAMod(name) \
char * yc##name##_mod YYDATA(YYMods) = ""#name"";


@protocol YYBundle <NSObject>

@optional

/// 绑定组件
- (void)bind;

/// 解绑组件
- (void)unbind;

@required

// 组件版本
- (NSString *)version;

//组件
- (NSString *)introduce;

@end
