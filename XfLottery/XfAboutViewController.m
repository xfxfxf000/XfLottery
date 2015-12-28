//
//  XfAboutViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/20.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfAboutViewController.h"
#import "XfSettingArrowItem.h"
#import "XfSettingGroup.h"

@interface XfAboutViewController ()
//@property(nonatomic,strong)UIWebView *webView;
@end

@implementation XfAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView *webView  =[[UIWebView alloc]init];
    webView.frame  =CGRectZero;
    [self.view addSubview:webView];
    
    //设置数据
    XfSettingItem *mark = [XfSettingArrowItem itemWithTitle:@"评分支持" ];
    mark.option = ^{
        NSString *appid = @"";
        NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8",appid];
        NSURL *url = [NSURL URLWithString:str];
        [[UIApplication sharedApplication]openURL: url];
        
    };
    
    XfSettingItem *call = [XfSettingArrowItem itemWithTitle:@"客服电话"];
    call.subtitle = @"10086";
    call.option  = ^{
//        NSURL *url = [NSURL URLWithString:@"telprompt://10086" ];私有无法通过审核
//        [[UIApplication sharedApplication]openURL:url];
         NSURL *url = [NSURL URLWithString:@"telprompt://10086" ];
        
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
    };
    
    XfSettingGroup *group  =[[XfSettingGroup alloc]init];
    group.items = @[mark,call];
    [self.data addObject:group];
    
    //headerView
    self.tableView.tableHeaderView  = [UIButton buttonWithType:UIButtonTypeContactAdd];
}

@end
