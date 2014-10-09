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

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [UI7Kit patchIfNeeded];
        [[UI7Kit kit] setTintColor:[UIColor whiteColor]];
        [[UI7Kit kit] setBackgroundColor:[UIColor colorWithRed:0.075 green:0.596 blue:0.663 alpha:1.000]];
        [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:0.075 green:0.596 blue:0.663 alpha:1.000]];
        [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:0 forBarMetrics:UIBarMetricsDefault];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
