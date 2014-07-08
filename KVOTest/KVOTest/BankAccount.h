//
//  BankAccount.h
//  KVOTest
//
//  Created by liyuhong on 14-7-7.
//  Copyright (c) 2014年 liyuhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject
{
    float _openingBalance;
}

@property(nonatomic,assign)float openingBalance;//账户余额
@end
