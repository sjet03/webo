//
//  AppDelegate.h
//  webo
//
//  Created by ruanjianjulebu on 16/8/2.
//  Copyright (c) 2016年 ruanjianjulebu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountManager.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic)AccountManager *accountManager;
@end

