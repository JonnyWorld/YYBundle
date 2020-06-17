//
//  YYBundleManager.m
//  Pods-YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//

#import "YYBundleManager.h"
#import <mach-o/getsect.h>
#import <dlfcn.h>
#import <CommonCrypto/CommonDigest.h>
#import <pthread.h>
#import "YYBundleProxy.h"
#import "YYBundleConfig.h"
#import "YYMainBundle.h"
#import "YYBundle.h"

@interface YYBundleManager ()

/*白名单*/
@property(nonatomic, strong) NSMutableArray *whiteList;

/*注册队列*/
@property(nonatomic, strong) dispatch_queue_t registQueue;

/* 可用组件 */
@property(nonatomic, strong) NSMutableDictionary *bindBundles;

/* 全部组件 */
@property(nonatomic, strong) NSMutableDictionary *allBundles;

/* 写锁 */
@property(nonatomic, strong) dispatch_semaphore_t semaphore;

@end

@implementation YYBundleManager

#pragma mark - 组件启动

- (void)start {
    _version = [YYMainBundle appVersion];
    self.bindBundles = [NSMutableDictionary dictionaryWithCapacity:0];
    self.registQueue = dispatch_queue_create("registModuleQueue", DISPATCH_QUEUE_CONCURRENT);
    self.semaphore = dispatch_semaphore_create(1);
    
    //读取所有组件
    NSArray *allBundles = readModuleFromMach("YYMods");
    [self getAllBundlesWithBundleNameArray:allBundles];
}

//程序启动时注册必要组件
- (void)registerModulesWhenLaunch {
    for (NSString *code in self.allBundles.allKeys) {
        [self registBundle:code WithCompletion:nil asynchronous:NO];
    }
}

#pragma mark - 注册相关

- (void)registBundle:(NSString *)bundleCode WithCompletion:(void(^)(BOOL))completion asynchronous:(BOOL)isAsynchronous {
    if (isAsynchronous) {
        dispatch_async(_registQueue, ^{
            [self registBundle:bundleCode WithCompletion:completion];
        });
    } else {
        [self registBundle:bundleCode WithCompletion:completion];
    }
}

- (void)registBundle:(NSString *)bundleCode WithCompletion:(void(^)(BOOL))completion {
    if (![self checkBundle:self.allBundles[bundleCode]]) {
        return;
    }
    YYBundleProxy *proxy = self.allBundles[bundleCode];
    dispatch_semaphore_wait(_semaphore,DISPATCH_TIME_FOREVER);
    [self.bindBundles setValue:proxy forKey:bundleCode];
    dispatch_semaphore_signal(_semaphore);
    if ([proxy.bundle respondsToSelector:@selector(bind)]) {
        [proxy.bundle bind];
    }
    !completion?:completion(YES);
}

- (void)unRegistBundle:(NSString *) bundleCode WithCompletion:(void(^)(BOOL))completion asynchronous:(BOOL)isAsynchronous {
    if (isAsynchronous) {
        dispatch_async(_registQueue, ^{
            [self unRegistBundle:bundleCode WithCompletion:completion];
        });
    } else {
        [self unRegistBundle:bundleCode WithCompletion:completion];
    }
}

- (void)unRegistBundle:(NSString *) bundleCode WithCompletion:(void(^)(BOOL))completion {
    YYBundleProxy *proxy = self.allBundles[bundleCode];
    dispatch_semaphore_wait(_semaphore,DISPATCH_TIME_FOREVER);
    [self.bindBundles removeObjectForKey:bundleCode];
    dispatch_semaphore_signal(_semaphore);
    if ([proxy.bundle respondsToSelector:@selector(unbind)]) {
        [proxy.bundle unbind];
    }
    [proxy.bundle unbind];
    !completion?:completion(YES);
}

