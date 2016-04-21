//
//  ViewController.m
//  java
//
//  Created by kongfanyi on 16/4/21.
//  Copyright © 2016年 kongfanyi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) JSContext *jsContext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webview = [[UIWebView alloc]initWithFrame:self.view.frame];
    webview.delegate = self;
    [self.view addSubview:webview];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"test1" ofType:@"html"];
    NSURL *url = [NSURL URLWithString:path];
    [webview loadRequest:[NSURLRequest requestWithURL:url]];
    
//    JSContext *context = [[JSContext alloc]init];
//    [context evaluateScript:@"var num = 10"];
//    [context evaluateScript:@"var fun = function(value){return value * 2}"];
////    JSValue *value = [context evaluateScript:@"fun(2)"];
//    
//    JSValue *function = context[@"fun"];
//    JSValue *value = [function callWithArguments:@[@"10"]];
//    NSLog(@"%@",[value toString]);
    
   
    
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    JSModel *model = [[JSModel alloc]init];
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext[@"jsModel"] = model;
    model.jsContext = self.jsContext;
}

@end
