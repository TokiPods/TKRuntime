//
//  TKTest_Copy.m
//  TKRuntime_Tests
//
//  Created by zhengxianda on 2018/8/3.
//  Copyright © 2018年 zhengxianda. All rights reserved.
//

#import <TKRuntime/NSObject+TKObjCRuntime.h>

#import "Target.h"
#import "Templet.h"

SPEC_BEGIN(Test_Copy)

describe(@"Copy", ^{
    NSString *stringName = @"string";
    NSString *setStringSelectorName = @"setString:";
    NSString *getStringSelectorName = @"string";
    
    NSString *integerName = @"integer";
    NSString *setIntegerSelectorName = @"setInteger:";
    NSString *getIntegerSelectorName = @"integer";
    
    context(@"Copy Property & Method", ^{
        TKProperty *string = [[Templet class] property:stringName];
        [[@([[Target class] addProperty:string]) should] beYes];
        [[@([[Target class] addTempletSynthesizeMethod:string.name from:[Templet class]]) should] beYes];
        
        TKProperty *integer = [[Templet class] property:integerName];
        [[@([[Target class] addProperty:integer]) should] beYes];
        [[@([[Target class] addTempletSynthesizeMethod:integer.name from:[Templet class]]) should] beYes];
        
        it(@"check property", ^{
            TKProperty *targetString = [[Target class] property:stringName];
            TKProperty *templetString = [[Templet class] property:stringName];
            
            [[@([targetString.type isEqualToString:templetString.type]) should] beYes];
            for (NSInteger i = 0; i < templetString.ownership.count; i++) {
                [[@([targetString.ownership containsObject:templetString.ownership[i]]) should] beYes];
            }
            
            TKProperty *targetInteger = [[Target class] property:integerName];
            TKProperty *templetInteger = [[Templet class] property:integerName];
            
            [[@([targetInteger.type isEqualToString:templetInteger.type]) should] beYes];
            for (NSInteger i = 0; i < templetInteger.ownership.count; i++) {
                [[@([targetInteger.ownership containsObject:templetInteger.ownership[i]]) should] beYes];
            }
        });
        
        it(@"check getter method", ^{
            TKMethod *targetGetString = [[Target class] method:getStringSelectorName];
            TKMethod *templetGetString = [[Templet class] method:getStringSelectorName];
            
            [[@(targetGetString.imp == templetGetString.imp) should] beYes];
            [[@([targetGetString.returnType isEqualToString:templetGetString.returnType]) should] beYes];
            for (NSInteger i = 0; i < templetGetString.argumentTypes.count; i++) {
                [[@([targetGetString.argumentTypes containsObject:templetGetString.argumentTypes[i]]) should] beYes];
            }
            
            TKMethod *targetGetInteger = [[Target class] method:getIntegerSelectorName];
            TKMethod *templetGetInteger = [[Templet class] method:getIntegerSelectorName];
            
            [[@(targetGetInteger.imp == templetGetInteger.imp) should] beYes];
            [[@([targetGetInteger.returnType isEqualToString:templetGetInteger.returnType]) should] beYes];
            for (NSInteger i = 0; i < templetGetInteger.argumentTypes.count; i++) {
                [[@([targetGetInteger.argumentTypes containsObject:templetGetInteger.argumentTypes[i]]) should] beYes];
            }
        });
        
        it(@"check setter method", ^{
            TKMethod *targetSetString = [[Target class] method:setStringSelectorName];
            TKMethod *templetSetString = [[Templet class] method:setStringSelectorName];
            
            [[@(targetSetString.imp == templetSetString.imp) should] beYes];
            [[@([targetSetString.returnType isEqualToString:templetSetString.returnType]) should] beYes];
            for (NSInteger i = 0; i < templetSetString.argumentTypes.count; i++) {
                [[@([targetSetString.argumentTypes containsObject:templetSetString.argumentTypes[i]]) should] beYes];
            }
            
            TKMethod *targetSetInteger = [[Target class] method:setIntegerSelectorName];
            TKMethod *templetSetInteger = [[Templet class] method:setIntegerSelectorName];
            
            [[@(targetSetInteger.imp == templetSetInteger.imp) should] beYes];
            [[@([targetSetInteger.returnType isEqualToString:templetSetInteger.returnType]) should] beYes];
            for (NSInteger i = 0; i < templetSetInteger.argumentTypes.count; i++) {
                [[@([targetSetInteger.argumentTypes containsObject:templetSetInteger.argumentTypes[i]]) should] beYes];
            }
        });
    });
    
});

SPEC_END

