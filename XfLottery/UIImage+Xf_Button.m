//
//  UIImage+Xf_Button.m
//  XfLottery
//
//  Created by FengXu on 15/12/12.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "UIImage+Xf_Button.h"

@implementation UIImage (Xf_Button)
+(UIImage *)resizebleImage:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    
    CGFloat W =normal.size.width *0.5;
    CGFloat H =normal.size.height *0.5;
    return [normal stretchableImageWithLeftCapWidth:W topCapHeight:H];
    
}
@end
