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
#import "CoreEngine+Send.h"

@interface RootViewController () <UIGestureRecognizerDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	if (![UIDevice connectedToNetwork]) {
		ShowToastWithText(SMLocalization(@"capability.network error"));
		return;
	}

	if ([UIDevice systemVersionGreaterThanAndEqualTo:@"7.0"]) {
		[self setNeedsStatusBarAppearanceUpdate];
		self.navigationController.interactivePopGestureRecognizer.enabled = YES;
		self.navigationController.interactivePopGestureRecognizer.delegate = self;
	}

	[self.navigationController.navigationBar hideBottomHairline];
	[self.navigationController.navigationBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor],
	                                                                   NSFontAttributeName : [UIFont systemFontOfSize:17] }];
	[self.navigationController.navigationBar setArrowColor:[UIColor whiteColor]];

	[[UIEngine defaultUIEngine] bridgeExpressWithName:ExampleObserver
	                                           params:@{
	     @"os": [[UIDevice systemName] urlEncodedString],
	     @"uuid":[@"A2A9DA84-7B56-4A51-99DD-374A8F9457AA" urlEncodedString]
	 }
	                                      addObserver:self
	                                         callback:@{
	     NetExampleSuccess: NSStringFromSelector(@selector(requestSuccess:)),
	     NetExampleFailure: NSStringFromSelector(@selector(requestFailure:))
	 } overrideSame:YES];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark - statusbar
- (UIStatusBarStyle)preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
	return YES;
}

- (void)requestSuccess:(NSNotification *)notification {
	SMLog(@"%@", notification.object);
}

- (void)requestFailure:(NSNotification *)notification {
}

@end
