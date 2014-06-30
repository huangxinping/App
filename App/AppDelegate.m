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
#import "GT/GTInterface.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    {     // 注册UI引擎
        [[UIEngine defaultUIEngine] registerObserver];
    }
    {   // 注册该项目真实使用的语种列表
        [SMLanguageManager registerActualSupportedLanguage:@[KSMChinese_Sim]];
    }
    {     // 友盟分析
        [MobClick startWithAppkey:@"535a27b356240b1768015126" reportPolicy:REALTIME channelId:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]];
    }
    {     // 评价
        [Appirater setAppId:@"552035781"];
        [Appirater setDaysUntilPrompt:1];
        [Appirater setUsesUntilPrompt:10];
        [Appirater setSignificantEventsUntilPrompt:-1];
        [Appirater setTimeBeforeReminding:2];
        [Appirater setDebug:YES];
    }

    {     // fps
#ifdef DEBUG
        [[RRFPSBar sharedInstance] setHidden:NO];
        [[RRFPSBar sharedInstance] setShowsAverage:YES];
#endif
    }

    {     // GT核心
#ifdef DEBUG
        [self initGT];
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

- (void)initGT
{
//    GT_DEBUG_INIT;
//    return;
#ifndef GT_DEBUG_DISABLE
    NSLog(@"Start GT");

//    for (int i = 0; i < 10; i++) {
//        GT_LOG_D("DEMO", "initGT i: %d multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine  multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine  multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine  multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine  multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine  multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine multiLine END", i);
//    }

    GT_LOG_START("icaftest");
    GT_LOG_D("tagFun", "%.2lldMB", GT_UTIL_GET_APP_MEM / (1024 * 1024));
    GT_LOG_END("icaftest");

//    GT_LOG_D("UTIL","cpuUsage:69.");
//    GT_LOG_D("UTIL","cpuUsage:%f", GT_UTIL_GET_CPU_USAGE);
//    GT_OC_LOG_D(@"UTIL",@"cpuUsage:%f", GT_UTIL_GET_CPU_USAGE);
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];

// GT Usage(合入) 初始化
    GT_DEBUG_INIT;
//    GT_LOGO_POINT_SET(300,200);
//    GT_AC_SHOW;

// GT Usage(合入) 设置GT logo不旋转及支持方向
    GT_DEBUG_SET_AUTOROTATE(false);
    GT_DEBUG_SET_SUPPORT_ORIENTATIONS(UIInterfaceOrientationMaskPortrait);

// GT Usage(profiler) 打开profiler功能
    GT_TIME_SWITCH_SET(YES);

// GT Usage(输入参数) 注册输入参数
    NSArray *array = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    GT_OC_IN_REGISTER(@"并发线程数", @"TN", array);

    array = [NSArray arrayWithObjects:@"true", @"false", nil];
    GT_OC_IN_REGISTER(@"KeepAlive", @"KA", array);

    array = [NSArray arrayWithObjects:@"15", @"10", @"20", nil];
    GT_OC_IN_REGISTER(@"读超时", @"超时", array);

    array = [NSArray arrayWithObjects:@"false", @"true", nil];
    GT_OC_IN_REGISTER(@"Cache缓存", @"缓存", array);

    array = [NSArray arrayWithObjects:@"150", @"200", nil];
    GT_OC_IN_REGISTER(@"AddedMem", @"ADDM", array);

    array = [NSArray arrayWithObjects:@"5", @"4", @"3", @"2", @"1", nil];
    GT_OC_IN_REGISTER(@"Interval", @"INTE", array);

// GT Usage(输入参数) 设置在悬浮框上展示的输入参数
    GT_OC_IN_DEFAULT_ON_AC(@"并发线程数", @"KeepAlive", nil);

// GT Usage(输出参数) 注册输出参数
    GT_OC_OUT_REGISTER(@"下载耗时", @"耗时");
    GT_OC_OUT_REGISTER(@"实际带宽", @"带宽");
    GT_OC_OUT_REGISTER(@"singlePicSpeed", @"SSPD");

    GT_OC_OUT_HISTORY_CHECKED_SET(@"下载耗时", YES);

    GT_OC_OUT_REGISTER(@"numberOfDownloadedPics", @"NDP");
    GT_OC_OUT_REGISTER(@"本次消耗流量", @"流量");

//    GT_OC_OUT_WARNING_OUT_OF_RANGE_SET(@"App Smoothness", 2, 60, M_GT_UPPER_WARNING_INVALID);
//    GT_OC_OUT_WARNING_OUT_OF_RANGE_SET(@"App CPU", 1, M_GT_LOWER_WARNING_INVALID, 60);

// GT Usage(输出参数) 设置在悬浮框上展示的输出参数
    GT_OC_OUT_DEFAULT_ON_AC(@"App CPU", @"App Memory", @"App Smoothness");
    GT_OC_OUT_DEFAULT_ON_DISABLED(@"singlePicSpeed", @"numberOfDownloadedPics", @"本次消耗流量", nil);

//    GT_OUT_MONITOR_INTERVAL_SET(0.1);
//    GT_OUT_GATHER_SWITCH_SET(YES);

    GT_OC_LOG_D(@"DEMO", @"DEMO GT INIT FINISH.");
    NSLog(@"End GT");
#endif /* ifndef GT_DEBUG_DISABLE */
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
