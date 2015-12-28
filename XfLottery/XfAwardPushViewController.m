//
//  XfAwardPushViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfAwardPushViewController.h"
#import "XfSettingSwitchItem.h"
#import "XfSettingGroup.h"

@interface XfAwardPushViewController ()

@end

@implementation XfAwardPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XfSettingItem *ball = [XfSettingSwitchItem itemWithTitle:@"双色球" ];
    XfSettingItem *letou = [XfSettingSwitchItem itemWithTitle:@"大乐透" ];
    XfSettingGroup *group  =[[XfSettingGroup alloc]init];
    group.header = @"hhhhh";
    group.items = @[ball,letou];
    [self.data addObject:group];
}

@end
