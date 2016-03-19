//
//  YWMoreViewController.m
//  AcuraCinema
//
//  Created by David Yu on 18/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "YWMoreViewController.h"
#import "YWMoreTableViewCell.h"

@interface YWMoreViewController ()<UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate>

@end

@implementation YWMoreViewController
{
    UITableView     *_tableView;
    
    UIWebView *webview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webview.backgroundColor = [UIColor clearColor];
    webview.scalesPageToFit =YES;
    webview.delegate =self;
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"index01" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    [webview loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:webview];
    
//    [self createSubView];
}

- (void)createSubView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = CustomColor(50, 50, 50);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 40)];
    headView.backgroundColor = SeparatorColor;
    _tableView.tableHeaderView = headView;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.left.right.offset(0);
    }];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(onclick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}







- (void)onclick {
    [webview stringByEvaluatingJavaScriptFromString:@"func1();"];
    //    NSLog(@"+++++++%@", str);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *currentURL = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSString *js_result = [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('q')[0].value='朱祁林';"];
    NSString *js_result2 = [webView stringByEvaluatingJavaScriptFromString:@"document.forms[0].submit(); "];
    NSLog(@"%@========%@=======%@=======%@", currentURL, title, js_result, js_result2);
}

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
