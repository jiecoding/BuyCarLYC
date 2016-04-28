//
//  ViewController.m
//  BuyCarLYC
//
//  Created by laiyongche on 16/4/26.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import "LYCMainViewController.h"

#import "TWCollectionViewController.h"
#import "CollectionDefine.h"

#import "WJSegmentMenuVc.h"
#import "oneVc.h"
#import "twoVc.h"
#import "threeVc.h"
#import "fourVc.h"
#import "fireVc.h"
#import "sixVc.h"
#import "sevenVc.h"
#import "eigthVc.h"

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
    
    
    
    /* 创建WJSegmentMenuVc */
    WJSegmentMenuVc *segmentMenuVc = [[WJSegmentMenuVc alloc]initWithFrame:CGRectMake(0, 140, self.view.frame.size.width, 40)];
    [self.view addSubview:segmentMenuVc];
    
    /* 自定义设置(可不设置为默认值) */
    segmentMenuVc.backgroundColor = [UIColor colorWithRed:240/250.0 green:240/250.0 blue:240/250.0 alpha:1];
    segmentMenuVc.titleFont = [UIFont systemFontOfSize:13];
    segmentMenuVc.unlSelectedColor = [UIColor darkGrayColor];
    segmentMenuVc.selectedColor = [UIColor greenColor];
    segmentMenuVc.MenuVcSlideType = WJSegmentMenuVcSlideTypeSlide;
    segmentMenuVc.SlideColor = [UIColor greenColor];
    segmentMenuVc.advanceLoadNextVc = YES;
    
    /* 创建测试数据 */
    NSArray *titles = @[@"值得买",@"紧凑型车",@"SUV",@"中型车",@"专车",@"代驾",@"试驾",@"其他"];
    oneVc      *vc1 = [[oneVc alloc]init];
    twoVc      *vc2 = [[twoVc alloc]init];
    threeVc    *vc3 = [[threeVc alloc]init];
    fourVc     *vc4 = [[fourVc alloc]init];
    fireVc     *vc5 = [[fireVc alloc]init];
    sixVc      *vc6 = [[sixVc alloc]init];
    sevenVc    *vc7 = [[sevenVc alloc]init];
    eigthVc    *vc8 = [[eigthVc alloc]init];
    NSArray *vcArr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8];
    
    /* 导入数据 */
    [segmentMenuVc addSubVc:vcArr subTitles:titles];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
