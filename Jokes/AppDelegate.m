//
//  AppDelegate.m
//  Jokes
//
//  Created by Benjamin Kolosov on 02/06/2018.
//  Copyright © 2018 Benjamin Kolosov. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    self.window.rootViewController = navController;
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
