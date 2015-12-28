//
//  XfSettingArrowItem.h
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfSettingItem.h"

@interface XfSettingArrowItem : XfSettingItem

@property(nonatomic,assign)Class destvcClass;

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destvcClass:(Class)destvcClass;

+(instancetype)itemWithTitle:(NSString *)title destvcClass:(Class)destvcClass;
@end
