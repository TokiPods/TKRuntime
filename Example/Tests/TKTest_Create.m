//
//  TKTest_Create.m
//  TKRuntime_Tests
//
//  Created by zhengxianda on 2018/8/3.
//  Copyright © 2018年 zhengxianda. All rights reserved.
//

#import <TKRuntime/NSObject+TKObjCRuntime.h>

SPEC_BEGIN(Test_Create)

describe(@"Create", ^{
    NSString *className = @"NewClass";
    
    NSString *objectValue = @"Yahaha";
    NSString *objectName = @"object";
    NSString *setObjectSelectorName = @"setObject:";
    NSString *getObjectSelectorName = @"object";
    
    int integerValue = 512;
    NSString *integerName = @"integer";
    NSString *setIntegerSelectorName = @"setInteger:";
    NSString *getIntegerSelectorName = @"integer";
    
    char * stringValue = "Yahaha";
    NSString *stringName = @"string";
    NSString *setStringSelectorName = @"setString:";
    NSString *getStringSelectorName = @"string";
    
    struct Struct {
        double value1;
        double value2;
    };

    struct Struct structureValue = {1.0, 2.0};
    NSString *structureName = @"structure";
    NSString *setStructureSelectorName = @"setStructure:";
    NSString *getStructureSelectorName = @"structure";
    
    context(@"Create New Class, Add Ivar & Property & Method", ^{
        Class superClass = [NSObject class];
        TKClass *cls = [[TKClass alloc] initWithName:className superClass:superClass];
        Class newClass = [NSObject addClass:cls];
        
        TKIvar *objectIvar = [[TKIvar alloc] initWithName:objectName type:TK_Encode(NSString *)];
        [newClass addIvar:objectIvar];
        TKProperty * objectProperty = [[TKProperty alloc] initWithName:objectName type:TK_Encode(NSString *) ownership:@[TKEncoding.nonatomic, TKEncoding.strong]];
        [newClass addProperty:objectProperty];
        [newClass addSynthesize:TK_Synthesize(objectName, NSString *)];
        
        TKIvar *integerIvar = [[TKIvar alloc] initWithName:integerName type:TK_Encode(int)];
        [newClass addIvar:integerIvar];
        TKProperty * integerProperty = [[TKProperty alloc] initWithName:integerName type:TK_Encode(int) ownership:@[TKEncoding.nonatomic, TKEncoding.assign]];
        [newClass addProperty:integerProperty];
        [newClass addSynthesize:TK_Synthesize(integerName, int)];
        
        TKIvar *stringIvar = [[TKIvar alloc] initWithName:stringName type:TK_Encode(char*)];
        [newClass addIvar:stringIvar];
        TKProperty * stringProperty = [[TKProperty alloc] initWithName:stringName type:TK_Encode(char*) ownership:@[TKEncoding.nonatomic, TKEncoding.assign]];
        [newClass addProperty:stringProperty];
        [newClass addSynthesize:TK_Synthesize(stringName, char*)];
        
        TKIvar *structureIvar = [[TKIvar alloc] initWithName:structureName type:TK_Encode(struct Struct)];
        [newClass addIvar:structureIvar];
        TKProperty * structureProperty = [[TKProperty alloc] initWithName:structureName type:TK_Encode(struct Struct) ownership:@[TKEncoding.nonatomic, TKEncoding.assign]];
        [newClass addProperty:structureProperty];
        [newClass addSynthesize:TK_Synthesize(structureName, struct Struct)];
        
        [NSObject registerClass:newClass];
        id instance = [[newClass alloc] init];
        
        it(@"check instance type", ^{
            [[@([instance isKindOfClass:NSClassFromString(className)]) should] beYes];
        });
        
        it(@"check ivar", ^{
            TK_PerfomWithObject(instance, setObjectSelectorName, void, TK_Types(NSString *), TK_Atguments(objectValue));
            NSString *objectResult = TK_Perfom(instance, getObjectSelectorName, NSString *);
            [[@([objectResult isEqualToString:objectValue]) should] beYes];
            
            TK_PerfomWithObject(instance, setIntegerSelectorName, void, TK_Types(int), TK_Atguments(integerValue));
            int integerResult = TK_Perfom(instance, getIntegerSelectorName, int);
            [[@(integerResult == integerValue) should] beYes];
            
            TK_PerfomWithObject(instance, setStringSelectorName, void, TK_Types(char*), TK_Atguments(stringValue));
            char* stringResult = TK_Perfom(instance, getStringSelectorName, char*);
            [[@(stringResult == stringValue) should] beYes];
            
            TK_PerfomWithObject(instance, setStructureSelectorName, void, TK_Types(struct Struct), TK_Atguments(structureValue));
            struct Struct structureResult = TK_Perfom(instance, getStructureSelectorName, struct Struct);
            [[@(structureResult.value1 == structureValue.value1) should] beYes];
            [[@(structureResult.value2 == structureValue.value2) should] beYes];
        });
    });
  
});

SPEC_END

