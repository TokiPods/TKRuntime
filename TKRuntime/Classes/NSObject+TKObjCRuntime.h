//
//  NSObject+TKObjCRuntime.h
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/18.
//

#import <Foundation/Foundation.h>

#import "NSObject+TKClass.h"
#import "NSObject+TKIvar.h"
#import "NSObject+TKMethod.h"
#import "NSObject+TKProperty.h"
#import "NSObject+TKSynthesize.h"

#define TK_Types(...) __VA_ARGS__
#define TK_Atguments(...) __VA_ARGS__

#define TK_Perfom(instance, selectorName, returnType) \
({\
    SEL sel = NSSelectorFromString(selectorName);\
    returnType (*__func##selectorName)(id, SEL) = (returnType (*)(id, SEL))[instance methodForSelector:sel];\
    __func##selectorName(instance, sel);\
});

#define TK_PerfomWithObject(instance, selectorName, returnType, TK_Types, TK_Atguments) \
({\
    SEL sel = NSSelectorFromString(selectorName);\
    returnType (*__func##selectorName)(id, SEL, TK_Types) = (returnType (*)(id, SEL, TK_Types))[instance methodForSelector:sel];\
    __func##selectorName(instance, sel, TK_Atguments);\
});

@interface NSObject (ObjCRuntime)

@end
