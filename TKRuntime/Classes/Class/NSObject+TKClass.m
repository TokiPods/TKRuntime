//
//  NSObject+TKClass.m
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/30.
//

#import "NSObject+TKClass.h"

@implementation NSObject (TKClass)

+ (Class)addClass:(TKClass *)classes{
    const char * className = [classes.name UTF8String];
    
    Class cls = objc_allocateClassPair(classes.superClass, className, 0);
    
    return cls;
}

+ (void)registerClass:(Class)cls{
    objc_registerClassPair(cls);
}

@end
