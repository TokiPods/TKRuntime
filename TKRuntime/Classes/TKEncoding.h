//
//  TKEncoding.h
//  Pods-TKRuntime_Example
//
//  Created by zhengxianda on 2018/7/17.
//

#import <Foundation/Foundation.h>

#define TK_Encode(Type) \
({\
[NSString stringWithUTF8String:@encode(Type)];\
})

#define TK_PropertyEncode(Type) \
({\
NSString * type = TK_Encode(Type);\
if ([type isEqualToString:@"@"]) {\
Type a;\
NSString * clsEncode = [NSString stringWithUTF8String:@encode(typeof(*a))];\
NSString * clsName = [[clsEncode substringToIndex:clsEncode.length - 3] substringFromIndex:1];\
type = [NSString stringWithFormat:@"@\"%@\"", clsName];\
}\
type;\
})

#define TK_SelectorEncode(returnType, ...)\
({\
[self combine:returnType, TK_Encode(id), TK_Encode(SEL), __VA_ARGS__, nil];\
})\

@interface TKEncoding : NSString

@end

@interface TKEncoding (Method)

+ (TKEncoding *)consts;
+ (TKEncoding *)ins;
+ (TKEncoding *)inouts;
+ (TKEncoding *)outs;
+ (TKEncoding *)bycopys;
+ (TKEncoding *)byrefs;
+ (TKEncoding *)oneways;

@end

@interface TKEncoding (Ownership)

+ (TKEncoding *) atomic;
+ (TKEncoding *) nonatomic;
+ (TKEncoding *) assign;
+ (TKEncoding *) weak;
+ (TKEncoding *) copy;
+ (TKEncoding *) retain;
+ (TKEncoding *) strong;
+ (TKEncoding *) readwrite;
+ (TKEncoding *) readonly;

@end
