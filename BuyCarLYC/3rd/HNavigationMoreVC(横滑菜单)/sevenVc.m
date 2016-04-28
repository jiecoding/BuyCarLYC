//
//  sevenVc.m
//  WJSegmentMeunVc
//
//  Created by 吴计强 on 16/4/5.
//  Copyright © 2016年 com.firsttruck. All rights reserved.
//

#import "sevenVc.h"
#import "TWCollectionViewController.h"
#import "CollectionDefine.h"
@interface sevenVc ()

@end

@implementation sevenVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
    
    TWCollectionViewController *_collectionController = [[TWCollectionViewController alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    _collectionController.imageName = @"car8.jpg";
    
    _collectionController.hidden = NO;
    [self.view addSubview:_collectionController];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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
