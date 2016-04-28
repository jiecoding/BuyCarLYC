//
//  ViewController.m
//  BuyCarLYC
//
//  Created by laiyongche on 16/4/26.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import "LYCMainViewController.h"

@interface LYCMainViewController ()

@end

@implementation LYCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createViews];
    
    
}

- (void)createViews
{
    
    UIImageView *navBgImageView = [[UIImageView alloc] init];
  
    navBgImageView.frame = CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height / 4);
    
    navBgImageView.image = [UIImage imageNamed:@"ImageNavBg.png"];
    
    [self.view addSubview:navBgImageView];
    
    
    UILabel *navTitle = [[UILabel alloc] init];
    
    navTitle.frame = CGRectMake(navBgImageView.center.x -40,navBgImageView.center.y - 30, 100, 40);
    
    navTitle.text = @"买车通";
    
    navTitle.font = [UIFont italicSystemFontOfSize:20.0f];
    
    navTitle.textColor = [UIColor whiteColor];
    
    [navBgImageView addSubview:navTitle];
    
    UIView *scrollView = [[UIView alloc] init];
    
    scrollView.backgroundColor = [UIColor colorWithRed:40/255.0f green:40/255.0f blue:40/255.0f alpha:1];
  
    scrollView.frame  = CGRectMake(0,navBgImageView.frame.size.height -  self.tabBarController.tabBar.frame.size.height+10, self.view.frame.size.width, self.tabBarController.tabBar.frame.size.height - 10);
    
    [navBgImageView addSubview:scrollView];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end