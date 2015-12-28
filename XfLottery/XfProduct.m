//
//  XfProduct.m
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfProduct.h"

@implementation XfProduct


+(instancetype)productWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self= [super init]) {
//        [self setValuesForKeysWithDictionary:dict];
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.scheme = dict[@"customUrl"];
        self.url = dict[@"url"];
        self.ID = dict[@"id"];
    }
    return self;
}

@end
