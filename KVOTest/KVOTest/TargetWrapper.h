//
//  TargetWrapper.h
//  KVODemo
//
//  Created by liyuhong on 14-6-26.
//  Copyright (c) 2014年 liyuhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Target;

@interface TargetWrapper : NSObject

@property(nonatomic,strong)NSString *information;
@property(nonatomic,strong)Target   *target;

- (id)init:(Target *)aTarget;
@end
