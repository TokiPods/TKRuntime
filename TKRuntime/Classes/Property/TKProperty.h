//
//  TKProperty.h
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/17.
//

#import <Foundation/Foundation.h>

#import "TKEncoding.h"

#import <objc/runtime.h>

@interface TKProperty : NSObject

@property(nonatomic, assign, readonly, nullable) objc_property_t property;

@property(nonatomic, strong, readonly) NSString * name;
@property(nonatomic, strong, readonly) NSString * type;
@property(nonatomic, strong, readonly) NSArray<NSString *> * ownership;

- (instancetype)initWithProperty:(objc_property_t)property;
- (instancetype)initWithName:(NSString *)name type:(NSString *)type ownership:(NSArray<NSString *> *)ownership;

@end
