//
//  YYBundleManager.h
//  Pods-YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//

#import <Foundation/Foundation.h>


@interface YYBundleManager : NSObject

/**
 组件管理器版本号
 */
@property(nonatomic, strong, readonly) NSString *version;

/**
 启动组件管理器
 */
- (void)start;

/**
 启动时注册必要的组件
 */
- (void)registerModulesWhenLaunch;

/**
 注册组件

 @param bundleCode bundle编码
 @param completion 注册完成回调
 */
- (void)registBundle:(NSString *) bundleCode WithCompletion:(void(^)(BOOL))completion asynchronous:(BOOL)isAsynchronous;

/**
 组件取消注册

 @param bundleCode bundle编码
 @param completion 取消完成回调
 */
- (void)unRegistBundle:(NSString *) bundleCode WithCompletion:(void(^)(BOOL))completion asynchronous:(BOOL)isAsynchronous;

/**
 遍历可用bundle

 @param bundleEnumerator bundle生成器
 */
- (void)enumeratorBindBundleWithBlock:(void(^)(id bundle))bundleEnumerator;

/**
 组件管理器单例

 @return 组件管理器单例
 */
+ (instancetype)sharedInstance;


@end

