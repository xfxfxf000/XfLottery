//
//  XfPushNoticeViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfPushNoticeViewController.h"
#import "XfSettingArrowItem.h"
#import "XfSettingSwitchItem.h"
#import "XfSettingGroup.h"
#import "XfSettingCell.h"
#import "XfAwardPushViewController.h"
#import "XfScoreTimeViewController.h"

@interface XfPushNoticeViewController()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation XfPushNoticeViewController



-(void)setupGroup0{
    
    XfSettingItem *pushNotice = [XfSettingArrowItem itemWithTitle:@"开奖号码推送" destvcClass:[XfAwardPushViewController class]];
    XfSettingItem *handShake = [XfSettingArrowItem itemWithTitle:@"中奖动画"];
    XfSettingItem *soundEffect = [XfSettingArrowItem itemWithTitle:@"比分直播提醒"destvcClass:[XfScoreTimeViewController class]];
    XfSettingGroup *group  =[[XfSettingGroup alloc]init];
    group.items = @[pushNotice,handShake,soundEffect];
    [self.data addObject:group];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGroup0];
}

@end
