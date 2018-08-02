//
//  NSObject+TKSynthesize.h
//  TKRuntime
//
//  Created by zhengxianda on 2018/7/18.
//

#import <Foundation/Foundation.h>

@interface NSObject (SynthesizeTemplet)

+ (BOOL)addTempletSynthesizeMethod:(NSString *)name from:(Class)baseClass;

+ (BOOL)addSynthesizeMethod:(NSString *)name;

@end
