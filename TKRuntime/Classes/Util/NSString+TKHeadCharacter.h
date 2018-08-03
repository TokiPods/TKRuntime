//
//  NSString+TKHeadCharacter.h
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/18.
//

#import <Foundation/Foundation.h>

@interface NSString (HeadCharacter)

- (NSString *)uppercaseHeadString;
- (NSString *)lowercaseHeadString;

+ (NSString *)combine:(NSString *)string, ...NS_REQUIRES_NIL_TERMINATION;

@end
