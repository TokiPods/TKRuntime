//
//  TKProperty.m
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/17.
//

#import "TKProperty.h"

@interface TKProperty ()

@property(nonatomic, assign, nullable) objc_property_t property;

@property(nonatomic, strong) NSString * name;
@property(nonatomic, strong) NSString * type;
@property(nonatomic, strong) NSArray<NSString *> * ownership;

@end

@implementation TKProperty

- (instancetype)initWithProperty:(objc_property_t)property{
    self = [super init];
    if (self) {
        const char * propertyName = property_getName(property);
        const char * propertyAttributes = property_getAttributes(property);
        
        self.name = [NSString stringWithUTF8String:propertyName];
        
        NSArray<NSString *> *attributeList = [[NSString stringWithUTF8String:propertyAttributes]
                                              componentsSeparatedByString:@","];
        NSString *attributeType = attributeList.firstObject;
        self.type = [attributeType substringWithRange:
                     [attributeType containsString:@"T@\""] ?
                     NSMakeRange(3, attributeType.length-4) :
                     NSMakeRange(1, attributeType.length-1)];
        
        self.ownership = [[[attributeList mutableCopy] subarrayWithRange:NSMakeRange(1, attributeList.count - 2)] copy];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name type:(NSString *)type ownership:(NSArray<NSString *> *)ownership{
    self = [super init];
    if (self) {
        self.name = name;
        self.type = type;
        self.ownership = ownership;
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"TKProperty{name:%@, type:%@, ownership:(%@)}",
            self.name,
            self.type,
            [self.ownership componentsJoinedByString:@","]];
}

@end
