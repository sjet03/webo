//
//  AccountManager.m
//  webo
//
//  Created by ruanjianjulebu on 16/8/3.
//  Copyright (c) 2016年 ruanjianjulebu. All rights reserved.
//

#import "AccountManager.h"

@implementation AccountManager
static AccountManager *instance = nil;
//单例方法
+(instancetype)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AccountManager alloc]init];
    });
    return instance;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        self.currentAccount = [NSKeyedUnarchiver unarchiveObjectWithFile:[self archivePath]];
    }
    return self;
}


-(NSString *)archivePath{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    return [path stringByAppendingPathComponent:@"account.arc"];
}
//保存账户信息
-(void)archiverAccount:(Account *)account{
    [NSKeyedArchiver archiveRootObject:account toFile:[self archivePath]];
    self.currentAccount = account;
}
//读取账户信息
-(Account *)unArchiveAccount{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self archivePath]];
}
//判断是否存在有效的账户
-(BOOL)isValidateAccount{
    return self.currentAccount !=nil;
}
//判断账户是否超期
-(BOOL)isEpires{
    NSDate *now = [NSDate date];
    NSDate *expiresDate = [self.currentAccount.creatDate dateByAddingTimeInterval:self.currentAccount.expires_in];
    if([now compare:expiresDate]== NSOrderedAscending){
        return NO;
    }
    else{
        return YES;
    }

}

@end
