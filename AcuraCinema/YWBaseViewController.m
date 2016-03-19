//
//  YWBaseViewController.m
//  AcuraCinema
//
//  Created by David Yu on 17/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWBaseViewController.h"
#import "YWBuyMemberView.h"

#define ROOT_STATE @"root"

@interface YWBaseViewController()<UIWebViewDelegate>

@end

@implementation YWBaseViewController
{
    BOOL                 _isMember;          //是否是会员
    UIView              *_buyMemberBackgroundView;
    YWBuyMemberView     *_buyMemberView;
    UIWebView           *_webview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SeparatorColor;

    [self createMemberView];
}

- (void)createWebView {
    _webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webview.backgroundColor = [UIColor clearColor];
    _webview.scalesPageToFit =YES;
    _webview.delegate = self;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"index01" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    [_webview loadRequest:[NSURLRequest requestWithURL:url]];
    [[UIApplication sharedApplication].keyWindow addSubview:_webview];
}

- (void)createMemberView {
    _buyMemberBackgroundView = [[UIView alloc] init];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:_buyMemberBackgroundView];
    _buyMemberView = [[YWBuyMemberView alloc] init];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:_buyMemberView];
    _buyMemberBackgroundView.hidden = YES;
    _buyMemberView.hidden = YES;
}

- (BOOL)checkIsMember {
    _isMember = [[[NSUserDefaults standardUserDefaults] objectForKey:ROOT_STATE] boolValue];
    if (_isMember) {
        [self hiddenNotMemberView];
        
        return YES;
    }else {
        [self showNotMemberView];
        
        return NO;
    }
}

- (void)showNotMemberView {
    _buyMemberBackgroundView.hidden = NO;
    _buyMemberView.hidden = NO;
    [self createWebView];
    [self onclick];
}

- (void)onclick {
    [_webview stringByEvaluatingJavaScriptFromString:@"func();"];
}

- (void)hiddenNotMemberView {
    _buyMemberBackgroundView.hidden = YES;
    _buyMemberView.hidden = YES;
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *requestString = [[[request URL] absoluteString]stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"requestString : %@",requestString);
    
    
    NSArray *components = [requestString componentsSeparatedByString:@"|"];
    NSLog(@"=components=====%@",components);
    
    
    NSString *str1 = [components objectAtIndex:0];
    NSLog(@"str1:::%@",str1);
    
    
    NSArray *array2 = [str1 componentsSeparatedByString:@"/"];
    NSLog(@"array2:====%@",array2);
    
    
    NSInteger coun = array2.count;
    NSString *method = array2[coun-1];
    NSLog(@"method:===%@",method);
    
    if ([method isEqualToString:@"InviteBtn1"]) {
        //查看详情，其中红色部分是HTML5跟咱们约定好的，相应H5上的按钮的点击事件后，H5发送超链接，客户端一旦收到这个超链接信号。把其中的点击按钮的约定的信号标示符截取出来跟本地的标示符来进行匹配，如果匹配成功，那么就执行相应的操作，详情见如下所示。
        
    }else if ([method isEqualToString:@"InviteBtn2"]) {
        
    }
    
    
    
    //判断是否是单击
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
        NSURL *url = [request URL];
        if([[UIApplication sharedApplication]canOpenURL:url])
        {
            [[UIApplication sharedApplication]openURL:url];
        }
        return NO;
    }
    return YES;
}



@end

