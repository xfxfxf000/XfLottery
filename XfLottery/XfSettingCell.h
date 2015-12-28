//
//  XfSettingCell.h
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XfSettingItem;
@interface XfSettingCell : UITableViewCell
@property(nonatomic,strong)XfSettingItem *item;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
