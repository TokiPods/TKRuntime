//
//  NSObject+Method.m
//  Kiwi
//
//  Created by zhengxianda on 2018/7/17.
//

#import "NSObject+Method.h"

@implementation NSObject (Method)

+ (BOOL)addMethod:(TKMethod *)method{
    SEL sel = NSSelectorFromString(method.name);
    IMP imp = method.imp;
    const char *types = [[[@[method.returnType, TKEncoding.object, TKEncoding.selector]
                           arrayByAddingObjectsFromArray:method.argumentTypes]
                          componentsJoinedByString:@""]
                         UTF8String];
    
    NSArray<TKMethod *> * localMethodList = [self getMethodList];
    for (TKMethod *localMethod in localMethodList) {
        if ([localMethod.name isEqualToString:method.name]) {
            return class_replaceMethod(self, sel, imp, types);
        }
    }
    return class_addMethod(self, sel, imp, types);
}

+ (NSArray<TKMethod *> *)getMethodList{
    NSMutableArray<TKMethod *> *methodList = [NSMutableArray array];
    
    unsigned int outCount;
    Method *methods = class_copyMethodList(self, &outCount);
    for (int i = 0; i < outCount; i++) {
        Method method = methods[i];
        [methodList addObject:[[TKMethod alloc] initWithMethod:method]];
    }
    return [methodList copy];
}

@end
