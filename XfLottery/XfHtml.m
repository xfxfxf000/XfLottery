//
//  XfHtml.m
//  XfLottery
//
//  Created by FengXu on 15/12/20.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfHtml.h"

@implementation XfHtml


+(instancetype)htmlWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self= [super init]) {
        //        [self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ID = dict[@"id"];
    }
    return self;
}
@end
