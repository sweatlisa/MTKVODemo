//
//  Target.h
//  KVODemo
//
//  Created by liyuhong on 14-6-26.
//  Copyright (c) 2014年 liyuhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Target : NSObject

//for manual KVO
/*
{
    int age;
}
- (int)age;
- (void)setAge:(int)theAge;
*/



//for automiac KVO
@property(nonatomic,readwrite)int age;
@property(nonatomic,readwrite)int grade;


@end
