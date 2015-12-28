//
//  XfProductCell.m
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfProductCell.h"
#import "XfProduct.h"
@interface  XfProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation XfProductCell

- (void)awakeFromNib {
    self.iconView.layer.cornerRadius = 8;
    self.iconView.clipsToBounds = YES;
}

-(void)setProdct:(XfProduct *)prodct
{
    _prodct = prodct;
    
    self.iconView.image = [UIImage imageNamed:prodct.icon];
    
    self.nameLabel.text = prodct.title;
}

@end
