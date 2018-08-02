//
//  NSObject+TKIvar.m
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/30.
//

#import "NSObject+TKIvar.h"

@implementation NSObject (TKIvar)

+ (void)addIvar:(TKIvar *)ivar{
    class_addIvar(self,
                  [[NSString stringWithFormat:@"_%@", ivar.name] UTF8String],
                  8,
                  log2(8),
                  [ivar.type UTF8String]);
}

+ (NSArray<TKIvar *> *)getIvarList{
    NSMutableArray<TKIvar *> * ivarList = [NSMutableArray array];
    
    unsigned int outCount;
    Ivar * ivars = class_copyIvarList(self, &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        [ivarList addObject:[[TKIvar alloc] initWithIvar:ivar]];
    }
    
    return [ivarList copy];
}

+ (TKIvar *)ivar:(NSString *)name{
    for (TKIvar * ivar in [self getIvarList]) {
        if ([ivar.name isEqualToString:[NSString stringWithFormat:@"_%@", name]]) {
            return ivar;
        }
    }
    return nil;
}

@end
