//
//  TKEncoding.m
//  Pods-TKRuntime_Example
//
//  Created by zhengxianda on 2018/7/17.
//

#import "TKEncoding.h"

@implementation TKEncoding

#pragma mark - Method

+ (NSString *)consts{
    return @"r";
}
+ (NSString *)ins{
    return @"n";
}
+ (NSString *)inouts{
    return @"N";
}
+ (NSString *)outs{
    return @"o";
}
+ (NSString *)bycopys{
    return @"O";
}
+ (NSString *)byrefs{
    return @"R";
}
+ (NSString *)oneways{
    return @"V";
}

#pragma mark - Ownership

+ (NSString *)atomic{
    return @"";
}
+ (NSString *)nonatomic{
    return @"N";
}

+ (NSString *)assign{
    return @"";
}
+ (NSString *)weak{
    return @"W";
}
+ (NSString *)copy{
    return @"C";
}
+ (NSString *)retain{
    return @"&";
}
+ (NSString *)strong{
    return @"&";
}

+ (NSString *)readwrite{
    return @"";
}
+ (NSString *)readonly{
    return @"R";
}

@end
