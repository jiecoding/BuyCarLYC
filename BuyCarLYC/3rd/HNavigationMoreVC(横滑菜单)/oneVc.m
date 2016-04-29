//
//  oneVc.m
//  WJSegmentMeunVc
//
//  Created by 吴计强 on 16/4/5.
//  Copyright © 2016年 com.firsttruck. All rights reserved.
//

#import "oneVc.h"
#import "TWCollectionViewController.h"
#import "CollectionDefine.h"
#import "zzBaseService.h"
#import "LYCHomeService.h"
@interface oneVc ()<zzBaseServiceDelegate>

@end

@implementation oneVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    
    // Do any additional setup after loading the view.
    
    
    TWCollectionViewController *_collectionController = [[TWCollectionViewController alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    _collectionController.imageName = @"car.jpg";
    
    _collectionController.hidden = NO;
    [self.view addSubview:_collectionController];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    LYCHomeService *lycHome = [[LYCHomeService alloc] init];
    
    lycHome.delegate = self;
    
    [lycHome req];
    
    
}

- (void)zzServiceDelegate_RequestSuccess:(id)object
{
    NSLog(@"object:%@",object);
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
