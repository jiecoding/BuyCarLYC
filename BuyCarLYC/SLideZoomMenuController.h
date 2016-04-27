//
//  SLideZoomMenuController.h
//  SlideZoomMenuDemo
//
//  Created by renxiaojian on 15/3/16.
//  Copyright (c) 2015年 renxiaojian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLideZoomMenuController : UIViewController

@property(nonatomic, strong) UIViewController *leftViewController;
@property(nonatomic, strong) UINavigationController *rootViewController;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (nonatomic)BOOL bunengLa;
- (id)initWithRootController:(UIViewController *)rootViewController;

- (void)showLeft;
@property(nonatomic, strong) UIPanGestureRecognizer *rightPan;
@property(nonatomic, strong) UIPanGestureRecognizer *leftPan;
@property(nonatomic, strong) UITapGestureRecognizer *tap;

@end

