//
//  XfBaseSettingViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfBaseSettingViewController.h"
#import "XfSettingArrowItem.h"
#import "XfSettingSwitchItem.h"
#import "XfSettingGroup.h"
#import "XfSettingCell.h"

@interface XfBaseSettingViewController()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation XfBaseSettingViewController

-(NSMutableArray *)data
{
    if (_data == nil) {
        _data = [NSMutableArray array];
        
    }
    return _data;
}


-(id)init{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //backgroundView的优先级大于backgroundColor
    self.tableView.backgroundView =nil;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    XfSettingGroup *group = self.data[section];
    return group.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    XfSettingCell * cell = [XfSettingCell cellWithTableView:tableView];
    
    //给cell传递模型数据
    XfSettingGroup *group = self.data[indexPath.section];
    XfSettingItem *item = group.items[indexPath.row];
    cell.item = item;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    XfSettingGroup *group = self.data[indexPath.section];
    XfSettingItem *item = group.items[indexPath.row];
    
    if (item.option) {
        item.option();
    }
    
    if ([item isKindOfClass:[XfSettingArrowItem class]]) {
        
        XfSettingArrowItem * arrowItem = (XfSettingArrowItem *) item;
        
        if (arrowItem.destvcClass ==nil)return;
        
        UITableViewController *vc = [[arrowItem.destvcClass alloc]init];
        
        vc.title = arrowItem.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    XfSettingGroup *group = self.data[section];
    return group.header;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    
    XfSettingGroup *group = self.data[section];
    return group.footer;
}
@end
