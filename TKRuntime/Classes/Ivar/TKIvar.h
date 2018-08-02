//
//  TKIvar.h
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/30.
//

#import <Foundation/Foundation.h>

#import "TKEncoding.h"

#import <objc/runtime.h>

@interface TKIvar : NSObject

@property(nonatomic, assign) Ivar ivar;


@property(nonatomic, strong) NSString * name;
@property(nonatomic, strong) TKEncoding * type;


- (instancetype)initWithIvar:(Ivar)ivar;

- (instancetype)initWithName:(NSString *)name
                        type:(TKEncoding *)type;

@end
