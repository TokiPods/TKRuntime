//
//  NSObject+TKProperty.h
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/18.
//

#import <Foundation/Foundation.h>

#import "TKProperty.h"

@interface NSObject (Property)

+ (BOOL)addProperty:(TKProperty *)property;

+ (NSArray<TKProperty *> *)getPropertyList;
+ (TKProperty *)property:(NSString *)name;

@end
