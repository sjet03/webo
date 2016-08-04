//
//  Account.m
//  webo
//
//  Created by ruanjianjulebu on 16/8/2.
//  Copyright (c) 2016年 ruanjianjulebu. All rights reserved.
//

#import "Account.h"

@implementation Account
+(instancetype)accountWithDic:(NSDictionary *)dic{
    Account *account = [[Account alloc]init];
    account.access_token = dic[@"access_token"];
    account.expires_in = [dic[@"expires_in"] longLongValue];
    account.remind_in = [dic[@"remind_in"]longLongValue];
    account.uid = [dic[@"uid"]longLongValue];
    account.creatDate = [NSDate date];
    return account;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self =[super init];
    if(self){
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [[aDecoder decodeObjectForKey:@"expires_in"]longLongValue];
        self.remind_in = [[aDecoder decodeObjectForKey:@"remind_in"]longLongValue];
        self.uid = [[aDecoder decodeObjectForKey:@"uid"]longLongValue];
       self.creatDate = [aDecoder decodeObjectForKey:@"creatDate"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:@(self.expires_in) forKey:@"expires_in"];
    [aCoder encodeObject:@(self.remind_in) forKey:@"remind_in"];
    [aCoder encodeObject:@(self.uid) forKey:@"uid"];
   [aCoder encodeObject:self.creatDate forKey:@"creatDate"];
}


@end
