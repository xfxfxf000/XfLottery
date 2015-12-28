//
//  XfProduct.h
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XfProduct : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *scheme;
@property(copy,nonatomic)NSString * ID;
@property(nonatomic,copy)NSString *url;

+(instancetype)productWithDict:(NSDictionary *)dict;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
