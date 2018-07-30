//
//  TKClass.h
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/30.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>

@interface TKClass : NSObject

@property(nonatomic, strong) NSString * name;
@property(nonatomic, strong) Class superClass;

- (instancetype)initWithName:(NSString *)name
                  superClass:(Class)superClass;

@end
