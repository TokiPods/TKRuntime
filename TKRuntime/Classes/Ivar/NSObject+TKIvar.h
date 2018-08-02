//
//  NSObject+TKIvar.h
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/30.
//

#import <Foundation/Foundation.h>

#import "TKIvar.h"

@interface NSObject (TKIvar)

+ (void)addIvar:(TKIvar *)ivar;

+ (NSArray<TKIvar *> *)getIvarList;
+ (TKIvar *)ivar:(NSString *)name;

@end
