//
//  NSObject+TKClass.h
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/30.
//

#import <Foundation/Foundation.h>

#import "TKClass.h"

@interface NSObject (TKClass)

+ (Class)addClass:(TKClass *)classes;

+ (void)registerClass:(Class)cls;

@end
