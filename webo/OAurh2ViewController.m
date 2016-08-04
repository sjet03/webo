//
//  ViewController.m
//  webo
//
//  Created by ruanjianjulebu on 16/8/2.
//  Copyright (c) 2016年 ruanjianjulebu. All rights reserved.
//

#import "OAurh2ViewController.h"
#import "AFNetworking.h"
#import "Account.h"
#import "AccountManager.h"
#import "SinaAPIConstant.h"
#import "AppDelegate.h"
#import "StatusesTableViewController.h"
@interface OAurh2ViewController ()<UIWebViewDelegate>


@end

@implementation OAurh2ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
     UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    webView.delegate = self;
//    通过账户管理类判断用户是否有效
    AppDelegate *delegate =  [[UIApplication sharedApplication] delegate];
    //    读取保存的账户信息
    
        if(![delegate.accountManager isValidateAccount]&& ![delegate.accountManager isEpires]){
//            访问新浪的oauth页面
    NSString *strUrl = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",kOAuth2URL,kAppKey,kRedirectURL];
    NSURL *url = [NSURL URLWithString:strUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
     }
        else{
            [self showStatusViewController];
        }
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)showStatusViewController{
    StatusesTableViewController *statusVC = [[StatusesTableViewController alloc]init];
    [self.navigationController pushViewController:statusVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-webViewDelegate方法

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"%@",request);
    NSString *url = request.URL.absoluteString;
    NSString *str = @"code=";
    NSRange range = [url rangeOfString:str];
    
    if (range.length) {
        NSString *code = [url substringFromIndex:range.location+range.length];
        NSLog(@"code=%@",code);
       [self requestAccessToken:code];
    }

                //        创建账户对象

    return YES;
}
-(void)requestAccessToken:(NSString *)code{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc]init];

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:kAppKey forKey:@"client_id"];
    [dic setObject:kAppSecret forKey:@"client_secret"];
    [dic setObject:kGrandType forKey:@"grant_type"];
    [dic setObject:code forKey:@"code"];
    [dic setObject:kRedirectURL forKey:@"redirect_uri"];
//    [dic setObject:@"1151822152" forKey:@"client_id"];
//    [dic setObject:@"d7f419894f1914d4b40cc0f1cb67c78c" forKey:@"client_secret"];
//    [dic setObject:@"authorization_code" forKey:@"grant_type"];
//    [dic setObject:code forKey:@"code"];
//    [dic setObject:@"http://www.baidu.com" forKey:@"redirect_uri"];
    [manager POST:kAccessTokenURL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"请求成功%@",responseObject);
        //        创建账户对象
        Account *account =[Account accountWithDic:responseObject];
        //保存账户对象
//       AppDelegate *appDelegate =  [[UIApplication sharedApplication] delegate];
//        [appDelegate.accountManager archiverAccount:account];
////       前往下一个窗口
         [self showStatusViewController];
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"请求失败:%@",error);
    }];
}


@end
