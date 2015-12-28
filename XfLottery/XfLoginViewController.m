
//
//  XfLoginViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/12.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfLoginViewController.h"
#import "UIImage+Xf_Button.h"
#import "XfSettingViewController.h"

@interface XfLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
- (IBAction)setting:(id)sender;

@end

@implementation XfLoginViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIImage *normal = [UIImage resizebleImage:@"RedButton"];
    UIImage *high = [UIImage resizebleImage:@"RedBUttonPressed"];
    

    
    [self.LoginBtn setBackgroundImage:normal forState:UIControlStateNormal];
    [self.LoginBtn setBackgroundImage:high forState:UIControlStateHighlighted];
}




- (IBAction)setting:(id)sender {
    XfSettingViewController *settingVc = [[XfSettingViewController alloc]init];
    [self.navigationController pushViewController:settingVc animated:YES];
    
}
@end
