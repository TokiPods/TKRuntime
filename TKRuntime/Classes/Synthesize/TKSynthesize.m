//
//  TKSynthesize.m
//  Kiwi
//
//  Created by zhengxianda on 2018/8/3.
//

#import "TKSynthesize.h"

@implementation TKSynthesize

- (instancetype)initWithName:(NSString *)name getterBlock:(id)getterBlock setterBlock:(id)setterBlock{
    self = [super init];
    if (self) {
        self.name = name;
        self.getter = getterBlock;
        self.setter = setterBlock;
    }
    return self;
}

@end
