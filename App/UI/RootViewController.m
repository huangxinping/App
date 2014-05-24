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
		[self.navigationController.navigationBar hideBottomHairline];
	}
	else {
		[[UIApplication sharedApplication] setStatusBarHidden:NO];
		[self.navigationController.navigationBar setFrame:CGRectMake(0, 20, 320, 44)];
		[self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
		[self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
	}

	[self.navigationController.navigationBar setTitleTextAttributes:@{
	     UITextAttributeTextColor: [UIColor whiteColor],
	     UITextAttributeTextShadowColor: [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0],
	     UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
	     UITextAttributeFont: [UIFont fontWithName:@"Helvetica-Light" size:17.0f]
	 }];
	self.view.backgroundColor = [UIColor colorWithRed:0.606 green:0.832 blue:0.365 alpha:1.000];

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
