//
//  AccountManager.h
//  webo
//
//  Created by ruanjianjulebu on 16/8/3.
//  Copyright (c) 2016年 ruanjianjulebu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
@interface AccountManager : NSObject
@property (strong,nonatomic)Account *currentAccount;

//单例方法
+(instancetype)sharedManager;
//保存账户信息
-(void)archiverAccount:(Account *)account;
//读取账户信息
-(Account *)unArchiveAccount;
//判断是否存在有效的账户
-(BOOL)isValidateAccount;
//判断账户是否超期
-(BOOL)isEpires;
@end
