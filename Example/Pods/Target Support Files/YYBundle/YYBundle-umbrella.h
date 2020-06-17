#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YYBundle.h"
#import "YYBundleAppdelegate.h"
#import "YYBundleAppNotification.h"
#import "YYBundleAppOpenURL.h"
#import "YYBundleConfig.h"
#import "YYBundleManager+AppDelegate.h"
#import "YYBundleManager+AppNotification.h"
#import "YYBundleManager+AppOpenURL.h"
#import "YYBundleManager.h"
#import "YYBundleProxy.h"
#import "YYMainBundle.h"
#import "YYBundleHeader.h"

FOUNDATION_EXPORT double YYBundleVersionNumber;
FOUNDATION_EXPORT const unsigned char YYBundleVersionString[];

