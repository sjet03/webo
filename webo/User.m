//
//  User.m
//  webo
//
//  Created by ruanjianjulebu on 16/8/4.
//  Copyright (c) 2016年 ruanjianjulebu. All rights reserved.
//

#import "User.h"

@implementation User

+(instancetype)userWithDic:(NSDictionary *)dic{
    User *user = [[User alloc]init];
    user.name = dic[@"name"];
    user.profile_image_url = dic[@"profile_image_url"];
    return user;
}
@end
