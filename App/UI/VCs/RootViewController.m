/**
 *  RootViewController.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-01.
 *
 *  根视图控制器
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker


#import "RootViewController.h"
#import "NetController.h"
#import <LASIImageView/LASIImageView.h>
#import "SVProgressHUD.h"
#import <JDStatusBarNotification/JDStatusBarNotification.h>

@interface RootViewController () <UIGestureRecognizerDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self monitoringNetwork];

    if ([UIDevice systemVersionGreaterThanAndEqualTo:@"7.0"])
    {
        [self setNeedsStatusBarAppearanceUpdate];
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
        [self.navigationController.navigationBar hideBottomHairline];
    }
    else
    {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [self.navigationController.navigationBar setFrame:CGRectMake(0, 20, 320, 44)];
        [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    }

    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
         UITextAttributeTextColor: [UIColor whiteColor],
         UITextAttributeTextShadowColor: [UIColor colorWithRed:0.0
                                                         green:0.0
                                                          blue:0.0
                                                         alpha:0.0],
         UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
         UITextAttributeFont: [UIFont fontWithName:@"Helvetica-Light"
                                              size:17.0f]
     }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [JDStatusBarNotification setDefaultStyle:^JDStatusBarStyle *(JDStatusBarStyle *style) {
        style.barColor = [UIColor colorWithRed:0.075
                                         green:0.596
                                          blue:0.663
                                         alpha:1.000];
        style.textColor = [UIColor whiteColor];
        return style;
    }];

    [[LASIImageView sharedProgressAppearance] setType:LProgressTypeCircle];
    [[LASIImageView sharedProgressAppearance] setSchemeColor:[UIColor colorWithRed:0.075 green:0.596 blue:0.667 alpha:1.000]];
    [[LASIImageView sharedRequestSettings] setSecondsToCache:3600 * 12];

    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - statusbar
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

#pragma mark - protocol
- (void)monitoringNetwork
{
    static BOOL tipShow = NO;

    [[SVProgressHUD appearance] setHudBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.510]];
    static AFNetworkReachabilityStatus lastNetworkStatus = AFNetworkReachabilityStatusUnknown;
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
                                                      if (lastNetworkStatus != status && tipShow)
                                                      {
                                                      switch (status)
                                                      {
                                                      case AFNetworkReachabilityStatusUnknown:
                                                      case AFNetworkReachabilityStatusNotReachable:
                                                      {
                                                      UIImage *image = [UIImage imageNamed:@"disconnect_flag.png"];
                                                      [SVProgressHUD                               showImage:image
                                                                        status:@"网络连接丢失"];
                                                      break;
                                                      }

                                                      case AFNetworkReachabilityStatusReachableViaWWAN:
                                                      {
                                                      UIImage *image = [UIImage imageNamed:@"cellular_flag.png"];
                                                      [SVProgressHUD                               showImage:image
                                                                        status:@"切换至蜂窝"];
                                                      break;
                                                      }

                                                      case AFNetworkReachabilityStatusReachableViaWiFi:
                                                      {
                                                      UIImage *image = [UIImage imageNamed:@"wifi_flag.png"];
                                                      [SVProgressHUD                               showImage:image
                                                                        status:@"切换至Wi-Fi"];
                                                      break;
                                                      }

                                                      default:
                                                      break;
                                                      }
                                                      }

                                                      lastNetworkStatus = status;
                                                      tipShow = YES;
                                                  }];
}

@end
