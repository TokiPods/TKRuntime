//
//  NSObject+Method.h
//  Kiwi
//
//  Created by zhengxianda on 2018/7/17.
//

#import <Foundation/Foundation.h>

#import "TKMethod.h"

@interface NSObject (Method)

+ (BOOL)addMethod:(TKMethod *)method;

+ (NSArray<TKMethod *> *)getMethodList;

@end
