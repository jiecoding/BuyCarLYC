//
//  LYCTabBarController.m
//  BuyCarLYC
//http://blog.csdn.net/xn4545945/article/details/35994863
//  Created by laiyongche on 16/4/26.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import "LYCTabBarController.h"

@implementation LYCTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect frame  = self.tabBar.frame;

    //为了添加自定义的试图背景，首先要删除系统自带的tabBar层
    [self.tabBar removeFromSuperview];
    
    UIView *bgView = [[UIView alloc] init];
    
    bgView.frame = frame;
    
    bgView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:bgView];
    
    for(int i = 0 ; i < 5; i ++)
    {
        UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
      
        [btn addTarget:self action:@selector(tabTest) forControlEvents:UIControlEventTouchUpInside];
        
        NSString *imageName = [NSString stringWithFormat:@"tabbar1"];
     
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
     
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
    
        
        [bgView addSubview:btn];
    }
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar1"]];
//    imageView.frame = CGRectMake(0, 0, 50, 50);
//    [bgView addSubview:imageView];
    
}

- (void)tabTest
{
    NSLog(@"sfdfasfdsafds");
}

@end
