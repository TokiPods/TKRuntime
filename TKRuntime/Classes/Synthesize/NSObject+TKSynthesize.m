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
    
    TKIvar *ivar = [self ivar:[NSString stringWithUTF8String:name]];
    if ([ivar.type hasPrefix:TKEncoding.object] || [ivar.type hasPrefix:TKEncoding.classes]) {
        flag &= class_addMethod(self, NSSelectorFromString([NSString stringWithUTF8String:name]), (IMP)getter, "@@:");
        flag &= class_addMethod(self, NSSelectorFromString([NSString stringWithFormat:@"set%@:", [[NSString stringWithUTF8String:name] uppercaseHeadString]]), (IMP)setter, "v@:@");
    }else{
        flag &= class_addMethod(self, NSSelectorFromString([NSString stringWithUTF8String:name]), (IMP)__getter, "@@:");
        flag &= class_addMethod(self, NSSelectorFromString([NSString stringWithFormat:@"set%@:", [[NSString stringWithUTF8String:name] uppercaseHeadString]]), (IMP)__setter, "v@:@");
    }
    
    
    return flag;
}

int __getter(id object, SEL sel) {
    NSString *var = NSStringFromSelector(sel);
    TKIvar * ivar = [[object class] ivar:var];
    Ivar _ivar = ivar.ivar;
    NSValue *value = object_getIvar(object, _ivar);
    int output;
    [value getValue:&output];
    return output;
}

void __setter(id object, SEL sel, int newValue) {
    NSString *var = NSStringFromSelector(sel);
    var = [[var substringWithRange:NSMakeRange(3, var.length - 4)] lowercaseHeadString];
    TKIvar * ivar = [[object class] ivar:var];
    Ivar _ivar = ivar.ivar;
    int *p = &newValue;
    NSValue *value = [[NSValue alloc] initWithBytes:p objCType:@encode(int)];
    object_setIvarWithStrongDefault(object, _ivar, value);
}

id getter(id object, SEL sel) {
    NSString *var = NSStringFromSelector(sel);
    TKIvar * ivar = [[object class] ivar:var];
    id value = object_getIvar(object, ivar.ivar);
    return value;
}

void setter(id object, SEL sel, id newValue) {
    NSString *var = NSStringFromSelector(sel);
    var = [[var substringWithRange:NSMakeRange(3, var.length - 4)] lowercaseHeadString];
    TKIvar * ivar = [[object class] ivar:var];
    object_setIvarWithStrongDefault(object, ivar.ivar, newValue);
}

@end
