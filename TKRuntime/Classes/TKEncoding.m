//
//  TKEncoding.m
//  Pods-TKRuntime_Example
//
//  Created by zhengxianda on 2018/7/17.
//

#import "TKEncoding.h"

@implementation TKEncoding

+ (TKEncoding *)character{
    return (TKEncoding *)@"c";
}
+ (TKEncoding *)integer{
    return (TKEncoding *)@"i";
}
+ (TKEncoding *)shortint{
    return (TKEncoding *)@"s";
}
+ (TKEncoding *)longint{
    return (TKEncoding *)@"l";
}
+ (TKEncoding *)longlongint{
    return (TKEncoding *)@"q";
}
+ (TKEncoding *)unsignedchar{
    return (TKEncoding *)@"C";
}
+ (TKEncoding *)unsignedint{
    return (TKEncoding *)@"I";
}
+ (TKEncoding *)unsignedshort{
    return (TKEncoding *)@"S";
}
+ (TKEncoding *)unsignedlong{
    return (TKEncoding *)@"L";
}
+ (TKEncoding *)unsignedlonglong{
    return (TKEncoding *)@"Q";
}
+ (TKEncoding *)unsignedfloat{
    return (TKEncoding *)@"f";
}
+ (TKEncoding *)unsigneddouble{
    return (TKEncoding *)@"d";
}
+ (TKEncoding *)boolean{
    return (TKEncoding *)@"B";
}
+ (TKEncoding *)voids{
    return (TKEncoding *)@"v";
}
+ (TKEncoding *)string{
    return (TKEncoding *)@"*";
}
+ (TKEncoding *)object{
    return (TKEncoding *)@"@";
}
+ (TKEncoding *)classes{
    return (TKEncoding *)@"#";
}
+ (TKEncoding *)selector{
    return (TKEncoding *)@":";
}
+ (TKEncoding *)arrayWith:(TKEncoding *)type count:(NSInteger)count{
    return (TKEncoding *)[NSString stringWithFormat:@"[%d%@]", (int)count, type];
}
+ (TKEncoding *)structureWith:(NSString *)name values:(NSArray<TKEncoding *> *)values{
    
    return (TKEncoding *)[NSString stringWithFormat:@"{%@=%@}", name, [values componentsJoinedByString:@""]];
}
+ (TKEncoding *)unionsWith:(NSString *)name values:(NSArray<TKEncoding *> *)values{
    return (TKEncoding *)[NSString stringWithFormat:@"{%@=%@}", name, [values componentsJoinedByString:@""]];
}
+ (TKEncoding *)typepointWith:(TKEncoding *)type{
    return (TKEncoding *)[NSString stringWithFormat:@"^%@", type];
}
+ (TKEncoding *)bnum{
    return (TKEncoding *)@"bnum";
}
+ (TKEncoding *)unknown{
    return (TKEncoding *)@"?";
}

#pragma mark - ArgumentsDecorate

+ (TKEncoding *)consts{
    return (TKEncoding *)@"r";
}
+ (TKEncoding *)ins{
    return (TKEncoding *)@"n";
}
+ (TKEncoding *)inouts{
    return (TKEncoding *)@"N";
}
+ (TKEncoding *)outs{
    return (TKEncoding *)@"o";
}
+ (TKEncoding *)bycopys{
    return (TKEncoding *)@"O";
}
+ (TKEncoding *)byrefs{
    return (TKEncoding *)@"R";
}
+ (TKEncoding *)oneways{
    return (TKEncoding *)@"V";
}

#pragma mark - PropertyDecorate

+ (TKEncoding *)atomic{
    return (TKEncoding *)@"";
}
+ (TKEncoding *)nonatomic{
    return (TKEncoding *)@"N";
}

+ (TKEncoding *)assign{
    return (TKEncoding *)@"";
}
+ (TKEncoding *)weak{
    return (TKEncoding *)@"W";
}
+ (TKEncoding *)copy{
    return (TKEncoding *)@"C";
}
+ (TKEncoding *)retain{
    return (TKEncoding *)@"&";
}
+ (TKEncoding *)strong{
    return (TKEncoding *)@"&";
}

+ (TKEncoding *)readwrite{
    return (TKEncoding *)@"";
}
+ (TKEncoding *)readonly{
    return (TKEncoding *)@"R";
}

@end
