//
//  AppDelegate.m
//  FunctionDemoTest
//
//  Created by lizhenzhen on 2020/3/5.
//  Copyright © 2020 devlzz. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "CategoryViewController.h"
#import "CartViewController.h"
#import "MineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    // 1.创建UIWindow
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // 设置UIWindow的背景颜色
    self.window.backgroundColor = [UIColor whiteColor];
    // add TabbarVC
    [self createTabbarViewControllers];
    
    [self.window makeKeyAndVisible];
    
    return YES;

}

#pragma mark -- add TabbarVC ---
- (void)createTabbarViewControllers {
    HomeViewController *homeVC = [HomeViewController new];
    CategoryViewController *cateVC = [CategoryViewController new];
    CartViewController *cartVC = [CartViewController new];
    MineViewController *mineVC = [MineViewController new];
    
    UINavigationController *homeNav = [self addChildViewController:homeVC title:@"Home" image:@"home"];
    UINavigationController *cateNav = [self addChildViewController:cateVC title:@"Cate" image:@"cate"];
    UINavigationController *cartNav = [self addChildViewController:cartVC title:@"Cart" image:@"cart"];
    UINavigationController *mineNav = [self addChildViewController:mineVC title:@"Mine" image:@"mine"];
    
    // UITabBarController 的使用和设置 https://www.jianshu.com/p/f2984d0d51f7
    UITabBarController *tabbarVC = [[UITabBarController alloc] init];
    tabbarVC.viewControllers = @[homeNav,cateNav,cartNav,mineNav];
    tabbarVC.selectedIndex = 1;

    self.window.rootViewController = tabbarVC;
}

/**
 往tabbar添加一个子控制器
 
 @param childController 子控制器
 @param title 子控制器的title
 @param image tabbar的图片名字
 */
- (UINavigationController *)addChildViewController:(UIViewController *)childController title: (NSString *)title image: (NSString *)image {
    childController.title = title;
    
    // 设置tabbarItem的文字大小和颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11], NSForegroundColorAttributeName: [UIColor orangeColor]} forState:UIControlStateSelected];
    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11], NSForegroundColorAttributeName: [UIColor darkGrayColor]} forState:UIControlStateNormal];
    
    // 设置tabbar的图片
    // 如果没有传图片(中间的占位控制器), 就不设置tabbar的image
    if (image != nil) {
        childController.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@", image]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        childController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%@_selected", image]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:childController];
    
    return navController;
}

//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
