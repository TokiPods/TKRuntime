//
//  NSString+TKHeadCharacter.m
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/18.
//

#import "NSString+TKHeadCharacter.h"

@implementation NSString (HeadCharacter)

- (NSString *)uppercaseHeadString{
    return [[[self substringToIndex:1] uppercaseString] stringByAppendingString:[self substringFromIndex:1]];
}
- (NSString *)lowercaseHeadString{
    return [[[self substringToIndex:1] lowercaseString] stringByAppendingString:[self substringFromIndex:1]];
}

+ (NSString *)combine:(NSString *)string, ...NS_REQUIRES_NIL_TERMINATION {
    NSMutableString *result = [NSMutableString string];
    
    va_list args;
    va_start(args, string);
    
    if (string) {
        for (NSString * component = string; component != nil; component = va_arg(args, NSString *)) {
            [result appendString:component];
        }
    }
    
    va_end(args);
    return result;
}

@end
