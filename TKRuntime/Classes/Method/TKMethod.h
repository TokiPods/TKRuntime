//
//  TKMethod.h
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/17.
//

#import <Foundation/Foundation.h>

#import "TKTypeEncoding.h"

#import <objc/runtime.h>

@interface TKMethod : NSObject

@property(nonatomic, assign, readonly, nullable) Method method;

@property(nonatomic, strong, readonly) NSString * name;
@property(nonatomic, assign, readonly) IMP imp;
@property(nonatomic, strong, readonly) TKTypeEncoding * returnType;
@property(nonatomic, strong, readonly) NSArray<TKTypeEncoding *> * argumentTypes;

- (instancetype)initWithMethod:(Method)method;

- (instancetype)initWithName:(NSString *)name
                         imp:(IMP)imp
                  returnType:(TKTypeEncoding *)returnType
                  argumentTypes:(NSArray<TKTypeEncoding *> *)argumentTypes;

- (instancetype)initWithName:(NSString *)name
                   baseClass:(Class)baseClass
                    baseName:(NSString *)baseName
                  returnType:(TKTypeEncoding *)returnType
                  argumentTypes:(NSArray<TKTypeEncoding *> *)argumentTypes;

@end
