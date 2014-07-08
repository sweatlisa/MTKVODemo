//
//  BankAccount.m
//  KVOTest
//
//  Created by liyuhong on 14-7-7.
//  Copyright (c) 2014年 liyuhong. All rights reserved.
//

#import "BankAccount.h"

@implementation BankAccount

- (id)init
{
    self = [super init];
    if (self) {
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(balanceUpdate:) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)balanceUpdate:(id)arg
{
    float f = self.openingBalance;
    f += arc4random()%100;
    
//    self.openingBalance =f;
//    [self setOpeningBalance:f];
//    [self setValue:[NSNumber numberWithFloat:f] forKey:@"openingBalance"];
    
    
    [self willChangeValueForKey:@"openingBalance"];
    _openingBalance = f;
    [self didChangeValueForKey:@"openingBalance"];
}

@end
