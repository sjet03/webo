//
//  Status.h
//  webo
//
//  Created by ruanjianjulebu on 16/8/4.
//  Copyright (c) 2016年 ruanjianjulebu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface Status : NSObject
//微博的文字内容
@property (strong,nonatomic)NSString *text;
//缩略图图片的链接
@property (strong,nonatomic)NSString *thumbnail_pic;
@property (strong,nonatomic)User *user;
+(instancetype)statusWithDic:(NSDictionary *)dic;
@end
