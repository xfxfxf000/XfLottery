//
//  XfSettingViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfSettingViewController.h"
#import "XfSettingArrowItem.h"
#import "XfSettingSwitchItem.h"
#import "XfSettingGroup.h"
#import "XfSettingCell.h"
#import "XfPushNoticeViewController.h"
#import "MBProgressHUD+MJ.h"
#import "XfProductViewController.h"
#import "XfHelpViewController.h"
#import "XfShareViewController.h"
#import "XfAboutViewController.h"

@interface XfSettingViewController()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation XfSettingViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置";
    
    [self setupGroup0];
    [self setupGroup1];
}

-(void)setupGroup0{
    
    XfSettingItem *pushNotice = [XfSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" destvcClass:[XfPushNoticeViewController class]];
    XfSettingItem *handShake = [XfSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选" ];
    XfSettingItem *soundEffect = [XfSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果" ];
    XfSettingGroup *group  =[[XfSettingGroup alloc]init];
    group.items = @[pushNotice,handShake,soundEffect];
    [self.data addObject:group];
}

-(void)setupGroup1
{
    XfSettingItem *update = [XfSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本" ];
    update.option = ^{
        //弹框提示
        [MBProgressHUD showMessage:@"联网检查中"];
        //发送网络请求
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            
            [MBProgressHUD showError:@"没有新版本"];
        });
    };
    
    XfSettingItem *help = [XfSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destvcClass:[XfHelpViewController class]];
     XfSettingItem *share = [XfSettingArrowItem itemWithIcon:@"MoreHelp" title:@"分享" destvcClass:[XfShareViewController class]];
     XfSettingItem *msg = [XfSettingArrowItem itemWithIcon:@"MoreHelp" title:@"查看消息" destvcClass:[XfPushNoticeViewController class]];
     XfSettingItem *product = [XfSettingArrowItem itemWithIcon:@"MoreHelp" title:@"产品推荐" destvcClass:[XfProductViewController class]];
     XfSettingItem *about = [XfSettingArrowItem itemWithIcon:@"MoreHelp" title:@"关于" destvcClass:[XfAboutViewController class]];
    XfSettingGroup *group  =[[XfSettingGroup alloc]init];
    group.items = @[update,help,share,msg,product,about];
    group.header =@"hhhh";
    [self.data addObject:group];
}

@end