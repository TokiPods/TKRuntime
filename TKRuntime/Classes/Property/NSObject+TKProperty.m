//
//  NSObject+TKProperty.m
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/18.
//

#import "NSObject+TKProperty.h"

@implementation NSObject (Property)

+ (BOOL)addProperty:(TKProperty *)property{
    return [self addPropertyWithName:property.name
                                type:property.type
                           ownership:property.ownership];
}

+ (BOOL)addPropertyWithName:(NSString *)name
                       type:(TKEncoding *)type
                  ownership:(NSArray<TKEncoding *> *)ownership{
    unsigned int propertyWonershipCount = (unsigned int)ownership.count;
    const char * propertyWonership[propertyWonershipCount];
    for (int i = 0; i < propertyWonershipCount; i ++) {
        propertyWonership[i] = [ownership[i] UTF8String];
    }
    
    return [self addPropertyWithName:[name UTF8String]
                                type:[type UTF8String]
                           ownership:propertyWonership
                      ownershipCount:propertyWonershipCount
                         backingivar:[[NSString stringWithFormat:@"_%@", name] UTF8String]];
}

+ (BOOL)addPropertyWithName:(const char *)name
                       type:(const char *)type
                  ownership:(const char * [])ownership
             ownershipCount:(unsigned int)ownershipCount
                backingivar:(const char *)backingivar{
    unsigned int attributeCount = ownershipCount + 2;
    objc_property_attribute_t attributes[attributeCount];
    
    objc_property_attribute_t attributeType = { "T", type};
    attributes[0] = attributeType;
    
    for (int i = 0; i < ownershipCount; i ++) {
        objc_property_attribute_t attributeOwnership = { ownership[i], "" };
        attributes[i+1] = attributeOwnership;
    }
    
    objc_property_attribute_t attributeName = { "V", backingivar};
    attributes[ownershipCount+1] = attributeName;
    
    return [self addPropertyWithName:name
                          attributes:attributes
                      attributeCount:attributeCount];
}

+ (BOOL)addPropertyWithName:(const char *)name
                 attributes:(objc_property_attribute_t [])attributes
             attributeCount:(unsigned int)attributeCount{
    return class_addProperty(self, name, attributes, attributeCount);
}

+ (NSArray<TKProperty *> *)getPropertyList{
    NSMutableArray<TKProperty *> *propertyList = [NSMutableArray array];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(self, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        [propertyList addObject:[[TKProperty alloc] initWithProperty:property]];
    }
    return [propertyList copy];
}

@end
