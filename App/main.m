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
		return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}
