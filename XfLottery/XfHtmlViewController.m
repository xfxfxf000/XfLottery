//
//  XfHtmlViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/20.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfHtmlViewController.h"
#import "XfHtml.h"

@interface XfHtmlViewController ()<UIWebViewDelegate>

@end

@implementation XfHtmlViewController

-(void)loadView
{
    self.view = [[UIWebView alloc]init];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置标题
    self.title = self.html.title;
    
    UIWebView *webView = (UIWebView *)self.view;
    
    webView.delegate = self;
    //创建url
    NSURL *url = [[NSBundle mainBundle]URLForResource:self.html.html withExtension:nil];
    
    //创建一个请求对象
    NSURLRequest *request  =[NSURLRequest requestWithURL:url];
    
    //发送请求加载网页
    [webView loadRequest:request];
    
    //设置左上角的关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
}

-(void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


//网页加载完毕的时候调用
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //跳到ID对应的网页标签
    //拼接JavaScript代码
    NSString *js =[NSString stringWithFormat:@"window.loca tion.href= '#%@';",self.html.ID];
    //执行JavaScript对应代码
    [webView stringByEvaluatingJavaScriptFromString:js];
}
@end
