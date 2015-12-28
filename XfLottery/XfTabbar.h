//
//  XfTabbar.h
//  XfLottery
//
//  Created by FengXu on 15/12/11.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XfTabbar;

@protocol XfTabbarDelegate <NSObject>

@optional
-(void)tabbar:(XfTabbar *)tabbar didSelectButtonFrom:(int)from to:(int)to;

@end
@interface XfTabbar : UIView

@property (weak,nonatomic)id<XfTabbarDelegate>delegate;

@end
