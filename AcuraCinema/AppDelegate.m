//
//  AppDelegate.m
//  AcuraCinema
//
//  Created by David Yu on 17/3/16.
//  Copyright © 2016年 yanwei. All rights reserved.
//

#import "AppDelegate.h"
#import "YWHomeViewController.h"
#import "YWLiveViewController.h"
#import "YWExpandViewController.h"
#import "YWMineViewController.h"
#import "YWMoreViewController.h"

#define kDeviceScreenFrame [UIScreen mainScreen].bounds

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    UITabBarController      *_tabBar;
    UINavigationController  *_homeNV;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:kDeviceScreenFrame];
    self.window.backgroundColor = [UIColor whiteColor];
    _tabBar = [[UITabBarController alloc] init];
    self.window.rootViewController = _tabBar;

    NSArray *vcNames = @[@"YWHomeViewController", @"YWLiveViewController", @"YWExpandViewController", @"YWMoreViewController", @"YWMineViewController"];
    NSArray *vcTitles = @[@"优播", @"直播", @"频道", @"更多", @"会员"];
    NSArray *vcImages = @[@"home_normal.png", @"notification_normal.png", @"mine_normal.png", @"notification_normal.png", @"mine_normal.png"];
    NSArray *vcSelectImages = @[@"home_select.png", @"notification_select.png", @"mine_select.png", @"notification_select.png", @"mine_select.png"];
    
    for (NSInteger i=0; i<vcNames.count; i++) {
        [self addChildViewControllerName:vcNames[i] title:vcTitles[i] imageName:vcImages[i] selectImageName:vcSelectImages[i]];
    }

    return YES;
}

- (void)addChildViewControllerName:(NSString *)vcName title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName {
    id vc = (UIViewController *)[[NSClassFromString(vcName) alloc] init];
    _homeNV = [[UINavigationController alloc] initWithRootViewController:vc];
    _homeNV.title = title;
    _homeNV.tabBarItem.image = [UIImage imageNamed:imageName];
    _homeNV.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    [_tabBar addChildViewController:_homeNV];
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
