//
//  XfTabbar.m
//  XfLottery
//
//  Created by FengXu on 15/12/11.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfTabbar.h"
#import "XfTabbarButton.h"
#define XfBarButtonCount 5

@interface XfTabbar()

@property (weak,nonatomic)XfTabbarButton  *selectedButton;

@end

@implementation XfTabbar


//init方法内部会调用initWithFrame方法

-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    
    [self setupButton];
    
    return self;
}

-(void)setupButton
{
    if (self) {
        //添加按钮
        for (int i=0 ; i<XfBarButtonCount;  i++) {
            //创建按钮
            XfTabbarButton *btn = [XfTabbarButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i;
            
            //设置图片
            NSString *name= [NSString stringWithFormat:@"TabBar%d",i+1];
            [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
            
            NSString *name1= [NSString stringWithFormat:@"TabBar%dSel",i+1];
            [btn setBackgroundImage:[UIImage imageNamed:name1] forState:UIControlStateSelected];
            
            
            //添加按钮
            [self addSubview:btn];
            
            //监听
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
            
            if (i == 0) {
                [self buttonClick:btn];
            }
        }
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    for (int i=0; i<XfBarButtonCount; i++) {
        XfTabbarButton *btn = self.subviews[i];
        
        //设置frame
        CGFloat btnY = 0;
        CGFloat btnW = self.frame.size.width / XfBarButtonCount;
        CGFloat btnH = self .frame.size.height;
        CGFloat btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

//监听按钮点击
-(void)buttonClick:(XfTabbarButton *)btn{
    if ([self.delegate respondsToSelector:@selector(tabbar:didSelectButtonFrom:to:)]) {
        [self.delegate tabbar:self didSelectButtonFrom:self.selectedButton.tag to:btn.tag];
    }
    
    self.selectedButton.selected = NO;
    
    btn.selected = YES;
    
    self.selectedButton = btn;
    
//    切换子控制器
//    self.selectedIndex = btn.tag;
    
    //通知代理
    
    
}

@end
