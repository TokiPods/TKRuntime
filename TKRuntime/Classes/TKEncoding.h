//
//  TKEncoding.h
//  Pods-TKRuntime_Example
//
//  Created by zhengxianda on 2018/7/17.
//

#import <Foundation/Foundation.h>

@interface TKEncoding : NSString

@end

@interface TKEncoding (Type)

+ (TKEncoding *)character;
+ (TKEncoding *)integer;
+ (TKEncoding *)shortint;
+ (TKEncoding *)longint;
+ (TKEncoding *)longlongint;

+ (TKEncoding *)unsignedchar;
+ (TKEncoding *)unsignedint;
+ (TKEncoding *)unsignedshort;
+ (TKEncoding *)unsignedlong;
+ (TKEncoding *)unsignedlonglong;
+ (TKEncoding *)unsignedfloat;
+ (TKEncoding *)unsigneddouble;

+ (TKEncoding *)boolean;
+ (TKEncoding *)voids;
+ (TKEncoding *)string;
+ (TKEncoding *)object;
+ (TKEncoding *)objectWith:(Class)cls;
+ (TKEncoding *)classes;
+ (TKEncoding *)selector;

+ (TKEncoding *)arrayWith:(TKEncoding *)type count:(NSInteger)count;
+ (TKEncoding *)structureWith:(NSString *)name values:(NSArray<TKEncoding *> *)values;
+ (TKEncoding *)unionsWith:(NSString *)name values:(NSArray<TKEncoding *> *)values;

+ (TKEncoding *)typepointWith:(TKEncoding *)type;

+ (TKEncoding *)bnum;
+ (TKEncoding *)unknown;

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
