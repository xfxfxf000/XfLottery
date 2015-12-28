//
//  XfBuyViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/12.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfBuyViewController.h"

@interface XfBuyViewController ()
- (IBAction)titleClick:(UIButton *)sender;

@end

@implementation XfBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)titleClick:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}
@end
