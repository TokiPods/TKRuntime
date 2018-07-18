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

#import "NSObject+Method.h"
#import "TKMethod.h"
#import "NSObject+Property.h"
#import "TKProperty.h"
#import "NSObject+Synthesize.h"
#import "TKEncoding.h"
#import "NSString+HeadCharacter.h"

FOUNDATION_EXPORT double TKRuntimeVersionNumber;
FOUNDATION_EXPORT const unsigned char TKRuntimeVersionString[];

