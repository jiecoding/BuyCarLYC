//
//  twoVc.m
//  WJSegmentMeunVc
//
//  Created by 吴计强 on 16/4/5.
//  Copyright © 2016年 com.firsttruck. All rights reserved.
//

#import "twoVc.h"

#import "TWCollectionViewController.h"
#import "CollectionDefine.h"

#import "ExcelView.h"


@interface twoVc ()

@end

@implementation twoVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
//    TWCollectionViewController *_collectionController = [[TWCollectionViewController alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    _collectionController.imageName = @"car2.jpg";
//    _collectionController.hidden = NO;
//    [self.view addSubview:_collectionController];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    
    ExcelView* excel = [[ExcelView alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width-20, [UIScreen mainScreen].bounds.size.height-20)];
    excel.topHeight = 130;
    excel.contentHeight= 50;
    
    excel.leftWidth = 100;

    [self.view addSubview:excel];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
