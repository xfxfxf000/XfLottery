//
//  XfHtml.h
//  XfLottery
//
//  Created by FengXu on 15/12/20.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XfHtml : NSObject
@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *html;

@property(nonatomic,copy)NSString *ID;

+(instancetype)htmlWithDict:(NSDictionary *)dict;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
