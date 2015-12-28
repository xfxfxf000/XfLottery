//
//  XfHelpViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/20.
//  Copyright (c) 2015年 FengXu. All rights reserved.
//

#import "XfHelpViewController.h"
#import "XfSettingItem.h"
#import "XfSettingArrowItem.h"
#import "XfSettingGroup.h"
#import "XfHtmlViewController.h"
#import "XfNavigationCOntroller.h"
#import "XfHtml.h"

@interface XfHelpViewController ()
@property(nonatomic,strong)NSArray *htmls;
@end

@implementation XfHelpViewController

-(NSArray *)htmls
{
    if (_htmls == nil) {
        //Json文件路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"help.json" ofType:nil];
        
        //加载Json文件
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        //将Json数据转为NSArray或者NSDictionary
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //将字典转化成模型
       NSMutableArray *htmlArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            XfHtml *p = [XfHtml htmlWithDict:dict];
            [htmlArray addObject:p];
        }
        _htmls = htmlArray;
    }
    return _htmls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1、创建所有得item
    NSMutableArray *items  =[NSMutableArray array];
    for (XfHtml *html in self.htmls) {
        XfSettingItem *item = [XfSettingArrowItem itemWithTitle:html.title ];
        [items addObject:item];
    }
    
    //1、创建组
    XfSettingGroup *group  =[[XfSettingGroup alloc]init];
    group.items = items;
    [self.data addObject:group];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XfHtmlViewController *htmlVc = [[XfHtmlViewController alloc]init];
    htmlVc.html = self.htmls[indexPath.row];
    
    XfNavigationCOntroller *nav  =[[XfNavigationCOntroller alloc]initWithRootViewController:htmlVc];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
