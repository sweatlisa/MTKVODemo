//
//  Observer.m
//  KVODemo
//
//  Created by liyuhong on 14-6-26.
//  Copyright (c) 2014年 liyuhong. All rights reserved.
//

#import "Observer.h"
//#import <objc/runtime.h>

@implementation Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"age"]) {
        Class classInfo = (__bridge Class)context;
        NSString *className = [NSString stringWithCString:object_getClassName(classInfo)  encoding:NSUTF8StringEncoding];
        NSLog(@">>> class:%@,Age Changed.",className);
        NSLog(@"old age is %@",[change objectForKey:@"old"]);
        NSLog(@"new age is %@",[change objectForKey:@"new"]);
    }
    else if ([keyPath isEqualToString:@"information"]){
        Class classInfo = (__bridge Class)context;
        NSString *className= [NSString stringWithCString:object_getClassName(classInfo) encoding:NSUTF8StringEncoding];
        NSLog(@">>>>>>> class:%@,Information Changed.",className);
        NSLog(@"old information is %@",[change objectForKey:@"old"]);
        NSLog(@"new information is %@",[change objectForKey:@"new"]);
    }
    else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
@end
