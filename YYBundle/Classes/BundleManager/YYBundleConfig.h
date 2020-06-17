//
//  YYBundleConfig.h
//  Pods-YYBundle_Example
//
//  Created by Baozhou on 2020/6/16.
//

#import <Foundation/Foundation.h>


@interface YYBundleConfig : NSObject

/**
 组件编码
 */
@property (nonatomic, copy) NSString *c;
/**
 组件名称
 */
@property (nonatomic, copy) NSString *n;
/**
 组件版本
 */
@property (nonatomic, copy) NSString *v;
/**
 组件描述
 */
@property (nonatomic, copy) NSString *d;
/**
 宿主版本
 */
@property (nonatomic, copy) NSString *host_v;


@end

