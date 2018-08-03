//
//  TKMethod.h
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/17.
//

#import <Foundation/Foundation.h>

#import "TKEncoding.h"

#import <objc/runtime.h>

@interface TKMethod : NSObject

@property(nonatomic, assign, readonly, nullable) Method method;

@property(nonatomic, strong, readonly) NSString * name;
@property(nonatomic, assign, readonly) IMP imp;
@property(nonatomic, strong, readonly) NSString * returnType;
@property(nonatomic, strong, readonly) NSArray<NSString *> * argumentTypes;

- (instancetype)initWithMethod:(Method)method;

- (instancetype)initWithName:(NSString *)name
                         imp:(IMP)imp
                  returnType:(NSString *)returnType
                  argumentTypes:(NSArray<NSString *> *)argumentTypes;

- (instancetype)initWithName:(NSString *)name
                   baseClass:(Class)baseClass
                    baseName:(NSString *)baseName
                  returnType:(NSString *)returnType
                  argumentTypes:(NSArray<NSString *> *)argumentTypes;

@end
