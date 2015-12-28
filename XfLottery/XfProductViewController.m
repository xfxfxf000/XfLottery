//
//  XfProductViewController.m
//  XfLottery
//
//  Created by FengXu on 15/12/19.
//  Copyright (c) 2015年 FengXu. All rights reserved.
// 产品推荐

#define XfcollectionID @"product"
#import "XfProductViewController.h"
#import "XfNavigationCOntroller.m"
#import "XfProduct.h"
#import "XfProductCell.h"

@interface XfProductViewController()
@property(nonatomic,strong)NSArray * products;
@end

@implementation XfProductViewController

-(NSArray *)products
{
    if (_products == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"products.json" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //将字典转化成模型
        NSMutableArray *productArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            XfProduct *p = [XfProduct productWithDict:dict];
            [productArray addObject:p];
        }
        _products = productArray;
    }
    return _products;
}

-(id)init
{
    //流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个cell的大小
    layout.itemSize = CGSizeMake(80, 80);
    //设置水平间距
    layout.minimumInteritemSpacing = 0;
    //设置垂直间距
    layout.minimumLineSpacing = 10;
    //设置四周的内边距
    layout.sectionInset = UIEdgeInsetsMake(20, 0 , 20, 0);
    if(self = [super initWithCollectionViewLayout:layout]){
        
    }
    return self;
}

-(void)viewDidLoad
{
    UINib *nib = [UINib nibWithNibName:@"XfProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:XfcollectionID];
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:XfcollectionID];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.products.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XfProductCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:XfcollectionID forIndexPath:indexPath ];
    
    cell.prodct = self.products[indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    XfProduct *p = self.products[indexPath.item];
    NSLog(@"%@",p.title);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",p.scheme,p.ID]];
    UIApplication *app  =[UIApplication sharedApplication];
    
    if ([app canOpenURL:url]) {//可以打开本地应用
        [app openURL:url];
    }else{//需要下载应用
        [app openURL:[NSURL URLWithString:p.url]];
    }
    
}
@end
