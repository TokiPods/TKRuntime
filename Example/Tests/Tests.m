//
//  TKRuntimeTests.m
//  TKRuntimeTests
//
//  Created by zhengxianda on 07/16/2018.
//  Copyright (c) 2018 zhengxianda. All rights reserved.
//

#import "Target.h"
#import "Templet.h"

#import <TKRuntime/NSObject+TKObjCRuntime.h>

SPEC_BEGIN(InitialTests)

describe(@"My initial tests", ^{

    context(@"Class", ^{
        NSString *className = @"NewClass";
        NSString *stringName = @"string";
        NSString *integerName = @"integer";
        
        Class superClass = [NSObject class];
        TKClass *cls = [[TKClass alloc] initWithName:className superClass:superClass];
        Class newClass = [NSObject addClass:cls];
        
        TKIvar *stringIvar = [[TKIvar alloc] initWithName:stringName type:[TKEncoding objectWithClass:[NSString class]]];
        TKIvar *integerIvar = [[TKIvar alloc] initWithName:integerName type:[TKEncoding integer]];
        [newClass addIvar:stringIvar];
        [newClass addIvar:integerIvar];
        
        TKProperty * stringProperty = [[TKProperty alloc] initWithName:stringName type:TKEncoding.string ownership:@[TKEncoding.nonatomic, TKEncoding.strong]];
        TKProperty * intProperty = [[TKProperty alloc] initWithName:integerName type:TKEncoding.integer ownership:@[TKEncoding.nonatomic, TKEncoding.assign]];
        [newClass addProperty:stringProperty];
        [newClass addProperty:intProperty];
        
        [newClass addSynthesizeMethod:stringName];
        [newClass addSynthesizeMethod:integerName];
        
        [NSObject registerClass:newClass];
        id instance = [[newClass alloc] init];
        
        it(@"check instance type", ^{
            [[@([instance isKindOfClass:NSClassFromString(className)]) should] beYes];
        });
        
        it(@"check ivar", ^{
            NSLog(@"%@", [newClass getIvarList]);
            
            //NSObject
            NSString * stringValue = @"Yahaha";
            
            SEL setStringSel = NSSelectorFromString(@"setString:");
            void(*setString)(id, SEL, NSString*) = (void(*)(id, SEL, NSString*))[instance methodForSelector:setStringSel];
            setString(instance, setStringSel, stringValue);
            
            SEL stringSel = NSSelectorFromString(@"string");
            NSString*(*string)(id, SEL) = (NSString*(*)(id, SEL))[instance methodForSelector:stringSel];
            NSString * stringResult = string(instance, stringSel);
            
            [[@([stringResult isEqualToString:stringValue]) should] beYes];
            
            //integer
            int integerValue = 512;
            
            SEL setIntegerSel = NSSelectorFromString(@"setInteger:");
            void(*setInteger)(id, SEL, int) = (void(*)(id, SEL, int))[instance methodForSelector:setIntegerSel];
            setInteger(instance, setIntegerSel, integerValue);
            
            SEL integerSel = NSSelectorFromString(@"integer");
            int(*integer)(id, SEL) = (int(*)(id, SEL))[instance methodForSelector:integerSel];
            int integerResult = integer(instance, integerSel);
            
            [[@(integerResult == integerValue) should] beYes];
        });
    });
    
  context(@"Property", ^{
    
      NSString *stringName = @"string";
      NSString *integerName = @"integer";
      NSString *setStringName = @"setString:";
      NSString *setIntegerName = @"setInteger:";
      
      TKProperty *string = [[Templet class] property:stringName];
      TKProperty *integer = [[Templet class] property:integerName];
      
      it(@"add property and Synthesize", ^{
          [[@([[Target class] addProperty:string]) should] beYes];
          [[@([[Target class] addTempletSynthesizeMethod:string.name from:[Templet class]]) should] beYes];
          [[@([[Target class] addProperty:integer]) should] beYes];
          [[@([[Target class] addTempletSynthesizeMethod:integer.name from:[Templet class]]) should] beYes];
      });
      
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
          TKMethod *targetGetString = [[Target class] method:stringName];
          TKMethod *templetGetString = [[Templet class] method:stringName];
          
          [[@(targetGetString.imp == templetGetString.imp) should] beYes];
          [[@([targetGetString.returnType isEqualToString:templetGetString.returnType]) should] beYes];
          for (NSInteger i = 0; i < templetGetString.argumentTypes.count; i++) {
              [[@([targetGetString.argumentTypes containsObject:templetGetString.argumentTypes[i]]) should] beYes];
          }
          
          TKMethod *targetGetInteger = [[Target class] method:integerName];
          TKMethod *templetGetInteger = [[Templet class] method:integerName];
          
          [[@(targetGetInteger.imp == templetGetInteger.imp) should] beYes];
          [[@([targetGetInteger.returnType isEqualToString:templetGetInteger.returnType]) should] beYes];
          for (NSInteger i = 0; i < templetGetInteger.argumentTypes.count; i++) {
              [[@([targetGetInteger.argumentTypes containsObject:templetGetInteger.argumentTypes[i]]) should] beYes];
          }
      });
      
      it(@"check setter method", ^{
          TKMethod *targetSetString = [[Target class] method:setStringName];
          TKMethod *templetSetString = [[Templet class] method:setStringName];
          
          [[@(targetSetString.imp == templetSetString.imp) should] beYes];
          [[@([targetSetString.returnType isEqualToString:templetSetString.returnType]) should] beYes];
          for (NSInteger i = 0; i < templetSetString.argumentTypes.count; i++) {
              [[@([targetSetString.argumentTypes containsObject:templetSetString.argumentTypes[i]]) should] beYes];
          }
          
          TKMethod *targetSetInteger = [[Target class] method:setIntegerName];
          TKMethod *templetSetInteger = [[Templet class] method:setIntegerName];
          
          [[@(targetSetInteger.imp == templetSetInteger.imp) should] beYes];
          [[@([targetSetInteger.returnType isEqualToString:templetSetInteger.returnType]) should] beYes];
          for (NSInteger i = 0; i < templetSetInteger.argumentTypes.count; i++) {
              [[@([targetSetInteger.argumentTypes containsObject:templetSetInteger.argumentTypes[i]]) should] beYes];
          }
      });
  });
  
});

SPEC_END

