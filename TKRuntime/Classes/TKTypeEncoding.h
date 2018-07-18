//
//  TKTypeEncoding.h
//  Pods-TKRuntime_Example
//
//  Created by zhengxianda on 2018/7/17.
//

#import <Foundation/Foundation.h>

@interface TKTypeEncoding : NSString

+ (TKTypeEncoding *)character;
+ (TKTypeEncoding *)integer;
+ (TKTypeEncoding *)shortint;
+ (TKTypeEncoding *)longint;
+ (TKTypeEncoding *)longlongint;

+ (TKTypeEncoding *)unsignedchar;
+ (TKTypeEncoding *)unsignedint;
+ (TKTypeEncoding *)unsignedshort;
+ (TKTypeEncoding *)unsignedlong;
+ (TKTypeEncoding *)unsignedlonglong;
+ (TKTypeEncoding *)unsignedfloat;
+ (TKTypeEncoding *)unsigneddouble;

+ (TKTypeEncoding *)boolean;
+ (TKTypeEncoding *)voids;
+ (TKTypeEncoding *)string;
+ (TKTypeEncoding *)object;
+ (TKTypeEncoding *)classes;
+ (TKTypeEncoding *)selector;

+ (TKTypeEncoding *)arrayWith:(TKTypeEncoding *)type count:(NSInteger)count;
+ (TKTypeEncoding *)structureWith:(NSString *)name values:(NSArray<TKTypeEncoding *> *)values;
+ (TKTypeEncoding *)unionsWith:(NSString *)name values:(NSArray<TKTypeEncoding *> *)values;

+ (TKTypeEncoding *)typepointWith:(TKTypeEncoding *)type;

+ (TKTypeEncoding *)bnum;
+ (TKTypeEncoding *)unknown;

@end

@interface TKTypeEncoding (ArgumentsDecorate)

+ (TKTypeEncoding *)consts;
+ (TKTypeEncoding *)ins;
+ (TKTypeEncoding *)inouts;
+ (TKTypeEncoding *)outs;
+ (TKTypeEncoding *)bycopys;
+ (TKTypeEncoding *)byrefs;
+ (TKTypeEncoding *)oneways;

@end

@interface TKTypeEncoding (PropertyDecorate)

+ (TKTypeEncoding *) atomic;
+ (TKTypeEncoding *) nonatomic;
+ (TKTypeEncoding *) assign;
+ (TKTypeEncoding *) weak;
+ (TKTypeEncoding *) copy;
+ (TKTypeEncoding *) retain;
+ (TKTypeEncoding *) strong;
+ (TKTypeEncoding *) readwrite;
+ (TKTypeEncoding *) readonly;

@end
