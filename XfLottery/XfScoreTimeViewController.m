//
//  XfScoreTimeViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfScoreTimeViewController.h"
#import "XfSettingLabelItem.h"
#import "XfSettingSwitchItem.h"
#import "XfSettingGroup.h"

@interface XfScoreTimeViewController ()

@end

@implementation XfScoreTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //0组
    XfSettingItem *notice = [XfSettingSwitchItem itemWithTitle:@"提醒我关注的比赛" ];
    XfSettingGroup *group0  =[[XfSettingGroup alloc]init];
    group0.footer = @"hhhhh";
    group0.items = @[notice];
    [self.data addObject:group0];
    
    //1组
    XfSettingItem *start = [XfSettingLabelItem itemWithTitle:@"起始时间" ];
    XfSettingGroup *group1  =[[XfSettingGroup alloc]init];
    group1.header = @"hhhhh";
    group1.items = @[start];
    [self.data addObject:group1];
    
    //2组
    XfSettingItem *end = [XfSettingLabelItem itemWithTitle:@"结束时间" ];
    XfSettingGroup *group2  =[[XfSettingGroup alloc]init];
    group2.items = @[end];
    [self.data addObject:group2];
}

@end
