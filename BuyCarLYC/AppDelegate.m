//
//  AppDelegate.m
//  BuyCarLYC
//
//  Created by laiyongche on 16/4/26.
//  Copyright © 2016年 LYC. All rights reserved.
//

#import "AppDelegate.h"
#import "LYCTabBarController.h"
#import "LYCMainViewController.h"
#import "LYCBottomSliderController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    LYCLeftViewController *leftVC = [[LYCLeftViewController alloc] init];
    
    // Override point for customization after application launch.
  
//    LYCViewController *lycViewController = [[LYCViewController alloc] init];
//    
//    NSArray *viewControllers = @[lycViewController];
//    
//    LYCTabBarController *tabbarController = [[LYCTabBarController alloc] init];
//    
//    tabbarController.viewControllers  = viewControllers;
//    
//    self.window.backgroundColor = [UIColor cyanColor];
   
    
//    UINavigationController *mainTabVCNavigation = [[UINavigationController alloc]initWithRootViewController:tabbarController];
    
//    [mainTabVCNavigation setNavigationBarHidden:YES];
    
 
    
//    self.window.rootViewController = slideZoomMenu;

    LYCBottomSliderController *CVC=[[LYCBottomSliderController alloc]init];
    
    self.window.rootViewController= CVC;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
