//
//  NSString+HeadCharacter.m
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/18.
//

#import "NSString+HeadCharacter.h"

@implementation NSString (HeadCharacter)

- (NSString *)uppercaseHeadString{
    return [[[self substringToIndex:1] uppercaseString] stringByAppendingString:[self substringFromIndex:1]];
}
- (NSString *)lowercaseHeadString{
    return [[[self substringToIndex:1] lowercaseString] stringByAppendingString:[self substringFromIndex:1]];
}

@end
