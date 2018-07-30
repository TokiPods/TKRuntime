
//
//  TKClass.m
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/30.
//

#import "TKClass.h"

@implementation TKClass

- (instancetype)initWithName:(NSString *)name
                  superClass:(Class)superClass{
    self = [super init];
    if (self) {
        self.name = name;
        self.superClass = superClass;
    }
    return self;
}

@end
