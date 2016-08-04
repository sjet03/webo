//
//  User.h
//  webo
//
//  Created by ruanjianjulebu on 16/8/4.
//  Copyright (c) 2016年 ruanjianjulebu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (strong,nonatomic)NSString *name;
@property (strong,nonatomic)NSString *profile_image_url;
+(instancetype)userWithDic:(NSDictionary *)dic;
@end
