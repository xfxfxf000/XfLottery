//
//  XfSettingItem.h
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MySettingItemOption)();

@interface XfSettingItem : NSObject

@property(nonatomic,copy)NSString * icon;
@property(nonatomic,copy)NSString * title;

//子标题
@property(nonatomic,copy)NSString * subtitle;

//点击那个cell需要做的事情
@property(nonatomic,copy)MySettingItemOption option;

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

+(instancetype)itemWithTitle:(NSString *)title;

@end
