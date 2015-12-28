//
//  XfTabbarController.m
//  XfLottery
//
//  Created by FengXu on 15/12/11.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfTabbarController.h"
#import "XfTabbar.h"
#import "XfTabbarButton.h"

#define IOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >=7.0)

@interface XfTabbarController()<XfTabbarDelegate>
@end

@implementation XfTabbarController

-(void)viewDidLoad
{
    [super viewDidLoad];
    //移除系统自带tabbar
    [self.tabBar removeFromSuperview];
    
    //添加自定义tabbar
    XfTabbar *myTabbar = [[XfTabbar alloc]init];
    myTabbar.delegate = self;
    myTabbar.frame = self.tabBar.frame;
    myTabbar.backgroundColor = [UIColor greenColor];
    [self.view addSubview:myTabbar];
    
    //1、设置导航栏的主题
    UINavigationBar *navbar = [UINavigationBar appearance];;
    navbar.tintColor = [UIColor whiteColor];
    
    if(IOS7){
        [navbar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    }else{
        [navbar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
    }
    //设置标题文字颜色
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [navbar setTitleTextAttributes:attrs];
    
    //2、设置导航栏barbuttonitem的主题
    
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    
    NSMutableDictionary *itemattrs = [NSMutableDictionary dictionary];
    itemattrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    itemattrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:itemattrs forState:UIControlStateNormal];
    
}



-(void)tabbar:(XfTabbar *)tabbar didSelectButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}

@end
