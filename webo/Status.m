//
//  Status.m
//  webo
//
//  Created by ruanjianjulebu on 16/8/4.
//  Copyright (c) 2016年 ruanjianjulebu. All rights reserved.
//微博的实体类
//

#import "Status.h"

@implementation Status
+(instancetype)statusWithDic:(NSDictionary *)dic{
    Status *statues = [[Status alloc]init];
    statues.text = dic[@"text"];
    statues.thumbnail_pic = 
}

@end
