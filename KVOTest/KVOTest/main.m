//
//  main.m
//  KVOTest
//
//  Created by liyuhong on 14-7-7.
//  Copyright (c) 2014年 liyuhong. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Observer.h"
#import "Target.h"
#import "TargetWrapper.h"

#import <objc/runtime.h>
#import "Fool.h"

//使用runtime函数来获取类的方法列表
static NSArray *ClassMethodNames(Class c)
{
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(c , &methodCount);
    unsigned int i;
    for (i = 0; i<methodCount; i++) {
        [array addObject:NSStringFromSelector(method_getName(methodList[i]))];
    }
    free(methodList);
    return array;
}

//打印对象的信息
static void PrintDescription(NSString *name,id obj)
{
    NSString *str = [NSString stringWithFormat:@"\n\t%@: %@\n\tNSObject claass %s\n\tlibobjc class %s\n\timplements methods <%@>",name,obj,class_getName([obj class]),class_getName(object_getClass(obj)),[ClassMethodNames(object_getClass(obj)) componentsJoinedByString:@", "]];
    NSLog(@"%@",str);
}

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        Observer *observer = [[Observer alloc]init];
        
        Target *target = [[Target alloc]init];
        
        
        //demo 1
        [target addObserver:observer forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:(__bridge void *)([Target class])];
        
        //        [target setAge:100];
        [target setValue:[NSNumber numberWithInt:30] forKey:@"age"];
        
        [target removeObserver:observer forKeyPath:@"age"];
        
        
        //demo 2
        TargetWrapper *wrapper = [[TargetWrapper alloc]init:target];
        [wrapper addObserver:observer forKeyPath:@"information" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:(__bridge  void*)[TargetWrapper class]];
        [target setGrade:3];
        [target setAge:100];
        [wrapper removeObserver:observer forKeyPath:@"information"];
        
        
        //demo 3
        Fool *anything = [[Fool alloc]init];
        Fool *x = [[Fool alloc]init];
        Fool *y = [[Fool alloc]init];
        Fool *xy = [[Fool alloc]init];
        Fool *control = [[Fool alloc]init];
        
        [x addObserver:anything forKeyPath:@"x" options:0 context:NULL];
        [y addObserver:anything forKeyPath:@"y" options:0 context:NULL];
        [xy addObserver:anything forKeyPath:@"x" options:0 context:NULL];
        [xy addObserver:anything forKeyPath:@"y" options:0 context:NULL];
        
        PrintDescription(@"control", control);
        PrintDescription(@"x", x);
        PrintDescription(@"y", y);
        PrintDescription(@"xy", xy);
        
        NSLog(@"\n\tUsing NSObject methods, normal setX: is %p, overridden setX: is %p\n",[control methodForSelector:@selector(setX:)],[x methodForSelector:@selector(setX:)]);
        NSLog(@"\n\tUsing libobjc functions, normal setX: is %p, overridden setX: is %p\n",method_getImplementation(class_getInstanceMethod(object_getClass(control), @selector(setX:))),method_getImplementation(class_getInstanceMethod(object_getClass(x), @selector(setX:))));
        
        
        
        
    }
    return 0;
}