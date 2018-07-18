//
//  NSObject+Synthesize.m
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/18.
//

#import "NSObject+Synthesize.h"

#import "NSString+HeadCharacter.h"
#import "NSObject+Method.h"

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

@end
