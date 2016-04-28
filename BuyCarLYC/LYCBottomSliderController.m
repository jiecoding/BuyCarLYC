//
//  LYCBottomSliderController.m
//  BuyCarLYC
//
//  Created by laiyongche on 16/4/28.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import "LYCBottomSliderController.h"
#import "ZYWSideView.h"
#import "ZYWSideTableView.h"
#import "LYCTabBarController.h"
#import "UIView+SHCZExt.h"
@implementation LYCBottomSliderController
{
    BOOL isTap;
}
- (void)viewDidLoad
{
    
    self.view.backgroundColor = [UIColor clearColor];
    isTap = NO;
    [self addSubViews];
    [self addRecognizer];
}

//添加子视图
-(void)addSubViews{
    
    //在self.view上创建一个透明的View  作为leftView
    ZYWSideView *leftView=[[ZYWSideView alloc]initWithFrame:CGRectMake(-self.view.frame.size.width*0.25,0,self.view.bounds.size.width,self.view.bounds.size.height)];
   
    

    UIImageView *img=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"leftBg"]];
    img.frame=CGRectMake(0,0,self.view.frame.size.width/2 +20,self.view.frame.size.height - self.view.frame.size.height/3);
    
    
    
    [self.view addSubview:img];
    
    
    //添加
    [self.view addSubview:leftView];

    
    [self addTabbarController];
    
}

//添加主控制器（tabbarcontroller）的View

-(void)addTabbarController{
    
    LYCTabBarController *MVC = [[LYCTabBarController alloc] init];
    
    //  添加子控制器 - 保证响应者链条的正确传递
    [self addChildViewController:MVC];
    
    //    NSLog(@"%@", self.childViewControllers);
    
    //  将 MVC 的视图，添加到 self.view 上
    [self.view addSubview:MVC.view];
    
    //    NSLog(@"%@",self.view.subviews);
    MVC.view.frame = self.view.bounds;
    
    UIButton *pullLeftVCbutton  = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    pullLeftVCbutton.frame =CGRectMake(0, 0, 100, 100);
    [pullLeftVCbutton addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
 
    [pullLeftVCbutton setImage:[UIImage imageNamed:@"pullBg"] forState:UIControlStateNormal];
 
    [MVC.view addSubview:pullLeftVCbutton];
    
}

//添加手势
-(void)addRecognizer{
    //    添加拖拽
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didPanEvent:)];
    
    [self.view addGestureRecognizer:pan];
    
    
    
}


//实现拖拽
-(void)didPanEvent:(UIPanGestureRecognizer *)recognizer{
    
    
    // 1. 获取手指拖拽的时候, 平移的值
    CGPoint translation = [recognizer translationInView:[self.view.subviews objectAtIndex:2]];
    
    // 2. 让当前控件做响应的平移
    [self.view.subviews objectAtIndex:2].transform = CGAffineTransformTranslate([self.view.subviews objectAtIndex:2].transform, translation.x, 0);
    
    [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
    
    // 3. 每次平移手势识别完毕后, 让平移的值不要累加
    [recognizer setTranslation:CGPointZero inView:[self.view.subviews objectAtIndex:2]];
    
    //获取最右边范围
    CGAffineTransform  rightScopeTransform = CGAffineTransformTranslate(self.view.transform,[UIScreen mainScreen].bounds.size.width/2 -50, 0);
    
    self.rightScopeTransform = rightScopeTransform;
    
    NSLog(@"rightScopeTransform.tx:%f",rightScopeTransform.tx);
    
    NSLog(@"[self.view.subviews objectAtIndex:2].transform.tx:%f",[self.view.subviews objectAtIndex:2].transform.tx);

    
    //    当移动到右边极限时
    if ([self.view.subviews objectAtIndex:2].transform.tx >rightScopeTransform.tx) {
        
        //        限制最右边的范围
        [self.view.subviews objectAtIndex:2].transform = rightScopeTransform;
        //        限制透明view最右边的范围
        [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
        
        //        当移动到左边极限时
    }else if ([self.view.subviews objectAtIndex:2].transform.tx < 0.0){
        
        //        限制最左边的范围
        [self.view.subviews objectAtIndex:2].transform=CGAffineTransformTranslate(self.view.transform,0, 0);
        //    限制透明view最左边的范围
        [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
        
    }
    //    当托拽手势结束时执行
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.2 animations:^{
           //调整左侧划出来的距离
            if ([self.view.subviews objectAtIndex:2].x >= [UIScreen mainScreen].bounds.size.width /2 -50) {
                
                [self.view.subviews objectAtIndex:2].transform=rightScopeTransform;
                
                [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
                
            }else{
                
                [self.view.subviews objectAtIndex:2].transform = CGAffineTransformIdentity;
                
                [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
            }
        }];
    }
}

- (void)tapAction
{
 
    if (!isTap) {
 
        [self.view.subviews objectAtIndex:2].transform = CGAffineTransformTranslate(self.view.transform,[UIScreen mainScreen].bounds.size.width/2 -50, 0);
 
        [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
        isTap = YES;
 
    }else {
 
        [self.view.subviews objectAtIndex:2].transform=CGAffineTransformTranslate(self.view.transform,0, 0);
 
        [self.view.subviews objectAtIndex:1].ttx=[self.view.subviews objectAtIndex:2].ttx/3;
        isTap = NO;
        
    }
 
}


@end
