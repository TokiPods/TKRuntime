//
//  TKSynthesize.h
//  Kiwi
//
//  Created by zhengxianda on 2018/8/3.
//

#import <Foundation/Foundation.h>

#define TK_Synthesize(Name, Type) \
({\
[[TKSynthesize alloc]  initWithName:Name\
                        getterBlock:^(id object){\
                            NSString *var = Name;\
                            TKIvar * ivar = [[object class] ivar:var];\
                            Ivar _ivar = ivar.ivar;\
                            NSValue *value = object_getIvar(object, _ivar);\
                            Type output;\
                            [value getValue:&output];\
                            return output;\
                        }\
                        setterBlock:^(id object, Type newValue){\
                            NSString *var = Name;\
                            TKIvar * ivar = [[object class] ivar:var];\
                            Ivar _ivar = ivar.ivar;\
                            NSValue *value = [[NSValue alloc] initWithBytes:&newValue objCType:@encode(Type)];\
                            object_setIvarWithStrongDefault(object, _ivar, value);\
                        }];\
})

@interface TKSynthesize : NSObject

@property(nonatomic, strong) NSString * name;
@property(nonatomic, strong) id getter;
@property(nonatomic, strong) id setter;

- (instancetype)initWithName:(NSString *)name getterBlock:(id)getterBlock setterBlock:(id)setterBlock;

@end
