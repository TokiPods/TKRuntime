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

#import "NSObject+TKClass.h"
#import "TKClass.h"
#import "NSObject+TKIvar.h"
#import "TKIvar.h"
#import "NSObject+TKMethod.h"
#import "TKMethod.h"
#import "NSObject+TKObjCRuntime.h"
#import "NSObject+TKProperty.h"
#import "TKProperty.h"
#import "NSObject+TKSynthesize.h"
#import "TKEncoding.h"
#import "NSString+TKHeadCharacter.h"

FOUNDATION_EXPORT double TKRuntimeVersionNumber;
FOUNDATION_EXPORT const unsigned char TKRuntimeVersionString[];

