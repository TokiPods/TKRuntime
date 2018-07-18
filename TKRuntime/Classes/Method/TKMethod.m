//
//  TKMethod.m
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/17.
//

#import "TKMethod.h"

@interface TKMethod ()

@property(nonatomic, assign, nullable) Method method;

@property(nonatomic, assign) IMP imp;
@property(nonatomic, strong) NSString * name;
@property(nonatomic, strong) TKEncoding * returnType;
@property(nonatomic, strong) NSArray<TKEncoding *> * argumentTypes;

@end

@implementation TKMethod

- (instancetype)initWithMethod:(Method)method
{
    self = [super init];
    if (self) {
        self.method = method;
        
        SEL sel = method_getName(method);
        self.name = [NSString stringWithUTF8String:sel_getName(sel)];
        self.imp = [self methodForSelector:sel];
        self.returnType = (TKEncoding *)[NSString stringWithUTF8String:method_copyReturnType(method)];
        
        NSMutableArray<TKEncoding *> * argumentTypes = [NSMutableArray array];
        unsigned int count = method_getNumberOfArguments(method);
        for (int i = 0; i < count; i++) {
            [argumentTypes addObject:(TKEncoding *)[NSString stringWithUTF8String:method_copyArgumentType(method, i)]];
        }
        self.argumentTypes = [argumentTypes copy];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                  returnType:(TKEncoding *)returnType
               argumentTypes:(NSArray<TKEncoding *> *)argumentTypes{
    self = [super init];
    if (self) {
        self.name = name;
        self.returnType = returnType;
        self.argumentTypes = argumentTypes;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                         imp:(IMP)imp
                  returnType:(TKEncoding *)returnType
                  argumentTypes:(NSArray<TKEncoding *> *)argumentTypes{
    self = [self initWithName:name returnType:returnType argumentTypes:argumentTypes];
    if (self) {
        self.imp = imp;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                   baseClass:(Class)baseClass
                    baseName:(NSString *_Nullable)baseName
                  returnType:(TKEncoding *)returnType
                  argumentTypes:(NSArray<TKEncoding *> *)argumentTypes{
    self = [self initWithName:name returnType:returnType argumentTypes:argumentTypes];
    if (self) {
        self.imp = [[baseClass new] methodForSelector:NSSelectorFromString(baseName?:name)];
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"TKMethod{name:%@, returntype:%@, argumentTypes:(%@)}",
            self.name,
            self.returnType,
            [self.argumentTypes componentsJoinedByString:@","]];
}

@end
