//
//  main.m
//  App
//
//  Created by huangxinping on 4/24/14.
//  Copyright (c) 2014 ShareMerge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <UI7Kit/UI7Kit.h>

int main(int argc, char *argv[]) {
	@autoreleasepool {
		[UI7Kit patchIfNeeded];
		[[UI7Kit kit] setTintColor:[UIColor whiteColor]];
//		[[UI7Kit kit] setBackgroundColor:[UIColor yellowColor]];
		[[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:145/255.0f green:80/255.0f blue:204/255.0f alpha:1.0f]];
//		[[UINavigationBar appearance] setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
		return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}
