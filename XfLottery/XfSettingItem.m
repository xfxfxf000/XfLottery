//
//  XfSettingItem.m
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfSettingItem.h"

@implementation XfSettingItem



+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    XfSettingItem *item = [[self alloc]init];
    item.icon = icon;
    item.title = title;
    return item;
}



+(instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}
@end
