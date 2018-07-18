//
//  TKTypeEncoding.m
//  Pods-TKRuntime_Example
//
//  Created by zhengxianda on 2018/7/17.
//

#import "TKTypeEncoding.h"

@implementation TKTypeEncoding

+ (TKTypeEncoding *)character{
    return (TKTypeEncoding *)@"c";
}
+ (TKTypeEncoding *)integer{
    return (TKTypeEncoding *)@"i";
}
+ (TKTypeEncoding *)shortint{
    return (TKTypeEncoding *)@"s";
}
+ (TKTypeEncoding *)longint{
    return (TKTypeEncoding *)@"l";
}
+ (TKTypeEncoding *)longlongint{
    return (TKTypeEncoding *)@"q";
}
+ (TKTypeEncoding *)unsignedchar{
    return (TKTypeEncoding *)@"C";
}
+ (TKTypeEncoding *)unsignedint{
    return (TKTypeEncoding *)@"I";
}
+ (TKTypeEncoding *)unsignedshort{
    return (TKTypeEncoding *)@"S";
}
+ (TKTypeEncoding *)unsignedlong{
    return (TKTypeEncoding *)@"L";
}
+ (TKTypeEncoding *)unsignedlonglong{
    return (TKTypeEncoding *)@"Q";
}
+ (TKTypeEncoding *)unsignedfloat{
    return (TKTypeEncoding *)@"f";
}
+ (TKTypeEncoding *)unsigneddouble{
    return (TKTypeEncoding *)@"d";
}
+ (TKTypeEncoding *)boolean{
    return (TKTypeEncoding *)@"B";
}
+ (TKTypeEncoding *)voids{
    return (TKTypeEncoding *)@"v";
}
+ (TKTypeEncoding *)string{
    return (TKTypeEncoding *)@"*";
}
+ (TKTypeEncoding *)object{
    return (TKTypeEncoding *)@"@";
}
+ (TKTypeEncoding *)classes{
    return (TKTypeEncoding *)@"#";
}
+ (TKTypeEncoding *)selector{
    return (TKTypeEncoding *)@":";
}
+ (TKTypeEncoding *)arrayWith:(TKTypeEncoding *)type count:(NSInteger)count{
    return (TKTypeEncoding *)[NSString stringWithFormat:@"[%d%@]", (int)count, type];
}
+ (TKTypeEncoding *)structureWith:(NSString *)name values:(NSArray<TKTypeEncoding *> *)values{
    
    return (TKTypeEncoding *)[NSString stringWithFormat:@"{%@=%@}", name, [values componentsJoinedByString:@""]];
}
+ (TKTypeEncoding *)unionsWith:(NSString *)name values:(NSArray<TKTypeEncoding *> *)values{
    return (TKTypeEncoding *)[NSString stringWithFormat:@"{%@=%@}", name, [values componentsJoinedByString:@""]];
}
+ (TKTypeEncoding *)typepointWith:(TKTypeEncoding *)type{
    return (TKTypeEncoding *)[NSString stringWithFormat:@"^%@", type];
}
+ (TKTypeEncoding *)bnum{
    return (TKTypeEncoding *)@"bnum";
}
+ (TKTypeEncoding *)unknown{
    return (TKTypeEncoding *)@"?";
}

#pragma mark - ArgumentsDecorate

+ (TKTypeEncoding *)consts{
    return (TKTypeEncoding *)@"r";
}
+ (TKTypeEncoding *)ins{
    return (TKTypeEncoding *)@"n";
}
+ (TKTypeEncoding *)inouts{
    return (TKTypeEncoding *)@"N";
}
+ (TKTypeEncoding *)outs{
    return (TKTypeEncoding *)@"o";
}
+ (TKTypeEncoding *)bycopys{
    return (TKTypeEncoding *)@"O";
}
+ (TKTypeEncoding *)byrefs{
    return (TKTypeEncoding *)@"R";
}
+ (TKTypeEncoding *)oneways{
    return (TKTypeEncoding *)@"V";
}

#pragma mark - PropertyDecorate

+ (TKTypeEncoding *)atomic{
    return (TKTypeEncoding *)@"";
}
+ (TKTypeEncoding *)nonatomic{
    return (TKTypeEncoding *)@"N";
}

+ (TKTypeEncoding *)assign{
    return (TKTypeEncoding *)@"";
}
+ (TKTypeEncoding *)weak{
    return (TKTypeEncoding *)@"W";
}
+ (TKTypeEncoding *)copy{
    return (TKTypeEncoding *)@"C";
}
+ (TKTypeEncoding *)retain{
    return (TKTypeEncoding *)@"&";
}
+ (TKTypeEncoding *)strong{
    return (TKTypeEncoding *)@"&";
}

+ (TKTypeEncoding *)readwrite{
    return (TKTypeEncoding *)@"";
}
+ (TKTypeEncoding *)readonly{
    return (TKTypeEncoding *)@"R";
}

@end
