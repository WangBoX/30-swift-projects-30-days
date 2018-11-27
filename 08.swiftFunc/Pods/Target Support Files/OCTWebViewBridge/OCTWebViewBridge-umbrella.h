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

#import "OCTBaseDestination.h"
#import "OCTConsoleDestination.h"
#import "OCTConsoleLogger.h"
#import "OCTFileLogger.h"
#import "OCTLogger.h"
#import "OCTLogLevel.h"
#import "OCTBlockPlugin.h"
#import "OCTCSSInjectionPlugin.h"
#import "OCTLogPlugin.h"
#import "OCTWebViewBridge.h"
#import "OCTWebViewPlugin.h"
#import "OCTWebViewPluginInjector.h"

FOUNDATION_EXPORT double OCTWebViewBridgeVersionNumber;
FOUNDATION_EXPORT const unsigned char OCTWebViewBridgeVersionString[];

