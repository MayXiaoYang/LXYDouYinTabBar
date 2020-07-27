//
//  AppDelegate.m
//  DouYinTabBar
//
//  Created by liang lee on 2020/7/27.
//  Copyright © 2020 li xiao yang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LXYDouYinTabBarController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    [self goToTabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}

///去主页
- (void)goToTabBarController{
    LXYDouYinTabBarController *tabbarController = [[LXYDouYinTabBarController alloc]init];
    tabbarController.delegate = self;
    self.window.rootViewController = tabbarController;
}

#pragma mark - 生命周期
- (void)applicationWillEnterForeground:(UIApplication *)application{
    NSLog(@"状态** 将要进入前台");
}
- (void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"状态** 已经活跃");
}
- (void)applicationWillResignActive:(UIApplication *)application{
    NSLog(@"状态** 将要进入后台");
}
- (void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"状态** 已经进入后台");
}
- (void)applicationWillTerminate:(UIApplication *)application{
    NSLog(@"状态** 将要退出程序");
}
///这里当你需要登录才能点进这个VC的时候可以在这个方法里处理逻辑
//- (BOOL) shouldxxxx，是否允许做某个操作。
//- (void) willxxx，将要做某个操作。
//- (void) didxxx，完成某个操作。
//是否允许选中某个 viewController。
//YES，允许选中，NO，不允许选中。
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    //viewController 为 tabBarController 中 viewControllers 数组中的对象。
//    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
//    if (!isLogin) {
//        if (index == 2 || index == 3) {
//            Class class = NSClassFromString(@"PSLoginAndRegisterViewController");
//            [tabBarController.selectedViewController presentViewController:[class new] animated:YES completion:nil];
//            return NO;
//        }
//    }
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    //判断，然后让第一个页面刷新。
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    NSLog(@"index------>>>%ld",index);
    
    //这里是为了动态修改tabbar的背景色
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tabbarSelectedIndexNotification" object:nil userInfo:@{@"index":@(index)}];
    
    LXYDouYinTabBarController *tabbar_c = (LXYDouYinTabBarController *)tabBarController;
    
    CGRect frame = tabbar_c.douyinTabBar.indicatorLine.frame;
    if (index == 0) {
        frame.origin.x = 1/15.0f*[UIScreen mainScreen].bounds.size.width;
    }else if (index == 1){
        frame.origin.x = 4/15.0f*[UIScreen mainScreen].bounds.size.width;
    }else if (index == 2){
        frame.origin.x = 10/15.0f*[UIScreen mainScreen].bounds.size.width;
    }else if (index == 3){
        frame.origin.x = 13/15.0f*[UIScreen mainScreen].bounds.size.width;
    }
    tabbar_c.douyinTabBar.indicatorLine.frame = frame;
}

@end
