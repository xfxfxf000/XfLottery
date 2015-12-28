//
//  XfSettingCell.m
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//
#define Xfcolor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#import "XfSettingCell.h"
#import "XfSettingItem.h"
#import "XfSettingSwitchItem.h"
#import "XfSettingArrowItem.h"
#import "XfSettingLabelItem.h"

@interface XfSettingCell()
@property (nonatomic,strong)UIImageView * arrowView;

@property (nonatomic,strong)UISwitch * switchView;

@property (nonatomic,strong)UILabel * labelView;
@end

@implementation XfSettingCell

-(UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow" ]];    }
    return _arrowView;
}

-(UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView =[[UISwitch alloc]init];
        
        [_switchView addTarget:self action:@selector(switchStateChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *bg = [[UIView alloc]init];
        bg.backgroundColor =  Xfcolor(240,241,236);
        self.selectedBackgroundView  =bg;
    }
    return self;
}

//监听开关状态的改变
-(void)switchStateChange
{
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setBool:self.switchView.isOn forKey:self.item.title];
    [defaults synchronize];
}

-(UILabel *)labelView
{
    if (_labelView == nil) {
        _labelView =[[UILabel alloc]init];
        _labelView.bounds = CGRectMake(0, 0, 100, 30);
        _labelView.backgroundColor = [UIColor redColor];
    }
    return _labelView;
}


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    static NSString *ID = @"setting";
    XfSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell  = [[XfSettingCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

-(void)setFrame:(CGRect)frame
{
    if(!([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)){
        frame.size.width += 20;
        frame.origin.x -= 10;
    }
    [super setFrame:frame];
}

-(void)setItem:(XfSettingItem *)item
{
    _item = item;
    
    //设置数据
    [self setupdata];
    
    //设置右边内容
    [self setRightContent];
}

-(void)setRightContent
{
    if ([self.item isKindOfClass:[XfSettingArrowItem class]]) {//箭头
        self.accessoryView = self.arrowView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([self.item isKindOfClass:[XfSettingSwitchItem class]])//开关
    {
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //设置开关的状态
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        self.switchView.on = [defaults boolForKey:self.item.title]; 
        
    }else if ([self.item isKindOfClass:[XfSettingLabelItem class]])//标签
    {
        self.accessoryView = self.labelView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else
    {
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

-(void)setupdata
{
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
    
    self.detailTextLabel.text = self.item.subtitle;
}

@end
