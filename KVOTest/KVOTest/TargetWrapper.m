//
//  TargetWrapper.m
//  KVODemo
//
//  Created by liyuhong on 14-6-26.
//  Copyright (c) 2014年 liyuhong. All rights reserved.
//

#import "TargetWrapper.h"
#import "Target.h"

@implementation TargetWrapper

- (id)init:(Target *)aTarget
{
    self = [super init];
    if (nil != self) {
        _target = aTarget;
    }
    return self;
}

- (void)dealloc
{
    self.target = nil;
}

- (NSString *)information
{
#warning the difference between two methods???
//    return [[NSString alloc]initWithFormat:@"%d#%d",[_target grade],[_target age]];
    return [NSString stringWithFormat:@"%d#%d",[_target grade],[_target age]];
    
}

- (void)setInformation:(NSString *)information
{
    NSArray *array = [information componentsSeparatedByString:@"#"];
    [_target setValue:[array objectAtIndex:0] forKey:@"grade"];
    [_target setValue:[array objectAtIndex:1] forKey:@"age"];
}

//这两个方法用来告诉系统information属性依赖于其他的哪些属性
+ (NSSet *)keyPathsForValuesAffectingInformation
{
    NSSet *keyPaths = [NSSet setWithObjects:@"_target.age",@"_target.grade", nil];
    return keyPaths;
}

//+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key
//{
//    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
//    NSArray *moreKeyPaths = nil;
//    if ([key isEqualToString:@"information"]) {
//        moreKeyPaths = [NSArray arrayWithObjects:@"_target.age",@"_target.grade", nil];
//    }
//    if (moreKeyPaths) {
//        keyPaths = [keyPaths setByAddingObjectsFromArray:moreKeyPaths];
//    }
//    return keyPaths;
//}

@end
