//
//  Target.m
//  KVODemo
//
//  Created by liyuhong on 14-6-26.
//  Copyright (c) 2014年 liyuhong. All rights reserved.
//

#import "Target.h"

@implementation Target
- (id)init
{
    self = [super init];
    if (nil != self) {
//        age = 10;
        
        
        _age = 10;
        _grade = 1;
    }
    return self;
}

//// setter and getter
//- (int)age
//{
//    return age;
//}
//- (void)setAge:(int)theAge
//{
//    [self willChangeValueForKey:@"age"];
//    age = theAge;
//    [self didChangeValueForKey:@"age"];
//}
//
//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
//{
//
//    if ([key isEqualToString:@"age"]) {
//        return NO;
//    }
//    return [super automaticallyNotifiesObserversForKey:key];
//}



@end
