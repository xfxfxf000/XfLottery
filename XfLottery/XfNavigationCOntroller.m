//
//  XfNavigationCOntroller.m
//  XfLottery
//
//  Created by FengXu on 15/12/12.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfNavigationCOntroller.h"

@implementation XfNavigationCOntroller

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

@end
