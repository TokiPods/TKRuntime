//
//  TKIvar.m
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/30.
//

#import "TKIvar.h"

@implementation TKIvar

- (instancetype)initWithIvar:(Ivar)ivar{
    self = [super init];
    if (self) {
        self.ivar = ivar;
        
        self.name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        self.type = (TKEncoding *)[NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                        type:(TKEncoding *)type{
    self = [super init];
    if (self) {
        self.name = name;
        self.type = type;
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"TKIvar{name:%@, type:%@}",
            self.name,
            self.type];
}

@end
