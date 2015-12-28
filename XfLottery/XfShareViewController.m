//
//  XfShareViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/20.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfShareViewController.h"
#import "XfSettingArrowItem.h"
#import "XfSettingGroup.h"
#import <MessageUI/MessageUI.h>

@interface XfShareViewController ()<MFMessageComposeViewControllerDelegate>

@end

@implementation XfShareViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    XfSettingItem *sina = [XfSettingArrowItem itemWithTitle:@"新浪微博" ];
    __weak typeof(self) share= self;
    XfSettingItem *sms = [XfSettingArrowItem itemWithTitle:@"短信分享"];
    sms.option = ^{
        if (![MFMessageComposeViewController canSendText]) return; 
        
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc]init];
        
        //设置短信内容
        vc.body = @"heheda";
        //设置收件人列表
        vc.recipients = @[@"10086"];
        //设置代理
        vc.messageComposeDelegate = share;
        //现实控制器
        [share presentViewController:vc animated:YES completion:nil];
    };
    XfSettingItem *mail = [XfSettingArrowItem itemWithTitle:@"邮件分享"];
    XfSettingGroup *group  =[[XfSettingGroup alloc]init];
    group.items = @[sina,sms,mail];
    [self.data addObject:group];
}

//点击取消按钮调用
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}


@end
