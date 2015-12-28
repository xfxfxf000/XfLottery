//
//  XfSettingGroup.h
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XfSettingGroup : NSObject
@property(nonatomic,copy)NSString *header;
@property(nonatomic,copy)NSString *footer;

@property(nonatomic,strong)NSArray *items;
@end