- (void)getAllBundlesWithBundleNameArray:(NSArray *)bundleNames {
    NSMutableDictionary *allBundles = [NSMutableDictionary dictionaryWithCapacity:0];
    NSMutableArray *whiteList = [NSMutableArray arrayWithCapacity:0];
    for (NSString *bundleName in bundleNames) {
        YYBundleProxy *proxy = [self createBundleProxyWithBundleName:bundleName];
        NSString *md5 = [self md5:[[NSString alloc] initWithFormat:@"%@%@", proxy.bundleConfig.c, proxy.bundleConfig.n]];
        if (proxy) {
            [allBundles setObject:proxy forKey:proxy.bundleConfig.c];
            [whiteList addObject:md5];
        }
    }
    self.allBundles = allBundles;
    self.whiteList = whiteList;
}

- (YYBundleProxy *)createBundleProxyWithBundleName:(NSString *)bundleName {
    if (![bundleName isKindOfClass:[NSString class]]) {
        return nil;
    }
    static int i = 0;
    YYBundleProxy *proxy = [YYBundleProxy bundleProxyWithCoding:[NSString stringWithFormat:@"%d",i++] bundleName:bundleName name:bundleName hostVersion:_version];
    return proxy;
}

#pragma mark - 验证相关

- (BOOL)checkBundle:(YYBundleProxy*) bundleProxy {
    if (!bundleProxy) {
        return NO;
    }
    
    if (!bundleProxy.bundleConfig) {
        return NO;
    }
    
    if (![self isValid:bundleProxy]) {
        return NO;
    }
    
    if (![self isInWhiteList:bundleProxy]) {
        return NO;
    }
    
    if ([self.bindBundles valueForKey:bundleProxy.bundleConfig.c]) {
        return NO;
    }
    
    if (![bundleProxy.bundleConfig.host_v isEqualToString:self.version]) {
        return NO;
    }
    
    return YES;
}

- (BOOL)isValid:(YYBundleProxy*)bundleProxy {
    if (bundleProxy.bundleConfig.c && bundleProxy.bundleConfig.n && bundleProxy.bundleConfig.v && bundleProxy.bundleConfig.host_v) {
        return YES;
    }
    return NO;
}

- (BOOL)isInWhiteList:(YYBundleProxy*)bundleProxy {
    if (!self.whiteList) {
        return NO;
    }
    NSString *md5 = [self md5:[[NSString alloc] initWithFormat:@"%@%@", bundleProxy.bundleConfig.c, bundleProxy.bundleConfig.n]];
    NSLog(@"yours:%@", md5);
    return [self.whiteList containsObject:md5];
}

- (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}

#pragma mark - 单例相关

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static YYBundleManager *instance = nil;
    if(instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            instance = [[super allocWithZone:zone] init];
        });
    }
    return instance;
}

+ (instancetype)sharedInstance {
    return [self alloc];
}

- (id)copyWithZone:(NSZone *)zone {
    return [[self class] sharedInstance];
}

#pragma mark - 从Mach-O文件中读出组件信息

static NSArray<NSString *>* readModuleFromMach(char *section) {
    NSMutableArray *modules = [NSMutableArray arrayWithCapacity:0];
    Dl_info info;
    dladdr(readModuleFromMach, &info);
    
#ifndef __LP64__
    const struct mach_header *mhp = (struct mach_header*)info.dli_fbase;
    unsigned long size = 0;
    uint32_t *memory = (uint32_t*)getsectiondata(mhp, "__DATA", section, & size);
#else
    const struct mach_header_64 *mhp = (struct mach_header_64*)info.dli_fbase;
    unsigned long size = 0;
    uint64_t *memory = (uint64_t*)getsectiondata(mhp, "__DATA", section, & size);
#endif
    
    for(int idx = 0; idx < size/sizeof(void*); ++idx){
        char *string = (char*)memory[idx];
        NSString *str = [NSString stringWithUTF8String:string];
        if (str) {
            [modules addObject:str];
        } else {
            continue;
        }
    }
    return modules;
}

#pragma mark - 遍历可用bundle

- (void)enumeratorBindBundleWithBlock:(void(^)(id bundle))bundleEnumerator {
    dispatch_semaphore_wait(_semaphore,DISPATCH_TIME_FOREVER);
    for (YYBundleProxy *proxy in _bindBundles.allValues) {
        bundleEnumerator(proxy.bundle);
    }
    dispatch_semaphore_signal(_semaphore);
}

@end
