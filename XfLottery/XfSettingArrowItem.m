//
//  XfSettingArrowItem.m
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfSettingArrowItem.h"

@implementation XfSettingArrowItem

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destvcClass:(Class)destvcClass
{
    XfSettingArrowItem *item = [self itemWithIcon:icon title:title];
    item.destvcClass = destvcClass;
     return item;
}

+(instancetype)itemWithTitle:(NSString *)title destvcClass:(Class)destvcClass
{
    return [self itemWithIcon:nil title:title destvcClass:destvcClass];
}
@end
