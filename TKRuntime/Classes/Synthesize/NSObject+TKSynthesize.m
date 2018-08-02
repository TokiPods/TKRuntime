//
//  NSObject+TKSynthesize.m
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/18.
//

#import "NSObject+TKSynthesize.h"

#import "NSString+TKHeadCharacter.h"
#import "NSObject+TKMethod.h"
#import "NSObject+TKIvar.h"

#import <objc/runtime.h>

@implementation NSObject (SynthesizeTemplet)

+ (BOOL)addTempletSynthesizeMethod:(NSString *)name from:(Class)baseClass{
    return [self addTempletSynthesizeMethodWithName:[name UTF8String] from:baseClass];
}
+ (BOOL)addTempletSynthesizeMethodWithName:(const char *)name from:(Class)baseClass{
    BOOL flag = YES;
    
    NSString * getter = [NSString stringWithUTF8String:name];
    NSString * setter = [NSString stringWithFormat:@"set%@:", [getter uppercaseHeadString]];
    
    TKMethod * methodGetter;
    TKMethod * methodSetter;
    NSArray<TKMethod *> * methodList = [baseClass getMethodList];
    for (TKMethod *method in methodList) {
        if ([method.name isEqualToString:getter]) {
            methodGetter = method;
        }
        if ([method.name isEqualToString:setter]) {
            methodSetter = method;
        }
    }
    
    if (methodGetter && methodSetter) {
        flag &= [self addMethod:methodGetter];
        flag &= [self addMethod:methodSetter];
        return flag;
    }else{
        return NO;
    }
}

+ (BOOL)addSynthesizeMethod:(NSString *)name{
    return [self addSynthesizeMethodWithName:[name UTF8String]];
}
+ (BOOL)addSynthesizeMethodWithName:(const char *)name{
    BOOL flag = YES;
    
    flag &= class_addMethod(self, NSSelectorFromString([NSString stringWithUTF8String:name]), (IMP)getter, "@@:");
    flag &= class_addMethod(self, NSSelectorFromString([NSString stringWithFormat:@"set%@:", [[NSString stringWithUTF8String:name] uppercaseHeadString]]), (IMP)setter, "v@:@");
    return flag;
}

id getter(id object, SEL sel) {
    NSString *var = NSStringFromSelector(sel);
    TKIvar * ivar = [[object class] ivar:var];
    return object_getIvar(object, ivar.ivar);
}

void setter(id object, SEL sel, id newValue) {
    NSString *var = NSStringFromSelector(sel);
    var = [[var substringWithRange:NSMakeRange(3, var.length - 4)] lowercaseHeadString];
    TKIvar * ivar = [[object class] ivar:var];
    object_setIvar(object, ivar.ivar, newValue);
}

@end
