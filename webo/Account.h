//
//  Account.h
//  webo
//
//  Created by ruanjianjulebu on 16/8/2.
//  Copyright (c) 2016年 ruanjianjulebu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject<NSCoding>

@property (nonatomic,strong) NSString *access_token;
@property (nonatomic,assign) long long expires_in;
@property (nonatomic,assign) long long remind_in;
@property (nonatomic,assign) long long uid;
@property (strong,nonatomic) NSDate *creatDate;
+(instancetype)accountWithDic:(NSDictionary *)dic;

@end
