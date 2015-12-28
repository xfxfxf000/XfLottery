//
//  XfTitleButton.m
//  XfLottery
//
//  Created by FengXu on 15/12/12.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfTitleButton.h"

@interface  XfTitleButton()
@property(nonatomic,strong)UIFont *titleFont;
@end

@implementation XfTitleButton

//从文件解析一个对象时候就会调用这个方法
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
        self.titleFont = [UIFont systemFontOfSize:14];
        self.titleLabel.font = self.titleFont ;
        
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

//控制内部lable的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    NSDictionary *attrs = @{NSFontAttributeName :self.titleFont};
    //只有xcode5才会编译这段代码
#ifdef __IPHONE_7_0
    CGFloat titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
#endif
    CGFloat titelH = contentRect.size.height;
    
    return CGRectMake(titleX, titleY, titleW, titelH);
}

//控制内部imageView的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 15;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY , imageW, imageH);
}

@end
