//
//  AppAppDelegate.m
//  App
//
//  Created by huangxinping on 4/24/14.
//  Copyright (c) 2014 ShareMerge. All rights reserved.
//

#import "AppDelegate.h"
#import "MobClick.h"
#import "DurexKit.h"
#import <COSTouchVisualizerWindow.h>
#import <Appirater/Appirater.h>
#import <RRFPSBar/RRFPSBar.h>
#import <NUI/NUISettings.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    [NUISettings initWithStylesheet:@"Switchboard.NUI"];

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.window.backgroundColor = [UIColor blackColor];

    {   // 注册该项目真实使用的语种列表
        [SMLanguageManager registerActualSupportedLanguage:@[KSMChinese_Sim]];
    }

    {     // 友盟分析
        [MobClick startWithAppkey:UMENG_KEY reportPolicy:REALTIME channelId:nil];
    }

    {     // 评价
        [Appirater setAppId:APPSTORE_ID];
        [Appirater setDaysUntilPrompt:1];
        [Appirater setUsesUntilPrompt:10];
        [Appirater setSignificantEventsUntilPrompt:-1];
        [Appirater setTimeBeforeReminding:2];
        [Appirater setDebug:YES];
        [Appirater appLaunched:NO];
    }

    {     // MVVM
        [TMOSmarty initialize];
    }
    //    SMLog(@"%@", [[[UIDevice currentDevice] identifierForVendor] UUIDString]);

    {     // fps
#ifdef DEBUG
        [[RRFPSBar sharedInstance] setHidden:NO];
        [[RRFPSBar sharedInstance] setShowsAverage:YES];
#endif
    }
    return YES;
}

- (COSTouchVisualizerWindow *)window
{
    static COSTouchVisualizerWindow *customWindow = nil;

    if (!customWindow)
    {
        customWindow = [[COSTouchVisualizerWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [customWindow setFillColor:[UIColor yellowColor]];
        [customWindow setStrokeColor:[UIColor purpleColor]];
        [customWindow setTouchAlpha:0.4];

        [customWindow setRippleFillColor:[UIColor yellowColor]];
        [customWindow setRippleStrokeColor:[UIColor purpleColor]];
        [customWindow setRippleAlpha:0.1];
    }

    return customWindow;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
